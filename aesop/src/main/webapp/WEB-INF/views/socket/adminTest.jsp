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
    			<!--  <div class="template"  style="display:none" > 원랜 none인데 일단 보이게  -->
    			
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
    				
    				//System.out.println("Received message from client: " + message);
    				
    				
    				
    				let node = JSON.parse(message.data); // 메시지의 구조는 JSON 형태로 만듦. 
    				
    				//console.log(node);
    				//System.out.println(node);
    				
    				// 메시지의 status는 유저의 접속 형태이다.           
    				if(node.status === "visit") {       // visit은 유저가 접속했을 때 알리는 메시지. 
    					let form = $(".template").html();                  // 위 템플릿 div를 취득.       
    					form = $("<div class='float-left'></div>").attr("data-key",node.key).append(form);   // div를 감싸고 속성 data-key에 unique키 넣음.           
    					$("section").append(form);      // body에 추가한다.  
    					
    					//textmsg.value"새로운 유저가 접속했습니다\n "; <--이거 토스트메세지로
    					
    					
    					
    					
    				} else if(node.status === "message") {          // message는 유저가 메시지를 보낼 때 알려주는 메시지.   
    					let $div = $("[data-key='"+node.key+"']");       // key로 해당 div영역을 찾는다.           
    					let log = $div.find(".console").val();                // console영역을 찾는다. 
    					$div.find(".console").val(log + "(사용자) => " +node.message + "\n");        // 아래에 메시지를 추가한다.     
    					textmsg.value +=("(amin) => " +node.message + "\n");
    					
    				} else if(node.status === "bye") {            // bye는 유저가 접속을 끊었을 때 알려주는 메시지이다.
    					$("[data-key='"+node.key+"']").remove();       // 해당 키로 div를 찾아서 dom을 제거한다. 
    				}      
    			};  
    				
    				
    				// 전송 버튼을 클릭하면 발생하는 이벤트    
    					$(document).on("click", ".sendBtn", function(){      // div 태그를 찾는다.      
    						let $div = $(this).closest(".float-left");      // 메시지 텍스트 박스를 찾아서 값을 취득한다.      
    						let message = $div.find(".message").val();      // 유저 key를 취득한다.      
    						let key = $div.data("key");      // console영역을 찾는다.      
    						let log = $div.find(".console").val();      // 아래에 메시지를 추가한다.     
    						 /*
    						textmsg.value += "(adminSay) => " + message.data + "\n"; 
    						
    						$div.find(".console").val(log + "(admin) => " + message + "\n");      // 텍스트 박스의 값을 초기화 한다.      
    						$div.find(".message").val("");      // 웹소켓으로 메시지를 보낸다.      
    						webSocket.send(key+"#####"+message); */
    						
    						// 텍스트 메시지 영역에 관리자가 보낸 메시지를 추가합니다.
    					    $div.find(".console").val(log + "(관리자) => " + message + "\n");

    					    // 텍스트 박스의 값을 초기화 합니다.
    					    $div.find(".message").val("");

    					    // 웹 소켓으로 메시지를 보냅니다.
    					    webSocket.send(key + "#####" + message);
    					});   
    				
    				
   
    				// 텍스트 박스에서 엔터키를 누르면    
    							
    					$(document).on("keydown", ".message", function(){      // keyCode 13은 엔터이다.      
    						if(event.keyCode === 13) {        // 버튼을 클릭하는 트리거를 발생한다.        
    							$(this).closest(".float-left").find(".sendBtn").trigger("click");        // form에 의해 자동 submit을 막는다.        
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