<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MAIN</title>
	<jsp:include page="head.jsp"></jsp:include>
	<link rel="stylesheet" href="${path1}/resources/css/main.css" />
</head>
<body>
	<div class="content">
		<header id="header">
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<main>
	      <section class="page" id="page1">
	          <div id="main_image">
	              <div id="maintext_wrap">
	                  <div class="maintext">
	                      <p class="text-ofl">We are what we are,</p>
	                      <p class="text-ofl">the spirit afterwards,</p>
	                  </div>
	                  <div class="maintext"><p class="text-play">but first the touch.</p></div>
	              </div>
	          </div>
	      </section>
	      <section class="page" id="page2">
	          <div id="maintext1">
	              <p class="text-ofl" style="display: inline;">Hydration</p>
	              <p class="text-play" style="display: inline;">for every body</p>
	          </div>
	          <div class="owl-carousel owl-theme">
	              <div class="item" id="product1">
	                  <div class="pcontainer"><img src="${path1}/resources/images/main/image_product1.png" alt="제품1"></div>
	                  <div class="pname">product1</div>
	              </div>
	              <div class="item" id="product2">
	                  <div class="pcontainer"><img src="${path1}/resources/images/main/image_product2.png" alt="제품2"></div>
	                  <div class="pname">product2</div>
	              </div>
	              <div class="item" id="product3">
	                  <div class="pcontainer"><img src="${path1}/resources/images/main/image_product3.png" alt="제품3"></div>
	                  <div class="pname">product3</div>
	              </div>
	              <div class="item" id="product4">
	                  <div class="pcontainer"><img src="${path1}/resources/images/main/image_product4.png" alt="제품4"></div>
	                  <div class="pname">product4</div>
	              </div>
	              <div class="item" id="product5">
	                  <div class="pcontainer"><img src="${path1}/resources/images/main/image_product5.png" alt="제품5"></div>
	                  <div class="pname">product5</div>
	              </div>
	              <div class="item" id="product6">
	                  <div class="pcontainer"><img src="${path1}/resources/images/main/image_product6.png" alt="제품6"></div>
	                  <div class="pname">product6</div>
	              </div>
	          </div>
	          <script>
	              $(document).ready(function(){
	                  $(".owl-carousel").owlCarousel({
	                      loop: true,
	
	                      nav: true,
	                      navText: ['', ''],
	                      responsive: {
	                          0: {
	                              items: 1
	                          },
	                          600: {
	                              items: 2
	                          },
	                          1000: {
	                              items: 4
	                          }
	                      }
	                  });
	              });
	          </script>
	          </section>
	          <section class="page" id="page3">
	              <div class="imagewrap"><img src="${path1}/resources/images/main/image_main_product9.png" alt="엘리"></div>
	              <div>
	                  <div id="maintext2">
	                      <p id="maintext2-1" class="text-ofl" style="display: inline;">Vitamin-enriched</p>
	                      <p id="maintext2-2" class="text-play" style="display: inline;">skin care</p>
	                  </div>
	                  <div id="maintext3">
	                      <p class="text14" id="maintext3-1">
	                      With generous measures of efficacious botanicals <br>and skin-supportive ingredients,<br>
	                      the Skin Care+ range was designed to provide optimal replenishment.
	                      </p>
	                  </div>
	              </div>
	          </section>
	          <section class="page" id="page4">
	              <div id="maintext4">
	                  <p class="text-play" style="font-size: 40px;">Rōzu Ensemble</p>
	                  <p class="text-ofl">A trio of formulations combining </p>
	                  <p class="text-play">vibrant florals and fresh, </p>
	                  <p class="text-play">citrus aromas</p>
	              </div>
	              <div id="maintext4-1">
	                  <p>A tender trio to offer pleasure throughout the day comprising a fragrance and body cleanser infused</p>
	                  <p>with spirited florals, and a citrus-based hand balm.</p>
	                  <a href=""><div class="round-button">제품 더보기</div></a>
	              </div>
	              <div id="black-line" class="text-ofl" style="font-size: 20px; line-height: 2em;">
	                  A trio of formulations combining &nbsp;&nbsp;&nbsp;&nbsp; 
	                  A trio of formulations combining &nbsp;&nbsp;&nbsp;&nbsp; 
	                  A trio of formulations combining &nbsp;&nbsp;&nbsp;&nbsp;
	                  A trio of formulations combining &nbsp;&nbsp;&nbsp;&nbsp;
	                  A trio of formulations combining &nbsp;&nbsp;&nbsp;&nbsp;
	                  A trio of formulations combining &nbsp;&nbsp;&nbsp;&nbsp;
	                  A trio of formulations combining &nbsp;&nbsp;&nbsp;&nbsp;
	              </div>
	              
	              <div id="videoframe">
	                  <video src="${path1}/resources/video/Aesop_Resurrection_2023_Web_Athenaeum_Primary_Mid_Desktop_1920x1080px.mp4" autoplay muted loop></video>
	              </div>
	              <div id="maintext6">
	                  <p class="text-ofl">A sincere interest in intelligent and </p>
	                  <p class="text-ofl">sustainable design extends to every</p>
	                  <div><p class="text-ofl" style="display: inline;"> aspect of </p>
	                      <p class="text-play" style="display: inline;">Aesop’s</p>
	                      <p class="text-ofl" style="display: inline;">workings.</p>
	                  </div>
	              </div>
	          </section>
	          <section class="page" id="page5">
	              <div>
	                  <div class="maintext7">기업체 구매</div>
	                  <p class="maintext7-1">소중한 직원과 고객에게 감사의 마음을 표현하기에 적합한 폭넓은 기프트 옵션을 찾아보세요.<br> 
	                      전문 지식을 갖춘 이솝 컨설턴트가 제품 선택부터 배송까지 도와드립니다.</p>
	                  <a href=""><div class="round-button" style="margin-left: 100px;">contact us</div></a>
	              </div>
	              <div>
	                  <div class="imagewrap" style="border-left: 1px solid #252525;"><img src="${path1}/resources/images/main/image_main_gift.png" alt="기업구매"></div>
	              </div>
	          </section>
	          <section class="page" id="page6">
	              <div>
	                  <div class="imagewrap"><img src="${path1}/resources/images/main/image_main_location.png" alt="스토어"></div>
	              </div>
	              <div>
	                  <div class="maintext7">스토어 로케이터</div>
	                  <p class="maintext7-1">매장에서는 이솝 컨설턴트가 고객 여러분을 따뜻하게 맞이하고<br>
	                      기프트 구매를 위한 맞춤형 컨설팅을 제공해드립니다.</p>
	                  <a href=""><div class="round-button" style="margin-left: 100px;" >store</div></a>
	              </div>
	          </section>
		</main>
	</div>
</body>
</html>
