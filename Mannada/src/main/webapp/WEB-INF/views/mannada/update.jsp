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
		<label>카테고리</label>
		<input type="radio" name="category" value="1" ${item.category == 1 ? 'checked' : '' }>공동구매 
		<input type="radio" name="category" value="2" ${item.category == 2 ? 'checked' : '' }>운동 
		<input type="radio" name="category" value="3" ${item.category == 3 ? 'checked' : '' }>게임
		<input type="radio" name="category" value="4" ${item.category == 4 ? 'checked' : '' }>식사 
		<input type="radio" name="category" value="5" ${item.category == 5 ? 'checked' : '' }>기타 
	</div>
	<div>
		<label>제목</label>
		<input type="text" name="title" value="${item.title }">
	</div>
	<div>
		<label>장소</label>
		<input type="text" name="address" value="${item.address }">
	</div>
	<div>
		<label>날자</label>
		<input type="date" name="dDay">
	</div>
	<div>
		<label>인원</label>
		<input type="number" name="member" value="${item.member }">
	</div>
	<div>
		<label>내용</label>
		<textarea rows="10" cols="30">${item.content }</textarea>
	</div>
	
	<div>
		<button>등록</button>
			<a href="../list">이전</a>
	</div>
</form>
</body>
</html>