<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="header.jsp"></jsp:include>
<link href="/resources/css/style.css" rel="stylesheet">
</head>
<body>
<div>
	<form method="post">
		<div>
			<h3>signup</h3>
		</div>

		<div>
			<label>id</label>
			<input type="email" name="id">
			<button>check</button>
		</div>
		<div>
			<label>password</label>
			<input type="password" name="pw">
		</div>
		<div>
			<button>signup</button>
		</div>
	</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>