<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/qna_detail.css">
<script src="/resources/js/question.js"></script>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
	function EtValue() {
		const form = document.write_post;

		let content = form.content.value.replace(/&nbsp;/g, '');
		content = content.replace("<br>", '');
		content = content.replace("<p>", '');
		content = content.replace("</p>", '');

		// alert(">" + content + "<");

		if (content.trim() == '') {
			swal('', '수정할 내용을 입력해주세요.', 'error')
			form.content.focus();
			return;
		}

		form.submit();
	}
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
					placeholder : '답변을 입력해주세요.' //placeholder 설정

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
			<li>HOME</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>Q & A</li>
		<h3 class="page_title">Q & A</h3>
		<p class="page_text">궁금한 점, 문의할 점을 올려주세요!</p>
	</ul>
	</div>

	<div class="container">
		<div class="box">
			<div class="title">
				<h4 class="title_size">${question.title }</h4>
			</div>
			<hr>
			<div class="Writer_date_views">
				<div class="Writer_date">
					<div class="Writer">
				<!-- 사진 변경 -->
				<c:if test="${question.filename != null}">
				<div class="img_box">
					<img class="img" src="/upload/${question.uuid}_${question.filename}">
				</div>
				</c:if>
				<c:if test="${question.filename == null}">
					<div class="img_box">
						<img class="img" src="/resources/image/profile.png">
					</div>
				</c:if>
						<span class="writer_info"> 작성자</span> <a
							href="/user/view/${question.num}"
							style="color: black; text-decoration: none;" class="b">${question.nickname}</a>
							<p class="arrow_box">회원정보</p>
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
		<div class="lower">
		<c:if test="${sessionScope.user.num == question.num && question.status == 0}">
				<a href="../update/${id}"><button class="button_modify">수정</button></a>
				<a href="../delete/${id}"><button class="button_delete">삭제</button></a>
		</c:if>
			<a href="../list"><button class="button_back">목록</button></a>
		</div>
		<!--qna 로그인 안돼어 있어도 대기중이면 대기중이라고 보였으면 좋겠음.. 어떻게 해야지 -->
		<c:if test="${sessionScope.answer == null && question.status == 0}">
		<div class="answer_answer" style="text-align: left;">
		답변 대기중 입니다.
		</div>
		</c:if>
		
		<c:if test="${question.status == 1}">
		<!-- <div class="a">
		<samp>답변</samp>
		</div> -->
		
			<div class="answer_answer">
				<div class="answer_mgrId">${answer.nickname }</div>
				<div class="answer_date">
					<fmt:formatDate value="${answer.regDate}" pattern="yyyy-MM-dd " />
				</div>
				<hr>
				<div style="overflow: auto; width: 100%; height: 100px;"
					class="answer_content">${answer.content }</div>
			</div>
			<!-- 페이지 나눔/답글 수정 삭제 -->
			<c:if test="${sessionScope.manager.id != null }">
				<div class="delete_update_btn">
				<a href="../updateAnswer/${question.id }"><button class="update_btn" type="button">수정</button></a>
					<a href="../deleteAnswer/${question.id }"><button class="delete_btn" type="button">삭제</button></a> 
				</div>
			</c:if>
		
		</c:if>

		<!-- 삭제를 눌렀을때 다시 답글을 달수 있도록 -->
		<c:if test="${sessionScope.manager != null && question.status == 0}">
			<form action="../addAnswer" name="write_post" method="post">
				<input type="hidden" name="questionId" value="${question.id }">

				<div class="summernote_top">
					<textarea class="answer_box" id="summernote" name="content"></textarea>
				</div>
				<div class="answer_btn_info">
					<button class="answer_btn" type="button" onclick="EtValue()">답변</button>
				   
				</div>
			</form>
		</c:if>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>