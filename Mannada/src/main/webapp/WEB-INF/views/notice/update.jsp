<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다</title>
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

<script type="text/javascript">
	//첨부파일
	$(function() {
		//첨부파일 관련
		
		$("#files .delete").click(function(){
			const id = $(this).data("id");
			const button = $(this);

			$.ajax({
				type: 'POST',
				url: '../delete_attach/' + id,
				success: function(result){
					console.log(result);
					
					button.closest("li").remove();
				}
				
			});
		});
		
		//삭제 버튼 눌렀을때
		$("#attachs").on("click", ".delete", function() {
			const div = $(this).closest(".input-group");
			div.remove();
		});
		//첨부파일의 추가를 눌렀을때 삭제버튼 생성(위임)
		$("#add").click(function() {
			const div = $("<div>");
			div.addClass("input-group");
			div.addClass("mb-3");

			const input = $("<input>");
			input.attr("type", "file");
			input.attr("name", "attach");
			input.addClass("form-control");
			input.addClass("form-control-sm");

			const button = $("<button>");
			button.attr("type", "button");
			button.addClass("btn");
			button.addClass("btn-sm");
			button.addClass("btn-outline-danger");
			button.addClass("delete");
			button.text("삭제");

			div.append(input);
			div.append(button);

			$("#attachs").append(div);
		});
	});
</script>
</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>공지사항</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>글 수정</li>
		
		<h3 class="page_title">공지사항</h3>
		<p class="page_text">등록 된 글의 내용을 변경하는 공간 입니다.</p>
	</ul>
	</div>

	<div class="container">
		<form method="post" name="write_post" enctype="multipart/form-data">
			<table class="box">
				<colgroup>
					<col width="10%" />
					<col width="35%" />
				</colgroup>

				<tbody>
					<tr style="border-bottom: 1px solid #ccc;">
						<th id="interval">제목</th>
						<td class="title"><input maxlength="30" id="notice_title" name="title" type="text"
							value="${item.title}"></td>
					</tr>

					<tr class="content_border">
						<th id="interval">본문내용</th>
						<td class="detail"><textarea id="summernote" name="content"
								class="control" placeholder="내용을 입력해주세요.">${item.content }</textarea>
						</td>
					</tr>
					
					<tr>
						<td id="interval">첨부파일</th>
						<td class="attach" id="attachs">
							<button type="button" id="add" class="btn btn-sm btn-primary mt-2 mb-2 add_info" >추가</button>
							
							<div class="attach_box" >
								<div id="files">
									<c:forEach var="attach" items="${item.attachs }">
									<ul>
										<li><a href="/upload/${attach.uuid }_${attach.filename}">${attach.filename}</a><button style="margin-left: 1%;" type="button" class="btn btn-sm btn-danger delete"
												data-id="${attach.id}">삭제</button></li>
										
										
										</ul>
											
									</c:forEach>
								</div>
							</div>
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

</body>
</html>