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
</head>
<body> 
	<div class="container">
		<div>
			<form action="../add" method="post">
				<input type="text">
				<button>전송</button>
			</form>
		</div>
	
		<c:forEach var="item" items="${list }">
			<div>
				<p>${item.nickname } : ${item.content } ${item.regDate }</p> 
			</div>
		</c:forEach>
	</div>
	
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>