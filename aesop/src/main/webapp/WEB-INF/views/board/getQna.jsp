<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path0" value="<%=request.getContextPath() %>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>QnA 상세보기</title>
<jsp:include page="../head.jsp"></jsp:include>
<style>
.container { width:1400px; }
.page { clear:both; height:100vh; }
#page1 { background-color:#ececec; }
#page2 { background-color:#42bcf5; }
.page_title { font-size:36px; padding-top:2em; text-align:center; }
th.item1 { width:8%; }
th.item2 { width:60%; }
th.item3 { width:20%; }
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
             <li class="breadcrumb-item"><a href="${path0 }/GetQnaList.do">질문 및 답변</a></li>
             <li class="breadcrumb-item active" aria-current="page">질문 및 답변 상세보기</li>
           </ol>
         </nav>
         <hr>
      </div>
      <div style="width:1400px; margin:0 auto;">
         <h3 class="page_title">질문 및 답변 상세보기</h3>
         <div>
            <table class="table">
               <tbody>
                  <tr>
                     <th>글 번호</th>
                     <td>${getQna.no }</td>
                  </tr>
                  <tr>
                     <th>글 제목</th>
                     <td>${getQna.title }</td>
                  </tr>
                  <tr>
                     <th>글 내용</th>
                     <td>${getQna.content }</td>
                  </tr>
                  <tr>
                     <th>작성일시</th>      
                     <td>${getQna.resdate }</td>
                  </tr>
                  <tr>
                     <th>조회수</th>
                     <td>${getQna.hits }</td>
                  </tr>
                  
                  <tr>
                      <td colspan="2">
                          <c:if test="${not empty getQna.qnaImg1}">
                              <img src="${path0}/resources/upload/${getQna.qnaImg1}" alt="${qna.qnaImg1}"/>
                          </c:if>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2">
                          <c:if test="${not empty getQna.qnaImg2}">
                              <img src="${path0}/resources/upload/${getQna.qnaImg2}" alt="${qna.qnaImg2}"/>
                          </c:if>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2">
                          <c:if test="${not empty getQna.qnaImg3}">
                              <img src="${path0}/resources/upload/${getQna.qnaImg3}" alt="${qna.qnaImg3}"/>
                          </c:if>
                      </td>
                  </tr>
               </tbody>
            </table>
            <hr>
            <div class="btn-group">
              <c:if test="${cus.email.equals('admin@aesop.com') and getQna.lev==1 }">
              <a href="${path0 }/qna/aIns.jsp?parno=${getQna.no }" class="btn btn-secondary">답변 등록</a>
              
               <h4>댓글을 입력해 주세요</h4>
                  <!-- 원글에 댓글을 작성할 폼 -->
                  <form class="comment-form insert-form" action="comment_insert" method="post">
                     <!-- 원글의 글번호가 댓글의 ref_group 번호가 된다. -->
                     <input type="hidden" name="ref_group" value="${dto.num }"/>
                     <!-- 원글의 작성자가 댓글의 대상자가 된다. -->
                     <input type="hidden" name="target_id" value="${dto.writer }"/>
               
                     <textarea name="content">${empty id ? '댓글 작성을 위해 로그인이 필요 합니다.' : '' }</textarea>
                     <button type="submit">등록</button>
                  </form>
              
              </c:if>
              <c:if test="${sessionScope.email.equals(getQna.email) }">
                 <c:if test="${qna.lev==1 }">
                 <a href="${path0 }/EditQna.do?no=${getQna.no }" class="btn btn-secondary">질문 수정</a>
                 <a href="${path0 }/DelQuestion.do?parno=${getQna.no }" class="btn btn-secondary">질문 삭제</a>
                 </c:if>
                 <c:if test="${cus.email.equals('admin@aesop.com') and getQna.lev==2 }">
                 <a href="${path0 }/EditQna.do?no=${getQna.no }" class="btn btn-secondary">답변 수정</a>
                 <a href="${path0 }/DelAnswer.do?no=${getQna.no }" class="btn btn-secondary">답변 삭제</a>
                 </c:if>
                </c:if>
              <a href="${path0 }/board/GetQnaList.do" class="btn btn-secondary">질문 및 답변 목록</a>
            </div>
         </div>
      </div>
   </section>
   
   
     
     
</div>

</body>
</html>