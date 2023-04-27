<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<h5>회원탈퇴</h5>
	<div>
		<p>
			회원탈퇴를 하면 서비스를 더 이상 이용하실 수 없습니다
			<br>
			탈퇴를 진행하시겠습니까?
		</p>
		
		<form id="submitForm" method="post">
			<input type="password" name="pw" placeholder="현재비밀번호">
			<button>회원 탈퇴</button>
		</form>
	</div>
</body>
</html>