<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
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
			<!-- @@@@@@ 조회수 순 정렬 / 카테고리별로 나누기 필요 @@@@@ -->
			<!-- 분할 없음
			<div>
				<table class="table table-hover table_table " id="table_size">
					<thead>
						<tr class="table_menu">
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
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
						<c:forEach var="item" items="${commuList}" end="4">
							<tr
								style="border: 1px solid #dddddd; padding-top: 10px; border-right: 1px solid White; border-left: 1px solid White;">
								 <td><div class="category_color category_color_${item.category}"></div>${item.category_}</td> 
								<td><a style="color: black;" href="/community/detail/${item.id}">${item.title}</a></td>
								<td><div class="nickname">${item.nickname}</div></td>
								<td><fmt:formatDate value="${item.regDate}"
										pattern="yyyy-MM-dd " /></td>
								<td>${item.viewCnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			-->
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
						<c:forEach var="item" items="${commuReview}" end="4" varStatus="ranking">
							<tr
								style="border: 1px solid #dddddd; padding-top: 10px; border-right: 1px solid White; border-left: 1px solid White;">
								<!-- <td><c:forEach var="cnt" begin="1" end="5">${cnt}</c:forEach></td>  -->
								<td class="ranking" style="font-weight:700; color:#999;"><div><c:out value="${ranking.count}" /></div></td>
								<!-- <td><div class="category_color category_color_${item.category}"></div>${item.category_}</td> --> 
								<td><a style="color: black;" href="/community/detail/${item.id}" title="${item.title}">
									<c:if test="${fn:length(item.title) < 24}">
										${item.title}
									</c:if>
									<c:if test="${fn:length(item.title) >= 24}">
										${fn:substring(item.title,0,23)}...
									</c:if>
									</a></td>
								<td><fmt:formatDate value="${item.regDate}"
										pattern="yyyy-MM-dd " /></td>		
								<td>${item.viewCnt}</td> 
							</tr>
						</c:forEach>
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
						<c:forEach var="item" items="${commuTalk}" end="4" varStatus="ranking">
							<tr
								style="border: 1px solid #dddddd; padding-top: 10px; border-right: 1px solid White; border-left: 1px solid White;">
								<td class="ranking" style="font-weight:700; color:#999;"><div><c:out value="${ranking.count}" /></div></td>
								<!-- <td><div class="category_color category_color_${item.category}"></div>${item.category_}</td>  --> 
								<td><a style="color: black;" href="/community/detail/${item.id}" title="${item.title}">
									<c:if test="${fn:length(item.title) < 24}">
										${item.title}
									</c:if>
									<c:if test="${fn:length(item.title) >= 24}">
										${fn:substring(item.title,0,23)}...
									</c:if>
									</a></td>
								<td><fmt:formatDate value="${item.regDate}"
										pattern="yyyy-MM-dd " /></td>
								<td>${item.viewCnt}</td>
							</tr>
						</c:forEach>
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
 	
 	<!-- 모달 -->
	<div class="modal" id="detailModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">

				<section class="model_content">
					<div class="box">
						<div class="first">
							<div class="img"></div>

							<div class="model_Category">[${item.category_}]</div>
							<div class="model_address">
								<i class="bi bi-geo-alt"></i> ${item.address}
							</div>

							<div class="model_title">
								<h4>${item.title}</h4>
							</div>

							<!-- 데이터 가져 올려고 했는데 오류가 나서 안됨 가져 올수 있는거 가져 옴 -->
							<div class="model_Writer">작성자: ${item.nickname}</div>
							<div class="model_grade">
								<i class="bi bi-star"></i> 4.5
								<!-- ${item.star}  -->
							</div>
							<div class="model_views">
								<i class="bi bi-eye"></i>
								<!-- ${item.view}  a-jax.. -->
							</div>
							<div class="model_date">
								<i class="bi bi-calendar-check"></i> ${item.dDay}
							</div>

							<!-- personnel:인원이란 뜻 -->
							<div class="model_personnel">
								<!-- 참여인원/모집인원 : 참여버튼을 눌른 이용자의 인원이 나와야함-->
								<span>참여현황:${item.sum }/${item.member}</span>
							</div>
							<progress id="model_progress" value="${item.sum }"
								max="${item.member}"> </progress>
							<div class="model_line"></div>
						</div>
						<div class="model_middle">


							<div class="model_member">참여인원</div>

							<div class="model_member_num_box_info">
								<div id="box_info">
									<div style="border: 1px solid #ddd;" class="member_num"
										id="model_member_num">
										<!-- 참여버튼을 누른 사람의 아이디를 가져와야함-->
										<c:forEach var="member" items="${list}">
											<div>${member.nickname }</div>
										</c:forEach>
									</div>
								</div>
								<!-- Partic: 참여란 뜻으로 참여버튼 -->
								<!-- 참여버튼 눌렀을때 인원 표시되게 해야 함-->
								<div class="model_Partic">
									<button type="button" id="join_btn"">참여</button>
								</div>
							</div>
							<!--내용 안불러 와짐 -->
							<div class="model_text_box">${item.content}</div>
						</div>
						<!-- lower:하단이란 뜻 -->
						<div class="model_lower">
							<!-- modify:수정하다란 뜻 -->
							<!-- 수정이랑 목록 이동 모르겠음... -->
							<a href="../update/${id}"><button class="button_modify">수정</button></a>
							<a href="../delete/${id}"><button class="button_delete">삭제</button></a>
							<a href="../lsit"><button class="button_back">목록</button></a>
						</div>
						<!-- 채팅 버튼 일부러 뺴놈 이모지 넣음으로써 버튼 높 낮이 변함-->
						<button class="button_chatting"><i class="bi bi-chat-fill"></i>
						</button>
					</div>
				</section>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
 <!-- Swiper JS -->
 <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
 <!-- Initialize Swiper -->
 <script src="/resources/js/index.js"></script>

</body>
</html>