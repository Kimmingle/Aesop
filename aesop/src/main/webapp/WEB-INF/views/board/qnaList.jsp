<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="path1" value="<%=request.getContextPath() %>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>${title }</title>
<jsp:include page="../head.jsp"></jsp:include>
<script src="${path1 }/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="${path1 }/css/jquery.dataTables.css" >
<style>

.page_title { font-size:36px; padding-top:2em; text-align:center; }
th.item1 { width:8%; }
th.item2 { width:50%; }
th.item3 { width:15%; }
th.item4 { width:15%; }
</style>
</head>
<body>


	<header id="hd">
    		<jsp:include page="../header.jsp"></jsp:include>
    </header>
    
    
<div id="contents">
	<section class="page" id="page1">
		<div style="width:1400px; margin:0 auto;">
			<nav aria-label="breadcrumb" style="text-align:right">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><a href="#">Home</a></li>
			    <li class="breadcrumb-item"><a href="${path1 }/GetQnaList.do">질문 및 답변</a></li>
			    <li class="breadcrumb-item active" aria-current="page">질문 및 답변 목록</li>
			  </ol>
			</nav>
			<hr>
		</div>
		<div style="width:1400px; margin:0 auto;">
			<h3 class="page_title">QnA</h3>
			<div>
				<table class="table" id="tb1">
					<thead>
						<tr>
							<th class="item1">번호</th>
							<th class="item2">제목</th>
							<th class="item3">작성일</th>
							<th class="item4">조회수</th>
							<th class="item5">작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty qnaList }">
							<c:forEach var="dto" items="${qnaList }" varStatus="status">
							<tr>
							
								<td>${fn:length(qnaList) - status.index }</td>
								<td>
								
									
										
										
									
									
									<!-- <c:if test="${not empty email}">
										<c:if test="${dto.lev==1 }">
										<strong>${dto.title }</strong>
										</c:if>
										<c:if test="${dto.lev==2 }">
										<strong style="padding-left:40px">[답변] ${dto.title }</strong>
										</c:if>
									</c:if>  -->
									
									<c:if test="${(empty email) and (dto.lev==1)}">
									<strong><a href="${path1 }/board/GetQna.do?no=${dto.no }">${dto.title }</a></strong>
									</c:if>
									
								</td>  
								<td>
									<fmt:parseDate value="${dto.resdate }" var="res" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${res }" var="resdate" pattern="yyyy년 MM월 dd일" />
									${resdate }
								</td>
								<td>${dto.hits }</td>
								<td>${dto.member.name }</td>
								
							</tr>
							</c:forEach>
						</c:if>
						<c:if test="${cus.email.equals('admin@aesop.com')}">
							<tr>
							<td>${dto.title }</td>
								<td colspan="5"><strong>질문 및 답변이 존재하지 않습니다.</strong></td>
							</tr>
						</c:if>
					</tbody>
				</table>
				
				
				<script>
				$(document).ready(function(){
					$("#tb1").DataTable({
						order:[[0,"desc"]]
					});
				});
				</script>
				
				<c:if test="${empty email }">
				<div class="btn-group">
				  <a href="${path1 }/board/qIns.do" class="btn btn-secondary">질문 등록</a>
				</div>
				</c:if>
			</div>
		</div>
	</section>	
</div>
<!-- 푸터 부분 인클루드 -->
    <footer id="ft">
    	
    </footer>
</body>
</html>