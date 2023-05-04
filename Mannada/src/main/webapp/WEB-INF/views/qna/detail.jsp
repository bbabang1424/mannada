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
		<c:if test="${question.status == 1 }">
			<div class="answer_answer">
				<div class="answer_mgrId">${answer.nickname }</div>
				<div class="answer_date">
					<fmt:formatDate value="${answer.regDate}" pattern="yyyy-MM-dd " />
				</div>
				<hr>
				<div style="overflow:scroll; width:100%; height: 100px;" class="answer_content">${answer.content }</div>
			</div>
			<c:if test="${sessionScope.manager.id != null }">
			<button class="delete_btn">삭제</button>
			<button class="update_btn">수정</button>
			</c:if>
		</c:if>
		<c:if test="${sessionScope.manager != null && question.status == 0}">
			<form action="../addAnswer" method="post">
				<input type="hidden" name="questionId" value="${question.id }">
				<textarea id="answer_box" name="content" placeholder="답변을 입력해주세요"></textarea>
				<button class="answer_btn">답변</button>
			</form>
		</c:if>
		<!-- lower:하단이란 뜻 -->
		<div class="lower">
			<hr>
			<!-- modify:수정하다란 뜻 -->
			<a href="../list"><button class="button_list">목록</button></a>
			<c:if test="${sessionScope.user != null && question.status == 0}">
				<a href="../update/${id}"><button class="button_modify">수정</button></a>
				<a href="../delete/${id}"><button class="button_delete">삭제</button></a>
			</c:if>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>