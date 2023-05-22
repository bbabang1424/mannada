<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna_update_Answer</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/qna_detail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!--jQuery 최신버전-->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- include summernote css/js -->
<link href="/resources/summernote/summernote-lite.css" rel="stylesheet">
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
	//window.onload = 
	$(document).ready(
			function() {
				//여기 아래 부분
				$('#summernote').summernote({

					'width' : '100%',
					height : 100, // 에디터 높이
					minHeight : null, // 최소 높이
					maxHeight : null, // 최대 높이
					focus : false, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					placeholder : '답변을 입력해주세요' //placeholder 설정

				});

				document.getElementById('currentDate').value = new Date()
						.toISOString().substring(0, 10);
			});
</script>

<style type="text/css">
/*텍스트 왼쪽 정렬  */
.note-editable {
	text-align: left !important;
}
</style>

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
				<h4 class="title_size">${question.title }</h4>
			</div>
		
			<div class="Writer_date_views">
				<div class="Writer_date">
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
			<div class="summernote_top">
				<textarea id="summernote" class="answer_box" name="content"
					placeholder="답변을 입력해주세요">${answer.content }</textarea>
			</div>
			<div class="answer_btn_lsit">
			<a href="../detail/${question.id }"><button class="cancell_btn"
					type="button">취소</button></a>
			<button class="update_Answer_btn">수정</button>
			</div>

		</form>
		
	</section>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>