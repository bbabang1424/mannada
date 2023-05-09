<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp"></jsp:include>
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/chat.css" rel="stylesheet">

<!-- <script src="/resources/js/chat.js"></script> -->

<script>
	let url = "ws://" + window.location.hostname + ":" + window.location.port + "/chat/detail";
	console.log(url);
	
	let connect = false;
	let socket = new WebSocket(url);
	
	socket.onopen = function() {
		connect = true;
		alert("서버 연결 완료");
	}
	
	socket.onclose = function() {
		connect = false;
		alert("서버 연결 종료");
	}
	
	socket.onmessage = function(msg) {
		let chat = document.getElementById("chat");
		
		chat.innerHTML += "<li>" + msg.data + "</li>";
	}
	
	function send() {
		if(connect) {
			let msg = document.getElementById("msg");
			
			socket.send(msg.value);
			
			msg.value = "";
		}
	}
	
</script>
</head>
<body>
	<div class="container-title">
		<h2>${item.title }</h2>
	</div>
	
    <div class="container">
        <div id="room">
	        <c:forEach var="item" items="${roomList }">
	            <a href="../detail/${item.id}">
	                <div class="list">
	                    <p>${item.dDay }</p>
	                    <p>${item.title }</p>
	                </div>
	            </a>
	        </c:forEach>
        </div>

        <div id="chat">
	        <div>
	            <div class="message" id="message">
		            <c:forEach var="item" items="${chatList }">
		                <div class="list">
		                	<p>${item.nickname } | ${item.regDate }</p>
		                	<p>${item.content }</p>
		                </div>
		            </c:forEach>
	            </div>
	        </div>
	
            <div class="send">
                <form action="../add" method="post">
                    <input type="number" name="num" value="${sessionScope.user.num}" id="session_id" class="hidden">
                    <input type="number" name="mannaId" value="${item.id}" class="hidden">
                    <input type="text" name="content" id="msg">
                    <button type="button" id="sendMessage" onclick="send()">전송</button>
                </form>
            </div>
        </div>
    </div>
    
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>