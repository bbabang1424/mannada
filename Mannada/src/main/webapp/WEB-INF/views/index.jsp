<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="header.jsp"></jsp:include>
<link href="/resources/css/style.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link href="/resources/css/index.css" rel="stylesheet"> 
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDI-f5yrjAVhR8g9-FlTF-s_kLAEnZZ55k&callback=initMap"></script>
<script src="/resources/js/searchAddress.js"></script>
<script>
window.initMap = function () {
	  const map = new google.maps.Map(document.getElementById("map"), {
	    center: { lat: 36.350402, lng: 127.453371 },
	    zoom: 15,
	    disableDefaultUI:true,
	  });
	};
</script>
</head>
<body> 
 	<div class="swiper mySwiper">
	    <div class="swiper-wrapper">
		      <div class="swiper-slide" style="background-image:url(/resources/image/swiper1.jpg);"><span id="slide-1">혼자를 떠나, 모두를 만나다.</span></div>
		      <div class="swiper-slide">Slide 2</div>
		      <div class="swiper-slide">Slide 3</div>
		</div>
		    <div class="swiper-button-next"></div>
		    <div class="swiper-button-prev"></div>
		    <div class="swiper-pagination"></div>
	</div> 

	<div class="container"> 
		<div>
			<div class="category center">
				<div>
					<h2>Category</h2>
				</div>

				<div>
					<div class="category-inner">
						<ul>
							<li><a href="/mannada/category">
								<div class="icon"><img src="/resources/image/purchases.png">
								#공동구매
								</div>
								</a></li>
							<li><a href="/mannada/category">
								<div class="icon"><img src="/resources/image/game.png">
								#게임
								</div>
								</a></li>
							<li><a href="/mannada/category">
								<div class="icon"><img src="/resources/image/spoon.png">
								#식사
								</div>
								</a></li>
							<li><a href="/mannada/category">
								<div class="icon"><img src="/resources/image/sport.png">
								#스포츠
								</div>
								</a></li>
							<li><a href="/mannada/category">
								<div class="icon"><img src="/resources/image/more.png">
								#기타
								</div>
								</a></li>
						</ul>
					</div>
				</div>
			</div>

		<ul>
			<li><a href="/login">사용자로그인</a></li>
			<li><a href="/signup">회원가입</a></li>
			<li><a href="/logout">로그아웃</a></li>
			<li><a href="/mypage/proUpdate/{item.id}">마이페이지</a></li>
			<li><a>${sessionScope.user.name }</a></li>
			<li><a>${sessionScope.manager.id }</a><li>
		</ul>
	
		<ul> 
			<li><a href="/manna/list">만나다</a></li>
			<li><a href="/community/list">커뮤니티</a></li>
			<li>공지사항
				<ul>
					<li><a href="/notice/list">공지사항</a></li>
					<li><a href="/qna/list">QnA</a></li>
				</ul>
			</li>
		</ul>
				
	</div>
</div>

	<div class="tutorial">
		<div class="max-width">
			<ul>
				<li><img src="/resources/image/tuto1.png"><span>만나다 사이트에서<br>함께하고 싶은 모집글 등록</span></li>
				<li><img src="/resources/image/tuto2.png"><span>다른 사람이<br>내 모집글에 참여</span></li>
				<li><img src="/resources/image/tuto3.png"><span>그 사람과 직접 만나<br>하고 싶은 일을 하기!</span></li>
			</ul>
		</div>
	</div>
	
 	<div class="mannam-map"> 
		<div id="map-layer">
			<div class="layer-inner">
				<div>
					<h3>나에게 맞는 <b>맞춤 만남</b>은?</h3>
				</div>
				<form name="addrSearch" action="searchAddress">
					<div>
						<input type="radio" name="addressType" value="road" checked>도로명 <input type="radio" name="addressType" value="jibun">지번 
					</div>
					<div>
						<select id="metro" name="metro">
							<option value="선택하세요">선택하세요</option>				
						</select>
					</div>
					<div>
						<select id="city" name="city">
							<option value="선택하세요">선택하세요</option>
						</select>
					</div>
					<div>
						<select id="address" name="address">
							<option value="0">선택하세요</option>
						</select>
					</div>
					<div>
						<button id="searchAddress">검색</button>
					</div>
				</form>
			</div>
		</div> 
 		<div id="map" style="width: 100%; height: 550px;"></div>
 	</div>
 	
<jsp:include page="footer.jsp"></jsp:include>
 <!-- Swiper JS -->
 <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
 <!-- Initialize Swiper -->
 <script src="/resources/js/index.js"></script>

</body>
</html>