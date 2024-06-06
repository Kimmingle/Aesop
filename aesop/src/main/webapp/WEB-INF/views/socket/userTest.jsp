<%@ page language="java" contentType="text/html charset=UTF8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<jsp:include page="../head.jsp"></jsp:include>
		<link rel="stylesheet" href="${path1}/resources/css/main.css" />
	
</head>
<body>
<div class="content">
    <header id="hd">
    	
    		<jsp:include page="../header.jsp"></jsp:include>
    	
    </header>
    <main class="contents">
 	    <section class="page" id="page1">
    		
    		<div >
    		
    		
    		<div style="width: 600px; height: 300px; margin-top: 100px;"  >
    		<h2>UserChat</h2>
    			<form >    <!-- 텍스트 박스에 채팅의 내용을 작성한다. -->    
    				<input id="textMessage" type="text" onkeydown="return enter()">    <!-- 서버로 메시지를 전송하는 버튼 -->    
    				<input class="button is-info" onclick="sendMessage()" value="Send" type="button">  
    			</form>  <br />  <!-- 서버와 메시지를 주고 받는 콘솔 텍스트 영역 -->  
    			
    			
    			<form action="" method="" enctype="multipart/form-data"> <!-- enctype="multipart/form-data"는 바이너리 파일을 보낼때 사용 -->
             		<input id="file" type="file" name="file">
             		<input onclick="sendImg()" class="button is-light" type="submit" value="업로드">
					
					<!-- {selectFile}함수가 파일을 가져오는데 사용할 실제 함수가 될 것 -->
        		</form>


				<textarea id="messageTextArea" rows="10" cols="60" disabled="disabled"></textarea>
				
				
    		</div>
    				
				
				
    			
    		
    			<script type="text/javascript">    // 서버의 broadsocket의 서블릿으로 웹 소켓을 한다.   
    			
    			var webSocket = new WebSocket("ws://localhost:8091/myapp/broadsocket");    
    			var messageTextArea = document.getElementById("messageTextArea");     
    			
    			webSocket.onopen = function(message) {     // 접속이 완료되면  
    				messageTextArea.value += "Server connect...\n";       // 콘솔에 메시지를 남긴다.    
    			};																       
    			
    			webSocket.onclose = function(message) { };  	 // 접속이 끝기는 경우는 브라우저를 닫는 경우이기 떄문에 이 이벤트는 의미가 없음.     
    			
    			webSocket.onerror = function(message) {    		// 에러가 발생하면           
    				messageTextArea.value += "error...\n";    
    			};  	 // 콘솔에 메시지를 남긴다.      
    			
    			
    			//서버로부터 이전 대화 내용을 가져와서 표시하는 함수
    			function loadPreviousMessages() {
    				
    				//data.forEach(message => {
                    //    messageTextArea.value += `${message.sender} => ${message.chatMsg}\n`;
                    //}); 
    				var xhr = new XMLHttpRequest();
    		        xhr.open('GET', '/getPreviousMessages', true);  //getPreviousMessages엔드 포인트에 get요청을 보내서 이전 채팅을 가져옴
    		        xhr.onreadystatechange = function() {
    		            if (xhr.readyState === 4 && xhr.status === 200) {
    		                // 성공적으로 데이터를 받았을 때 처리
    		                var messages = JSON.parse(xhr.responseText);
    		                displayMessages(messages);
    		            }
    		        };
    		        xhr.send();
    			}
    			
    	
    			
    			
    			webSocket.onmessage = function(message) {      // 서버로부터 메시지가 도착하면 콘솔 화면에 메시지를 남긴다. 
    				messageTextArea.value += "(관리자) => " + message.data + "\n";  
    				
    				
    				
    				
    			};    
    						
    						
    						
				// 서버로 메시지를 발송하는 함수    
				// Send 버튼을 누르거나 텍스트 박스에서 엔터를 치면 실행    
				function sendMessage() {      // 텍스트 박스의 객체를 가져옴      
					let message = document.getElementById("textMessage");      // 콘솔에 메세지를 남긴다.      
					//var msg = JSON.parse(JSON.stringify(post));
					//var key = uuid  //유저 고유번호 어떻게 불러오더라....
					
					messageTextArea.value += "(나) => " + message.value + "\n";      // 소켓으로 보낸다.      
					webSocket.send(message.value);       
					console.log(message.value);
					message.value = "";    // 텍스트 박스 초기화 
					
				}    // 텍스트 박스에서 엔터를 누르면    
					
				
				function enter() {      // keyCode 13은 엔터이다.      
					if(event.keyCode === 13) {        // 서버로 메시지 전송        
						sendMessage();        // form에 의해 자동 submit을 막는다.        
						return false;      
					}      
					return true;    
				}  
				
				
				
				//toDataURL로 이미지를 문자열로 변환해서 보낼것
				function sendImg(){
					var fileInput = document.getElementById('file'); //아이디가 file인 요소를 불러옴
					var rawData = fileInput.toDataURL("imges/jpg", 0.5);  //파일 문자열로 변환
					webSocket.send(rawData);
					
					messageTextArea.value += "(나) => " + message.value + "\n"; //이미지 보여지도록 수정
					
					/*
					var reader = new FileReader();
					reader.onload = function(event){
						webSocket.send(rawData);
					};
					
					reader.readAsDataURL(file);  */
				}
				
				
				//파일을 선택하고 해당 파일의 이름을 메시지로 보내며 선택할 파일을 설정
				function selectFile(e){  //e를 매개변수로 받음
					sendMessage(e.target.files[0].name);  //첫번째로 선택된 파일의 이름 
					
					setFile(e.target.files[0]);
					//두개의 업데이터 함수 호출
				}
    							
    			</script>

    		
    		</div>
    	</section>
    </main>
    <!-- 푸터 부분 인클루드 -->
    <footer id="ft">
    	
    </footer>
</div>    
</body>
</html>