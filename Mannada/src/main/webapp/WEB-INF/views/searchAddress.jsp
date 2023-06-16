<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>만나다</title>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/manna_list.css">
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

<script type="text/javascript">
	const pager_url = "/api/manna";
	
	/*
	$(document).ready(function(){
	$('li').on('click', function(){
		$(this).addClass('active');
		});
	});
	*/
</script>
<!-- 
<script src="/resources/js/manna.js"></script>
 -->
</head>
<body>
	<!--만나다 더보기 기능: 이현주  -->
	<div class="banner">
		<ul class="banner_text" >
			<li>HOME</li> <i class="bi bi-caret-right-fill"></i>
			<li>만나다</li>
		<h3 class="page_title">만나다</h3>
		<p class="page_text">새로운 만남을 만날수 있는 곳 입니다. 관심있는 카드를 눌러 참여하세요!</p>
	</ul>
	</div>
	
	<div class="container">
	<div class="category-inner">
		<ul class="category_list">
			<li  class="${param.keyword == null ? 'active' : ''}"><a href="/manna/list">
				<div class="icon">
				전체
				</div>
				</a></li>
			<li class="${param.keyword == 1 ? 'active' : ''}"><a href="/manna/list?search=8&keyword=1">
				<div class="icon">
				공동구매
				</div>
				</a></li>
			<li class="${param.keyword == 2 ? 'active' : ''}"><a href="/manna/list?search=8&keyword=2">
				<div class="icon">
				게임
				</div>
				</a></li>
			<li class="${param.keyword == 3 ? 'active' : ''}"><a href="/manna/list?search=8&keyword=3">
				<div class="icon">
				식사
				</div>
				</a></li>
			<li class="${param.keyword == 4 ? 'active' : ''}"><a href="/manna/list?search=8&keyword=4">
				<div class="icon">
				스포츠
				</div>
				</a></li>
			<li class="${param.keyword == 5 ? 'active' : ''}"><a href="/manna/list?search=8&keyword=5">
				<div class="icon">
				기타
				</div>
				</a></li>
		</ul>
	</div>
		
			<!-- <div class="selelct_lsit"> -->
				<div class="category_select">
					<select name="search" class="form-select form-select-sm">
						<option value="1">제목</option>
						<option value="2">작성자</option>
						<option value="3">모집인원</option>
						<option value="4">모집일</option>
						<option value="5">주소</option>
						<option value="6">내용</option>
					</select> <input class="search_box" name="keyword" type="text">

					<div class="search">
						<button class="search_btn">검색</button>
					</div>

					<c:if test="${sessionScope.user != null }">
						<div class="writing">
							<a href="../../manna/add">
								<button class="writing_btn">
									<i class="bi bi-pencil-fill"></i> 글쓰기
								</button>
							</a>
						</div>
					</c:if>
				</div>

			<%-- 	<c:if test="${sessionScope.user.id == null }">
					<div class="writing"></div>
				</c:if> --%>
			
			<div class="card_box">
				<c:if test="${mannaList.size() < 1 }">
					<div id="empty_list">등록 된 게시글이 없습니다.</div>
				</c:if>
				
				<c:forEach var="item" items="${mannaList }">
					<div>
					<a href="manna/detail/22" class="item">
						<div class="card">
							<div>
								<div class="Category">
									<span>${item.category_ }</span>
								</div>
							</div>
							<div class="title">
								<h5>
									<strong>${item.title }</strong>
								</h5>
							</div>
							<div class="line"></div>
							<div class="date_day">작성자 : ${item.nickname }</div>
							<div class="interval">D-day : <fmt:formatDate value="${item.regDate}"
									pattern="yyyy-MM-dd " /></div>
							<div class="interval">인원 : (${item.sum }/${item.member })</div>
							<progress value="${item.sum }" max="${item.member }"></progress>
						</div>
					</a>
				</div>
				</c:forEach>
			</div>
		
	<!-- </div> -->


<!-- 
	<div class="more">
		<button type="button" id="more-btn">더보기</button>
	</div> 
-->
	</div>


	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>