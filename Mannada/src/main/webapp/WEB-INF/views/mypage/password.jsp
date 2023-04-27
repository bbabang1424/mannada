<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호변경</title>
</head>
<body>
	<div>
		<div>
			<label>현재비밀번호</label>
			<input type="password" name="pw" id="pw">
			<button onclick="checkPW()">확인</button>
		</div>
		<div>
			<label>비밀번호</label>
			<input type="password" name="newPW" id="newPW">
		</div>
		<div>
			<label>비밀번호확인</label>
			<input type="password" name="newPW2" id="newPW2">
		</div>
		<div>
			<button>변경</button>
		</div>
	</div>
</body>
</html>