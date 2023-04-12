<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<h3>사용자 로그인</h3>
	<form method="post" action="userLogin">
		<div>
			<h3>login</h3>
		</div>
		<div>
			<label>id</label>
			<input type="email" name="id">
		</div>
		<div>
			<label>password</label>
			<input type="password" name="pw">
		</div>
		<div>
			<button>login</button>
		</div>
	</form>
</div>
<div>
<h3>관리자 로그인</h3>
	<form method="post" action="managerLogin">
		<div>
			<h3>login</h3>
		</div>
		<div>
			<label>id</label>
			<input type="email" name="id">
		</div>
		<div>
			<label>password</label>
			<input type="password" name="pw">
		</div>
		<div>
			<button>login</button>
		</div>
	</form>
</div>
</body>
</html>