<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다</title>

<!-- 우편번호 찿기인데.. -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/manna_add.css">
<jsp:include page="../header.jsp"></jsp:include>
<script src="/resources/js/manna_add.js"></script>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	/*EtValue>> enrolment:등록 EtValue>
	 줄여서 등록값*/
	/*제목 아이디 써야 등록*/
	function EtValue() {
		const form = document.write_post;
		let content = form.content.value.replace(/&nbsp;/g, '');
		content = content.replace("<br>", '');
		content = content.replace("<p>", '');
		content = content.replace("</p>", '');

		if (form.title.value.trim() == '') {
			swal('', '제목을 입력해주세요.', 'error')
			form.title.focus();
			return;
		} else if (form.member.value == ''|| form.member.value < 1) {
			swal('', ' 참여인원을 지정해주세요.', 'error')
			form.member.focus();
			return;
		} else if (content.trim() == '') {
	        swal('','내용을 입력해주세요.','error')
			form.content.focus();
			return;
		}
		form.submit();
	}
</script>
</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>만나다</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>글 등록</li>
		</ul>
		<h3 class="page_title">글 등록</h3>
		<p class="page_text">새로운 사람을 모집하는 공고를 올리는 공간입니다.</p>
	</div>
	<div class="container">
		<form method="post" name="write_post">
			<table class="box">
				<colgroup>
					<col width="10%" />
					<col width="35%" />
				</colgroup>

				<tbody>
					<tr style="border-bottom: 1px solid #ccc;">
						<th id="interval">제 목</th>
						<td class="title"><input maxlength="30" id="title" name="title" type="text">${item.id}</td>
					</tr>

					<tr style="border-bottom: 1px solid #ccc;">
						<th id="interval">카테고리</th>
						<td class="category"><input class="Choose_start" type="radio"
							name="category" value="1"> 공동구매 <input class="Choose"
							type="radio" name="category" value="2"> 운동 <input
							class="Choose" type="radio" name="category" value="3"> 게임
							<input class="Choose" type="radio" name="category" value="4">식사
							<input class="Choose" type="radio" name="category" value="5"
							checked="checked"> 기타${item.category_}</td>
					</tr>
					<tr style="border-bottom: 1px solid #ccc;">
						<th id="interval">모집인원</th>
						<td class="member"><input id="member" name="member"
							type="number">${item.member} 명</td>
					</tr>
					<tr style="border-bottom: 1px solid #ccc;">
						<th id="interval">모집 일</th>
						<td class="dDay"><input id="currentDate" type="date"
							name="dDay">${item.dDay}</td>
					</tr>

					<tr style="border-bottom: 1px solid #ccc; width: 500px;">
						<th id="interval">주소</th>
						<td class="postnum"><input id="postnum" name="postnum"
							type="text" placeholder="우편번호"> <input class="road_addr"
							id="address" name="address" type="text" placeholder="주소">
							<input class="detAddr" id="detAddress" name="detAddress"
							type="text" placeholder="상세주소"> <input
							id="postnum_search" type="button" onclick="DaumPostcode()"
							value="찾기">${item.postnum} ${item.address}
							${item.detAddress}</td>
					</tr>

					<tr>
						<th id="interval">본문내용</th>
						<td class="detail"><textarea id="summernote" class="control"
								placeholder="텍스트 내용을 입력해주세요" name="content"></textarea></td>
					</tr>
				</tbody>
			</table>
			<!-- 하단:lower -->
			<div class="lower">
				<button class="raise_btn" type="button" onclick="EtValue()">등록</button>
				<a href="list"><button type="button" class="cancel_btn">취소</button></a>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>