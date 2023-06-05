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

<script>
	let url = "ws://" + window.location.hostname + ":" + window.location.port
			+ "/chatserver";
	console.log(url);

	let connect = false;
	let socket = new WebSocket(url);

	socket.onopen = function() {
		connect = true;
		/* alert("서버 연결 완료"); */
	}

	socket.onclose = function() {
		connect = false;
		/* alert("서버 연결 종료"); */
	}

	socket.onmessage = function(msg) {
		let message = document.getElementById("message");
		
		let arr = msg.data.split(":");
		let usernum = arr[0];
		
		let today = new Date();

		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1; // 월
		let date = today.getDate(); // 날짜
		let hours = today.getHours(); // 시
		let minutes = today.getMinutes(); // 분

		let regDate = year + "-" + month + "-" + date + " " + hours + ":"
				+ minutes;
			
		message.innerHTML += usernum == '${num}' ? "<div class='list my'>" : "<div class='list you'>"
				+ "<div class='user'><div class='name'>"
				+ arr[1]
				+ "</div></div><div class='balloon'>" + arr[2]
				+ "</div><div class='user'>"
				+ "</div><div class='user'><p class='time'>" + regDate
				+ "</p></div>"
				+ "</div>";

		$('#message').scrollTop($('#message')[0].scrollHeight);
	}

	function send() {
		if (connect) {

			$.ajax({
				url : "../add",
				dataType : "json",
				type : "post",
				data : $("#message_form").serialize(),
				success : function(data) {
				}
			});

			let content = document.getElementById("content");

			
			socket.send('${sessionScope.user.num}:${sessionScope.user.nickname}:'+content.value)

			content.value = "";
			content.focus();
		}
	}

	function enterkey() {
		if (window.event.keyCode == 13) {
			send();
		}
	}
</script>
</head>
<body>
	<!--각 페이지 안내 베너:김소연 -->
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
					ROOM <i class="bi bi-chat-fill"
						style="position: absolute; top: -11%; left: 23%;"></i>
				</div>
			</div>

			<c:forEach var="item" items="${roomList }">
				<div class="active-color">
					<a href="../detail/${item.id}">
						<div class="list_box ${item.id == id ? 'active' : ''}">
							<div class="day_day">
								<div>
									<span class="nick_name">${item.nickname}</span> ${item.dDay }
								</div>
							</div>
							<div class="box_title">
								<div>${item.title }</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>



		<div id="chat">
			<!--box_box에 넣어서 스타일 줘봤는데 안 먹음  -->
			<div class="box_box"
				style="margin-left: 4.5%; margin-top: 4%; width: 91%; height: 81%; border: #9bbbd4;">
				<div class="message" id="message">

					<c:forEach var="item" items="${chatList }">
						<div class="list ${item.num == num ? 'my' : 'you' }">
							<div class="user">
								<div class="name">${item.nickname }</div>
							</div>
							<div class="balloon ">${item.content }</div>
							<div class="user">
								<p class="time">
									<fmt:formatDate value="${item.regDate }"
										pattern="yyyy-MM-dd hh:mm" />
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="send">
				<form id="message_form">
					<input type="number" name="mannaId" value="${item.id}"
						class="hidden" id="mannaId"> <input type="number"
						name="num" value="${sessionScope.user.num}" class="hidden"
						id="num"> <input type="text" name="content" id="content"
						onkeyup="enterkey()">
					<button type="button" onclick="send()">전송</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>


	<script type="text/javascript">
		$('#message').scrollTop($('#message')[0].scrollHeight);
	</script>
</body>
</html>