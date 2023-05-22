<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community_replyUpdate</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/community_detail.css">
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

</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>커뮤니티</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>댓글 수정</li>
		</ul>
		<h3 class="page_title">커뮤니티</h3>
		<p class="page_text">만남에 대한 후기와 소통을 자유옵게 글로 적어주세요!</p>
	</div>

	<section class="container_box">
		<div class="box">
			<div class="title">
				<h4>${item.title}</h4>
			</div>

			<div class="Writer_date_views">
				<div class="Writer_date">
					<div class="Writer">
						<span style="font-weight: bold;">작성자</span> ${item.nickname}
					</div>
				</div>
				<div class="date_views">
					<fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd " />
					| 조회수 ${item.viewCnt}
				</div>

			</div>

			<div>
				<div class="text_box">${item.content }</div>
			</div>
		</div>
	</section>

	<div class="container_box">
		<form method="post" class="replyupdate_box">
			<div style="border-top: 2px solid blue;">
				<input type="hidden" name="replyId" value="${reply.id }">
				<div>
					<textarea class="reply_update" style="resize: none;" name="content"
						placeholder="수정할 내용을 입력해주세요.">${reply.content }</textarea>
				</div>
				<div class="reply_btn_lsit">
					<button class="replyupdate_btn">수정</button>
					<a href="../detail/${reply.id} "><button class="back_btn"
							type="button">취소</button></a>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>