<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container.chat {
	display: flex;
}

.chat-list, .chat-messages {
	border: 1px solid black;
	padding: 10px 30px;
}
</style>
</head>
<body>
	<div>헤더~~</div>

	<div class="container chat">
		<div class="chat-list">
			<div>
				<p>방제목r길게길게</p>
			</div>
		</div>


		<div class="chat-messages">
		
			<c:forEach var="item" items="${list }">
				<div class="message">
					<p>${item.content }</p>
					<p>${item.content }</p>
				</div>
			</c:forEach>
			
			<div>
				<input type="text" name="content">
				<button>전송</button>
			</div>
		</div>
	</div>
</body>
</html>