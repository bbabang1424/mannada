<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna_detail</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/qna_detail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script src="/resources/js/question.js"></script>
</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>Q & A</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>목록</li>
		</ul>
		<h3 class="page_title">Q & A</h3>
		<p class="page_text">궁금한 점, 문의할 점을 올려주세요!</p>
	</div>

	<section class="container">
		<div class="box">
			<div class="title">
				<h4>${question.title }</h4>
			</div>
			<hr>
			<div class="Writer_date_views">
				<div class="Writer_date">
					<img src="/resources/image/person.png" class="person">
					<div class="Writer">
						<span> 작성자</span> ${question.nickname}
					</div>
				</div>
				<div class="date_views">
					<fmt:formatDate value="${question.regDate}" pattern="yyyy-MM-dd " />
					| 조회수 ${question.viewCnt}
				</div>
			</div>
			<div>
				<div class="text_box">${question.content }</div>
			</div>
		</div>
		
			<form method="post">
				<input type="hidden" name="questionId" value="${question.id }">
				<textarea id="answer_box" name="content" placeholder="답변을 입력해주세요">${answer.content }</textarea>
				<button class="answer_btn">수정</button>
				<a href="../detail/${question.id }"><button class="answer_btn" type="button">취소</button></a>
			</form>
		
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>