<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path2" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>JOIN</title>
<jsp:include page="../head.jsp"></jsp:include></head>
<body>
	<!-- 헤더 부분 include -->
	<header id="hd">
    		<jsp:include page="../header.jsp"></jsp:include>
    </header><hr><hr><hr><hr>
	<div class="container">
	<main class="contents" style="margin-top: 100px;">
		<div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
	    	<nav class="breadcrumb" aria-label="breadcrumbs">
			  
			  
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<h2 class="page-title">회원 가입</h2>
    		<hr>
    		<div class="page-wrap">
            	<form name="frm1" id="frm1" action="${path2 }/member/joinPro.do" method="post" onsubmit="return joinCheck(this)">
                	<table id="table1">
	                    <tbody>
	                    <tr>
	                        <tr>
	                        <th style="background-color:#dcdcdc">이메일</th>
	                        <td>
	                            <input type="email" name="email" id="email" placeholder="이메일 입력" maxlength="30" class="input" required>
	                        </td>
	                    </tr>
	                    </tr>
	                    <tr>
	                        <th style="background-color:#dcdcdc">비밀번호</th>
	                        <td>
	                            <input type="password" name="pw" id="pw" placeholder="비밀번호 입력" maxlength="25" class="input" required>
	                            <!-- pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$"  -->
	                        </td>
	                    </tr>
	                    <tr>
	                        <th style="background-color:#dcdcdc">비밀번호 확인</th>
	                        <td>
	                            <input type="password" name="pw2" id="pw2" placeholder="비밀번호 확인 입력" maxlength="25" class="input" required>
	                            <!-- pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$"  -->
	                        </td>
	                    </tr>
	                    <tr>
	                        <th style="background-color:#dcdcdc">이름</th>
	                        <td>
	                            <input type="text" name="name" id="name" placeholder="이름 입력" class="input" maxlength="40" required>
	                        </td>
	                    </tr>
	                    <tr>					
					    <td>
					        <input type="checkbox" name="ageCheck" id="ageCheck" required>
					        <label for="ageCheck">본인은 만14세 이상입니다</label>
					    </td>
						</tr>
	                                      
	                    <tr>
	                        <td colspan="2">
	                        	<div class="buttons">
		                            <input type="submit" class="button is-danger" value="회원 가입" >
		                            <input type="reset" class="button is-info" value="취소" >
	                            </div>
	                        </td>
	                    </tr>
	                    </tbody>
	                </table>
	            </form>
	            

				<script>
				    function joinCheck(form) {
				        if (form.pw.value !== form.pw2.value) {
				            alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
				            form.pw.focus();
				            return false;
				        }
				
				        if (!form.ageCheck.checked) {
				            alert("본인은 만14세 이상입니다를 체크해주세요.");
				            return false;
				        }
				
				        return true;
				    }
				</script>
	        </div>
	    </section>
	</main>
</div>

</body>
</html>