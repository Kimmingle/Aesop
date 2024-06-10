<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path2" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>LOGIN</title>
<jsp:include page="../head.jsp"></jsp:include></head>
<body>
	<!-- 헤더 부분 include -->
	<header id="hd">
    		<jsp:include page="../header.jsp"></jsp:include>
    </header>
    <hr><hr><hr><hr>
	<div class="container">
	<main class="contents" style="margin-top: 100px;">
		<div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
	    	<nav class="breadcrumb" aria-label="breadcrumbs">
			 
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<h2 class="page-title">로그인</h2>
    		<hr>
    		<div class="page-wrap">
	    		<div class="clr-fix">
		            <form action="${path2 }/member/loginPro.do" method="post" name="loginForm">
		                <div class="table_form_wrap">
		                    <table class="table_form">
		                        <tbody>
		                        <tr>
		                            <th><label for="email">이메일</label></th>
		                            <td><input type="text" name="email" id="email" size="50" class="input" placeholder="이메일 입력" required>
		                                <!--  pattern="^[a-z0-9]+$"  -->
		                            </td>
		                        </tr>
		                        <tr>
		                            <th><label for="pw">비밀번호</label></th>
		                            <td><input type="password" name="pw" id="pw"  class="input" placeholder="비밀번호 입력" required>
		                                <!--  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  -->
		                            </td>
		                        </tr>
		                        <tr>
		                            <td colspan="2">
		                            	<div class="buttons">
			                                <input type="submit" class="button" value="로그인">
			                                <input type="reset" class="button" value="취소">
			                                <input type="button" class="button" value="회원가입" onclick="redirectToJoin()">
			                                
			                            </div>    
		                            </td>
		                        </tr>
		                        </tbody>
		                    </table>
		                </div>
		            </form>
		            <script>
		                function loginFaiure() {
		                    alert("로그인 실패");
		                }
		            </script>
		            <script>
					    function redirectToJoin() {
					        window.location.href = "${path2}/member/join.do";
					    }
</script>
		        </div>
			</div>
    	</section>
	</main>
</div>

</body>
</html>