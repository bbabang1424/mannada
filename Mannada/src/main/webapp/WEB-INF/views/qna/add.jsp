<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post">
	<div>
		<label>제목</label>
		<input type="text" name="title">
	</div>
	<div>
		<label>내용</label>
		<textarea rows="10" cols="30" name="content"></textarea>
	</div>
	
	<div>
		<button>등록</button>
			<a href="list">이전</a>
	</div>
</form>
</body>
</html>