<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다 등록</title>
<script src="/resources/js/manna_add.js"></script>
</head>
<body>
<form method="post">
	<div>
		<label>카테고리</label>
		<input type="radio" name="category" value="1">공동구매 
		<input type="radio" name="category" value="2">운동 
		<input type="radio" name="category" value="3">게임
		<input type="radio" name="category" value="4">식사 
		<input type="radio" name="category" value="5" checked="checked">기타 
	</div>
	<div>
		<label>제목</label>
		<input type="text" name="title">
	</div>
	<div>
		<label>장소</label>
		<input type="text" name="address">
	</div>
	<div>
		<label>날짜</label>
		<input id="currentDate" type="date" name="dDay">
	</div>
	<div>
		<label>인원</label>
		<input type="number" name="member">
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