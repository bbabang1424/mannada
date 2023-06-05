<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/chat.css" rel="stylesheet">
</head>
<body>
	<!--각 페이지 안내베너 :김소연  -->
	<div class="banner">
		<ul class="banner_text">
			<li>HOME</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>채팅</li>

		</ul>
	</div>
	<div class="container">
		<div id="room">
			<div class="chat_banner">
				<div class="chat_text">
					ROOM<i class="bi bi-chat-fill"
						style="position: absolute; top: -11%; left: 23%;"></i>
				</div>
			</div>
			<c:forEach var="item" items="${list }">
				<a href="detail/${item.id}">
					<div class=active-color>
						<div class="list_box">
							<div class="day_day">
								<div>
									<span class="nick_name">${item.nickname}</span> ${item.dDay }
								</div>
							</div>
							<div class="box_title">
								<div>${item.title }</div>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>

		<div class="chat_all">
			<div class="chat_chat">
				<div class="chat_text_one">
					<h2>채팅</h2>
				</div>
				<div class="chat_text_two">사람들과 자유롭게 소통하세요 :)</div>
			</div>
		</div>


	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>