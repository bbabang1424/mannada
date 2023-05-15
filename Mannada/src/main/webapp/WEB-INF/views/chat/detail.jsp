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

<script>
	let url = "ws://" + window.location.hostname + ":" + window.location.port + "/chatserver";
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
		
		message.innerHTML += "<div class='list'><p>" + msg.data + "</p></div>";
		
		$('#message').scrollTop($('#message')[0].scrollHeight);
	}
	
	function send() {
		if(connect) {
			
			$.ajax({
				url : "../add",
				dataType : "json",
				type : "post",
				data : $("#message_form").serialize(),
				success : function(data){
				}
			});
			
			
			let content = document.getElementById("content");
			
			let today = new Date();   

			let year = today.getFullYear(); // 년도
			let month = today.getMonth() + 1;  // 월
			let date = today.getDate();  // 날짜
			let hours = today.getHours(); // 시
			let minutes = today.getMinutes();  // 분
			
			let regDate = year + "-" + month + "-" + date + " " + hours + ":" + minutes;
			
			
			socket.send('${sessionScope.user.nickname} | ' + regDate + "</p><p>" + content.value);
			
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
		                	<p>${item.nickname } | <fmt:formatDate value="${item.regDate }" pattern="yyyy-MM-dd hh:mm"/></p>
		                	<p>${item.content }</p>
		                </div>
		            </c:forEach>
	            </div>
	        </div>
        
            <div class="send">
                <form id="message_form">
                    <input type="number" name="mannaId" value="${item.id}" class="hidden" id="mannaId">
                    <input type="number" name="num" value="${sessionScope.user.num}" class="hidden" id="num">
                    <input type="text" name="content" id="content" onkeyup="enterkey()">
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