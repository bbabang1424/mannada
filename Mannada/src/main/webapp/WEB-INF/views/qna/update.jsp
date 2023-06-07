<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나더</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/css/community_add.css">
<jsp:include page="../header.jsp"></jsp:include>
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
<script src="/resources/js/summernote.js"></script>
<script src="/resources/js/submit.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<div class="banner">
		<ul class="banner_text">
			<li>Q & A</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>글 변경</li>
		
		<h3 class="page_title">Q & A</h3>
		<p class="page_text">등록 된 글의 내용을 변경하는 공간 입니다.</p>
	</ul>
	</div>

	<div class="container">
			<form method="post" name="write_post" >
			<table class="box">
				<colgroup>
					<col width="10%" />
					<col width="35%" />
				</colgroup>

				<tbody>
					<tr style="border-bottom: 1px solid #ccc; ">
						<th id="interval">제목</th>
						<td class="title"><input maxlength="30" id="notice_title" name="title" type="text" value="${item.title}"></td>
					</tr>

					<tr>
						<th id="interval">본문내용</th>
						<td class="detail">
						<textarea id="summernote" name="content" class="control" placeholder="내용을 입력해주세요.">${item.content }</textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- 하단:lower -->
			<div class="lower">
		        <button class="raise_btn" type="button" onclick="EtValue()">등록</button>
				<a href="javascript:history.back();"><button type="button" class="cancel_btn">취소</button></a>
			</div>
		</form>
	 </div>
	 <jsp:include page="../footer.jsp"></jsp:include>

</form>
</body>
</html>