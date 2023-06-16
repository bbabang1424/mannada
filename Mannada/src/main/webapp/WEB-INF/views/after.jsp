<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다</title>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js" integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
<script>
	window.addEventListener("load", e => {
		// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해야 합니다.
	    Kakao.init('1c5dbd45518c2d8b05ce31ff5c8b207d');

	    // SDK 초기화 여부를 판단합니다.
	    if(Kakao.isInitialized())
	    	console.log("카카오 API 초기화 성공");
	    else
	    	console.log("카카오 API 초기화 실패");
	    
	    document.querySelector(".info").addEventListener("click", e => {
	    	Kakao.API.request({ url: '/v2/user/me',})
	    		  .then(function(response) { console.log(response);})
	    		  .catch(function(error) {console.log(error);});
	    });
	    
	    document.querySelector(".logout").addEventListener("click", e => {
	    	Kakao.Auth.logout()
	    	  .then(function(response) {console.log(Kakao.Auth.getAccessToken()); })
	    	  .catch(function(error) {console.log('Not logged in.');});
	    });
	});
</script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="icon" type="image/ico"  href="/resources/image/favicon.ico"/>
<title>만나다</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="/resources/css/header.css" rel="stylesheet"> 
<link href="/resources/css/footer.css" rel="stylesheet"> 
<style>
	.deco-none, .deco-none a { text-decoration:none; }
</style>
<script> 
$(function() {
	  $('#check_box').on('click', function() {
	    event.stopPropagation();  
	    $('.header-nav').slideToggle('fast');
	  });

	  $('.header-nav').on('click', function() {
	    event.stopPropagation();
	  });
	// 다른 부분 누르면 자동으로 닫히게끔 하는 기능 추가하고 싶음
	

	  var btn = $('#top-button');
	  var btn2 = $('#talk-button');
		
	  /*
		$(window).scroll(function() {
		  if ($(window).scrollTop() > 300) {
		    btn.addClass('show');
		    btn2.addClass('show');
		  } else {
		    btn.removeClass('show');
		    btn2.removeClass('show');
		  }
		 
		});
	*/
		btn.on('click', function(e) {
		  e.preventDefault();
		  $('html, body').animate({scrollTop:0}, '300');
		});

});
</script>

<link href="/resources/css/style.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link href="/resources/css/index.css" rel="stylesheet"> 
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDI-f5yrjAVhR8g9-FlTF-s_kLAEnZZ55k&callback=initMap"></script>
<script src="/resources/js/searchAddress.js"></script>
<link rel="stylesheet" href="/resources/css/manna_list.css">
<link rel="stylesheet" href="/resources/css/community_list.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">
.form-select {
	display: inline-block ! important;
	padding: 0.375rem 2.25rem 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	background-repeat: no-repeat;
	background-position: right 0.75rem center;
	background-size: 16px 12px;
	border: 1px solid #ced4da;
	border-radius: 0.375rem;
	width: 9% !important;
	margin-left: 2% !important;
}

.hide {
	display: none;
}
</style>

<script>
window.initMap = function () {
	  const map = new google.maps.Map(document.getElementById("map"), {
	    center: { lat: 36.350402, lng: 127.453371 },
	    zoom: 15,
	    disableDefaultUI:true,
	  });
	};

const pager_url = "/api/manna";
const pager_item = [ {
	name : "id"
}, {
	name : "category_"
}, {
	name : "title"
}, {
	name : "address"
}, {
	name : "dDay"
}, {
	name : "sum"
}, {
	name : "member"
} ];	


</script>
<script src="/resources/js/manna.js"></script>
</head>
<body>
	
	<div id="header">
		<div class="max-width">
		<div>
		 <div class="flex">
			<div id="logo">
				<a href="/"><img src="/resources/image/logo.png"></a>
			</div>

			<div class="flex-end deco-none">
				<div class="menu">
					<ul>
						<li><a href="/manna/list">만나다</a></li>
						<li><a href="/community/list">커뮤니티</a></li>
						<li><a href="/notice/list">공지사항</a></li>
					</ul>
				</div>
				
				<div class="login">
					<ul>
						<c:if test="${sessionScope.user == null && sessionScope.manager == null}">
							<li><a href="/signup">회원가입</a></li>
							<li><button onclick="location.href='/login'">로그인</button></li>
						</c:if>
						
						<c:if test="${sessionScope.user != null}">
							<li>${sessionScope.user.nickname}님</li>
							<li><button class="logout" onclick="location.href='/logout'">로그아웃</button></li>
						</c:if>
						
						<c:if test="${sessionScope.manager != null}">
							<li><a href="/mg/view/${sessionScope.manager.nickname}">${sessionScope.manager.nickname}님</a></li>
							<li><button onclick="location.href='/logout'">로그아웃</button></li>
						</c:if>
					</ul>
				</div> 
			</div>
				
			<div id="ham">
				<input type="checkbox" id="check_box" />
				    <label for="check_box">
				      <span></span>
				      <span></span>
				      <span></span>
				    </label>
			</div>

		 </div>			
		 </div>
		</div>	
	</div>
	
	<div class="header-nav">
		<div class="max-width header-inner deco-none">
			<div class="header-line">
				<ul>
					<h5><a href="/manna/list">만나다</a></h5>
					<li><a href="/mannada/category">공동구매</a></li>
					<li><a href="/mannada/category">스포츠</a></li>
					<li><a href="/mannada/category">게임</a></li>
					<li><a href="/mannada/category">식사</a></li>
					<li><a href="/mannada/category">기타</a></li>
				</ul>
			</div>
			
			<div class="header-line">
				<ul>
					<h5><a href="/community/list">커뮤니티</a></h5>
				</ul>
			</div>
			
			<div class="header-line">
				<ul>
					<h5>공지사항</h5>
					<li><a href="/notice/list">공지사항</a></li>
					<li><a href="/qna/list">QnA</a></li>
				</ul>
			</div>
			
			<div class="header-line">
				<ul>
					<c:if test="${sessionScope.user == null && sessionScope.manager == null}">
						<h5><a href="/login">마이페이지</h5>
					</c:if>
					<c:if test="${sessionScope.user != null}">
						<h5>마이페이지</h5>
					</c:if>
					<c:if test="${sessionScope.manager != null}">
						<h5>마이페이지</h5>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
 	<div class="swiper mySwiper">
	    <div class="swiper-wrapper">
		      <div class="swiper-slide" style="background-image:url(/resources/image/swiper1.jpg);"><span class="slide-text">혼자를 떠나, 모두를 만나다.</span></div>
		      <div class="swiper-slide" style="background-image:url(/resources/image/swiper2.jpg);"><span class="slide-text">친구를 발견하는 새로운 방법</span></div>
		      <div class="swiper-slide" style="background-image:url(/resources/image/swiper3.jpg);"><span class="slide-text">퇴근하고 뭐해요? 취향 찾고 교양 쌓기!</span></div>
		</div>
		    <div class="swiper-button-next"></div>
		    <div class="swiper-button-prev"></div>
		    <div class="swiper-pagination"></div>
	</div> 

	<div class="container-index"> 
		<div>
			<div class="category-index center">
				<div>
					<h2>Category</h2>
				</div>

				<div>
					<div class="category-inner">
						<ul>
							<li><a href="/manna/list?search=8&keyword=1">
								<div class="icon"><img src="/resources/image/purchases.png">
								#공동구매
								</div>
								</a></li>
							<li><a href="/manna/list?search=8&keyword=2">
								<div class="icon"><img src="/resources/image/game.png">
								#게임
								</div>
								</a></li>
							<li><a href="/manna/list?search=8&keyword=3">
								<div class="icon"><img src="/resources/image/spoon.png">
								#식사
								</div>
								</a></li>
							<li><a href="/manna/list?search=8&keyword=4">
								<div class="icon"><img src="/resources/image/sport.png">
								#스포츠
								</div>
								</a></li>
							<li><a href="/manna/list?search=8&keyword=5">
								<div class="icon"><img src="/resources/image/more.png">
								#기타
								</div>
								</a></li>
						</ul>
					</div>
				</div>
			</div>
		<!-- 
		<ul>
			<li><a href="/login">사용자로그인</a></li>
			<li><a href="/signup">회원가입</a></li>
			<li><a href="/logout">로그아웃</a></li>
			<li><a href="/mypage">마이페이지</a></li>
			<li><a>${sessionScope.user.nickname}</a></li>
			<li><a>${sessionScope.manager.id}</a><li>
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
		 -->	
	</div>
</div>

	<div>
		<section class="top-content" style="margin: 0 auto;">
		<div class="list-more">
			<h4><b>최근 게시글</b></h4>
			<div>
				<a href="/manna/list"><h6>더보기 <i class="fa-solid fa-chevron-right"></i></h6></a> 
			</div>
		</div>
			<c:if test="${list.size() < 1 }">
				<div>등록 된 게시글이 없습니다.</div>
			</c:if>
			<div class="card_box" style="margin:0 auto;">
					<div id="empty_list">등록 된 게시글이 없습니다.</div>
				</div>
			
		</section>
	</div>
	
	<div class="more">
		<button type="button" id="more-btn">더보기</button>
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
	
	<div>
		<div class="top-content" style="margin: 100px auto;">
			<div class="list-more" style="padding: 0; margin-bottom:10px;">
				<h4><b>인기 게시글</b></h4>
				<div>
					<a href="/community/list"><h6>더보기 <i class="fa-solid fa-chevron-right"></i></h6></a>
				</div>
			</div>
			<div class="top-table">
				<div class="recent-table">
					<table class="table table-hover table_table " id="table_size" >
						<div>
							<div>
								<h5>후기 TOP 5</h5>
							</div>
							
							<div>
								<div></div>
							</div>
						</div>
						
					<thead>
						<tr class="table_menu"> 
							<!-- <th colspan="4">후기</th> -->
							<th>순위</th>
							<!-- <th>카테고리</th>  -->
							<th>제목</th> 
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody >
						<c:if test="${list.size() < 1}">
							<tr>
								<td colspan="5">등록된 글이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				</div>
				
				<div class="recent-table">
					<table class="table table-hover table_table " id="table_size" >
					<div>
							<div>
								<h5>소통 TOP 5</h5>
							</div>
							
							<div>
								<div></div>
							</div>
						</div>
					<thead>
						<tr class="table_menu"> 
							<!-- <th colspan="4">소통</th> -->
							<th>순위</th>
							<!-- <th>카테고리</th>  -->
							<th>제목</th> 
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody >
						<c:if test="${list.size() < 1}">
							<tr>
								<td colspan="5">등록된 글이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
	
 	<div class="mannam-map"> 
		<div id="map-layer">
			<div class="layer-inner">
				<div>
					<h3>나에게 맞는 <b>맞춤 만남</b>은?</h3>
				</div>
				<form name="addrSearch" action="searchAddress">
					<div class="grid-container">
						
						<div class="item">
							<div style="display:none;">
							<label>도로명</label>
							<input type="radio" name="addressType" value="road" checked>
							<label>지번</label>
							<input type="radio" name="addressType" value="jibun">
							</div>
						</div>
		
						<div class="item">
							<label><h5>지역</h5></label>
						</div>
		
							<div class="item">
								<select id="metro" name="metro" class="select-option">
									<option value="선택하세요">선택하세요</option>				
								</select>
							</div>
							<div class="item">
								<select id="city" name="city" class="select-option">
									<option value="선택하세요">선택하세요</option>
								</select>
							</div>
							<div class="item">
								<select id="address" name="address" class="select-option">
									<option value="0">선택하세요</option>
								</select>
							</div>
 
						
						<div class="item">
							<label><h5>카테고리</h5></label>
						</div>
						
						<div class="item">
							<select id="manna-category" class="select-option">
								<option>공동구매</option>
								<option>스포츠</option>
								<option>게임</option>
								<option>식사</option>
								<option>기타</option>
							</select>
						</div>
						
						<div class="item">
							<label><h5>기간</h5></label>
						</div>
						
						<div class="item">
							<select id="manna-date" class="select-option">
								<option>3일 이내</option>
								<option>1주일 이내</option>
								<option>2주일 이내</option>
								<option>한달 이내</option>
							</select>
						</div>
						
					</div>
							
					<div class="buttons">
						<button id="searchAddress">검색</button>
						<button type="reset" id="reset">초기화</button>
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