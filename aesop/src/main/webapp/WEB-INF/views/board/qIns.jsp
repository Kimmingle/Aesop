<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path0" value="<%=request.getContextPath() %>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<jsp:include page="../head.jsp"></jsp:include></head>
<style>
.container { width:1400px; }
.page { clear:both; height:100vh; }
#page1 { background-color:#ececec; }
#page2 { background-color:#42bcf5; }
.page_title { font-size:36px; padding-top:2em; text-align:center; }
</style>
</head>
<body>
<!-- 헤더 부분 include -->
	<header id="hd">
    		<jsp:include page="../header.jsp"></jsp:include>
    </header>
<div id="contents">
	<section class="page" id="page1">
		<div style="width:1400px; margin:0 auto;">
			<nav aria-label="breadcrumb" style="text-align:right">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><a href="#">Home</a></li>
			    <li class="breadcrumb-item"><a href="${path0 }/GetQnaList.do">질문 및 답변</a></li>
			    <li class="breadcrumb-item active" aria-current="page">질문 등록</li>
			  </ol>
			</nav>
			<hr>
		</div>
		<div style="width:1400px; margin:0 auto;">
			<h3 class="page_title">질문 등록</h3>
			<form action="${path0 }/board/qInsPro.do" method="post" enctype="multipart/form-data">
				<table class="table">
					<tbody>
						<tr>
							<th><label for="title">제목</label></th>
							<td>
								<input type="text" name="title" id="title" class="form-control" maxlength="100" required>
							</td>
						</tr>
						<tr>
							<th><label for="content">내용</label></th>
							<td>
								<textarea name="content" id="content" rows="8" cols="80" class="form-control"></textarea>
							</td>
						</tr>
						<tr>
					           
					            <tr>
					                <th><label for="qnaImg1">이미지 1</label></th>
					                <td>
					                    <input type="file" name="qnaImg1" id="qnaImg1" accept="image/*"/>
					                    <div class="select_img"><img src="" /></div>
					                </td>
					            </tr>
					            
					            <script>
  $("#qnaImg1").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
					            
					            
					            <tr>
					                <th><label for="qnaImg2">이미지 2</label></th>
					                <td>
					                    <input type="file" name="qnaImg2" id="qnaImg2" accept="image/*"/>
					                </td>
					            </tr>
					            <tr>
					                <th><label for="qnaImg3">이미지 3</label></th>
					                <td>
					                    <input type="file" name="qnaImg3" id="qnaImg3" accept="image/*"/>
					                </td>
					            </tr>
					</tbody>
				</table>
				<hr>
				<div class="btn-group">
				  <button type="submit" class="btn btn-secondary">질문 등록</button>
				  <a href="${path0 }/GetQnaList.do" class="btn btn-secondary">질문 및 답변 목록</a>
				</div>
			</form>
			
		</div>
	</section>
</div>
<div id="footer">

</div>
</body>
</html>