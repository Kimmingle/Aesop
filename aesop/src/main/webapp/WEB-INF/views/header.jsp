<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path1" value="${pageContext.request.contextPath }" />

<div id="header_wrap">
    <div id="logo_wrap">
        <div id="logo_imgwrap"><img src="${path1}/resources/images/main/image_logo.png" alt="로고"></div>
    </div>
    <nav id="gnb">
        <ul id="mainmenu">
            <a href=""><li class="menu">스킨케어</li></a>
            <a href=""><li class="menu">바디&핸드</li></a>
            <a href=""><li class="menu">홈</li></a>
            <a href=""><li class="menu">헤어</li></a>
            <a href=""><li class="menu">향수</li></a>
            <a href=""><li class="menu">키트&트레블</li></a>
            <a href=""><li class="menu">읽기</li></a>
            <a href="${path1 }/member/logout.do"><li class="menu">스토어</li></a>
            <a href="${path1 }/board/GetQnaList.do"><li class="menu">게시판</li></a>
            <a href=""><li class="menu">검색</li></a>
            <a href="${path1 }/socket/userTest"><li class="menu">user채팅</li></a>
            <a href="${path1 }/socket/adminTest"><li class="menu">admin채팅</li></a>
        </ul>
    </nav>
    <nav id="tnb">
        <ul id="topmenu">
        <c:if test="${semail.equals('admin@aesop.com')}">
        	<a href=""><li class="topitem">관리자 페이지</li></a>
    	</c:if>
         <c:if test="${!empty semail}">
            <a href="${path1}/member/mypage.do"><li class="topitem">마이페이지</li></a>
            <a href="${path1}/member/wishList.do"><li class="topitem">위시리스트</li></a>
            <a href="${path1}/member/cart.do"><li class="topitem">카트</li></a>
        </c:if>
        <c:if test="${empty semail}">
            <a href="${path1}/member/login.do"><li class="topitem">로그인</li></a>
            <a href="${path1}/member/login.do"><li class="topitem">위시리스트</li></a>
            <a href="${path1}/member/login.do"><li class="topitem">카트</li></a>
        </c:if>
        
        </ul>
    </nav>
</div>
<script>
var didScroll;
var lastScrollTop = 0;
var delta = 5;
var navbarHeight = $('header_wrap').outerHeight();

$(window).scroll(function(event){
    didScroll = true;
});

setInterval(function() {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);

function hasScrolled() {
    var st = $(this).scrollTop();
    
    // Make sure they scroll more than delta
    if(Math.abs(lastScrollTop - st) <= delta)
        return;
    
    // If they scrolled down and are past the navbar, add class .nav-up.
    // This is necessary so you never see what is "behind" the navbar.
    if (st > lastScrollTop && st > navbarHeight){
        // Scroll Down
        $('header_wrap').removeClass('nav-down').addClass('nav-up');
    } else {
        // Scroll Up
        if(st + $(window).height() < $(document).height()) {
            $('header_wrap').removeClass('nav-up').addClass('nav-down');
        }
    }

lastScrollTop = st;
}

</script>