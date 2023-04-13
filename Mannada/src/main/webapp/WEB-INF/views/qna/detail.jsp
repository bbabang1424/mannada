<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<a href="../list">이전</a>
	</div>

	<div>
		<p>${question.title }</p>
		<p>${question.content }</p>
	</div>
	
	<hr>
	
	<c:if test="${sessionScope.manager != null }">
		<form action="../addAnswer" method="post">
			<input type="hidden" name="questionId" value="${question.id }">
			<textarea rows="20" cols="30" name="content"></textarea>
			<button>답변하기</button>
		</form>
	</c:if>
</body>
</html>