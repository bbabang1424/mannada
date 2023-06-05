<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>먼나다</title>
<jsp:include page="../header.jsp"></jsp:include>
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
	
	$(document).ready(function(){
	$('li').on('click', function(){
		$(this).addClass('active');
		});
	});
</script>
<script src="/resources/js/manna.js"></script>
</head>
<body>
	<!--만나다 더보기 기능: 이현주  -->
	<div class="banner">

		<div class="banner_text">
			<li>만나다</li> <i class="bi bi-caret-right-fill"></i>
			<li>글 목록</li>

		</div>
		<h3 class="page_title">글 목록</h3>
		<p class="page_text">새로운 만남을 만날수 있는 곳 입니다. 관심있는 카드를 눌러 참여하세요!</p>
	</div>
	<div class="container">
	<div class="category-inner">
		<ul class="category_list">
			<li><a href="/manna/list">
				<div class="icon">
				전체
				</div>
				</a></li>
			<li><a href="/manna/list?search=8&keyword=1">
				<div class="icon">
				공동구매
				</div>
				</a></li>
			<li><a href="/manna/list?search=8&keyword=2">
				<div class="icon">
				게임
				</div>
				</a></li>
			<li><a href="/manna/list?search=8&keyword=3">
				<div class="icon">
				식사
				</div>
				</a></li>
			<li><a href="/manna/list?search=8&keyword=4">
				<div class="icon">
				스포츠
				</div>
				</a></li>
			<li><a href="/manna/list?search=8&keyword=5">
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
				<div id="empty_list">등록 된 게시글이 없습니다.</div>
			</div>
		
	<!-- </div> -->



	<div class="more">
		<button type="button" id="more-btn">더보기</button>
	</div>
	</div>


	<%-- <!-- 모달 -->
	<div class="modal hide" id="detailModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">

				<section class="model_content">
					<button type="button" class="btn-close" aria-label="Close"></button>
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
							
							<div class="model_text_box">${item.content}</div>
						</div>
						<!-- lower:하단이란 뜻 -->
						<div class="model_lower">
							<!-- modify:수정하다란 뜻 -->
							<!-- 수정이랑 목록 이동 모르겠음... -->

							<a href="../update/${id}"><button class="button_modify">수정</button></a>
							<a href="../delete/${id}"><button class="button_delete">삭제</button></a>
							<!-- <a href="../lsit"><button class="button_back">목록</button></a> -->

							<a href="../manna/update/${item.id}"><button class="button_modify">수정</button></a>
							<a href="../delete/${item.id}"><button class="button_delete">삭제</button></a>

						</div>
						<!-- 채팅 버튼 일부러 뺴놈 이모지 넣음으로써 버튼 높 낮이 변함-->
						<a href="../chat/detail/${item.id}"><button class="button_chatting"><i class="bi bi-chat-fill"></i>
						</button></a>
					</div>
				</section>
			</div>
		</div>
	</div> --%>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>