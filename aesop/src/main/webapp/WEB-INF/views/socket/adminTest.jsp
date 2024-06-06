<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	
	<style>  /* 여러 채팅창 간의 간격과 배열 위치*/  
	.float-left{    
		float:left;    
		margin: 5px;  
	}
	
	</style>

	
	<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
<div class="content">
    <header id="hd">
    	
    		<jsp:include page="../header.jsp"></jsp:include>
    	
    </header>
    <main class="contents">
 	    <section class="page" id="page1">
    		
    		<div >
    		
    		<div style="width: 600px; height: 300px;"  >
    		
    		
    		<h2>AdminChat</h2>
    			
    			<div id="template" class="template" style="display:none; " >  
    				<form>      <!-- 메시지 텍스트 박스 -->      
    					<input type="text" class="message" onkeydown="if(event.keyCode === 13) return false;">      <!-- 전송 버튼 -->     
    					<input  value="Send" type="button" class="sendBtn">    
    				</form>    
    				<br/>    
    				
    				<div>
    					<form action="/socket/file/upload.do" method="post"  enctype="multipart/form-data" style="margin-left:0px;">
             				<input type="file" name="file" />
             				<input class="btn btn-primary btn-sm"  type="submit" value="업로드"/>
        				</form>
					</div>
    			
    				<!-- 서버와 메시지를 주고 받는 콘솔 텍스트 영역 -->    
    				<textarea id="textmsg" rows="10" cols="50" class="console" disabled="disabled"></textarea>  
    			
    			</div>
    			
    			</div>
    		


    			<script type="text/javascript">    // 서버의 broadsocket의 서블릿으로 웹 소켓. 
    			
    			var webSocket = new WebSocket("ws://localhost:8091/myapp/admin");   
    			//endpoint 경로는 웹소켓 객체를 생성할 때 사용되는 경로와 일치해야한다. 
    			//즉 이 경로가 @ServerEndpoint에서 접속할 url
    			
    			
    			
    			
    			webSocket.onopen = function(message) {
    				textmsg.value += "Server connect...\n";
    				
    			};    
    			webSocket.onclose = function(message) {
    				textmsg.value += "close...\n";
    			};    
    			webSocket.onerror = function(message) { 
    				textmsg.value += "error...\n";
    			};      
    			
    			
    			
    			webSocket.onmessage = function(message) {           // 서버로 부터 메시지가 오면  
    				textmsg.value += "(관리자) => " + message.data + "\n"; 
    				
    				
    				
    				
    				
    				let node = JSON.parse(message.data); // 메시지의 구조는 JSON 형태로 만듦. 
    				
    				
    				
    				//유저가 접속했을때 창 띄움        
    				if(node.status === "visit") {       // visit은 유저가 접속했을 때 알리는 메시지. 
    					let form = $(".template").html();                 
    					form = $("<div class='float-left'></div>").attr("data-key",node.key).append(form);   // div를 감싸고 속성 data-key에 unique키 넣음.           
    					$("section").append(form);      // body에 추가한다.  
    					
    					//textmsg.value"새로운 유저가 접속했습니다\n "; <--이거 토스트메세지로 띄우면 보기좋을듯
    					
    					
    					
    				//유저가 메세지 보낼때
    				} else if(node.status === "message") {         
    					let $div = $("[data-key='"+node.key+"']");                 
    					let log = $div.find(".console").val();               
    					$div.find(".console").val(log + "(사용자) => " +node.message + "\n");        //메시지를 추가     
    					textmsg.value +=("(amin) => " +node.message + "\n");
    					
    				} else if(node.status === "bye") {            // bye는 유저가 접속을 끊었을 때 알려주는 메시지이다.
    					$("[data-key='"+node.key+"']").remove();       // 해당 키로 div를 찾아서 dom을 제거한다. 
    				}      
    			};  
    				
    				
    				// 전송 버튼을 클릭하면 발생하는 이벤트    
    					$(document).on("click", ".sendBtn", function(){      // div 태그를 찾는다.      
    						let $div = $(this).closest(".float-left");      
    						let message = $div.find(".message").val();         
    						let key = $div.data("key");          
    						let log = $div.find(".console").val();      // 아래에 메시지를 추가한다.     
    						
    						// 텍스트 메시지 영역에 관리자가 보낸 메시지 추가
    					    $div.find(".console").val(log + "(관리자) => " + message + "\n");

    					    // 텍스트 박스 값 초기화
    					    $div.find(".message").val("");

    					    // 웹 소켓으로 메시지 보냄
    					    webSocket.send(key + "#####" + message);
    					});   
    				
    				
   
    				// 텍스트 박스에서 엔터키를 누르면 마찬가지로 전송  
    							
    					$(document).on("keydown", ".message", function(){      // keyCode 13은 엔터이다.      
    						if(event.keyCode === 13) {        // 버튼을 클릭하는 트리거를 발생한다.        
    							$(this).closest(".float-left").find(".sendBtn").trigger("click");          
    								return false;      
    						}      
    						return true;    
    					});  
    				
    				
    				//파일 보내기 수정
    				function sendFile(){
    					var file = document.getElentById('file').file[0];
    					webSocket.send('filename:' +file.name);
    					alert('test');
    					
    					var reader = new FileReader();
    					var rawData = new ArrayBuffer();
    					
    					reader.loadend = function(){
    						
    					}
    					
    					reader.onload = function(e){
    						rawData = e.target.result;
    						webSocket.send(rawData);
    						alert("파일전송 완료");
    						webSocket.send('end');
    					}
    					
    					reader.readAsArrayBuffer(file);
    					
    				}
    				
    			</script>
    	
    		
    		</div>
    	</section>
    </main>
    <!-- 푸터 부분 인클루드 -->
    <footer id="ft">
    	
    </footer>
   
</body>

</html>