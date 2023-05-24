<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manna_detail</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/manna_detail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>만나다</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>글 목록</li>
		</ul>
		<h3 class="page_title">글 목록</h3>
		<p class="page_text">새로운 만남을 만날수 있는 곧 입니다. 관심있는 카드를 눌러 참여하세요!</p>
	</div>
	<section class="content">
		<div class="box">
			<div class="first">
				<img class="img" src="/resources/image/profile.png">
				<div class="a">
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
					</div>
					<div class="model_date">
						<i class="bi bi-calendar-check"></i> ${item.dDay}
					</div>
					</div>
					
					<div class="model_views">
						<i class="bi bi-eye"></i> 33
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
				<c:if test="${sessionScope.user.num == item.num }">
					<a href="../update/${id}"><button class="button_modify">수정</button></a>
					<a href="../delete/${id}"><button class="button_delete">삭제</button></a>
				</c:if>
					<!-- 채팅 버튼 일부러 뺴놈 이모지 넣음으로써 버튼 높 낮이 변함-->
			<a href="../../chat/detail/${item.id}"><button
					class="button_chatting">
					<i class="bi bi-chat-fill"></i>
				</button></a>
			</div>
		
		</div>
	</section>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>