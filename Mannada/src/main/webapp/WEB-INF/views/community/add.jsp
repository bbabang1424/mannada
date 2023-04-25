<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community_add</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link rel="stylesheet" href="/resources/css/community_add.css">
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>커뮤니티</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>글 등록</li>
		</ul>
		<h3 class="page_title">커뮤니티</h3>
		<p class="page_text">자유롭게 서로의 생각을 글로 표현 해주세요.</p>
	</div>
	<div class="container">

		<div>
			<form method="post" class="box">
				<div class="title">
					<label id="interval">제목</label> <input id="title" name="title"
						type="text">
				</div>

				<div class="line"></div>

				<div class="detail">
					<label id="interval">내용</label>
				</div>
				<div>
					<textarea id="summernote" name="content" class="control"
						placeholder="텍스트 내용을 입력해주세요"></textarea>
				</div>
				<!-- 하단:lower -->
				<div class="lower">
					<button class="raise_btn">등록</button>
					<a href="list"><button type="button" class="cancel_btn">취소</button></a>
				</div>
			</form>
		</div>
	</div>
</body>

</html>