<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 우편번호 찿기인데.. 번지수 까지 안되더라.. -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/manna_add.js"></script>
<link rel="stylesheet" href="/resources/css/manna_add.css">
<jsp:include page="../header.jsp"></jsp:include>
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

		<div>
			<form method="post" class="box">
				<div class="title">
					<label id="interval">제목</label> <input id="title" name="title"
						type="text">
				</div>
				<div class="line"></div>

				<!-- select box -->
				<!-- <div class="category">
					<label id="interval">카테고리</label> <select id="category"
						class="select" name="category">
						<option value="1">공동구매</option>
						<option value="2">운동</option>
						<option value="3">식사</option>
						<option value="4">게임</option>
						<option value="5">기타</option>
					</select>
				</div> -->

				<div class="category">
					<label id="interval">카테고리</label> <input class="Choose_start"
						type="radio" name="category" value="1"> 공동구매 <input
						class="Choose" type="radio" name="category" value="2"> 운동
					<input class="Choose" type="radio" name="category" value="3">
					게임 <input class="Choose" type="radio" name="category" value="4">
					식사 <input class="Choose" type="radio" name="category" value="5"
						checked="checked"> 기타
				</div>
				<div class="line"></div>

				<div class="member">
					<label id="interval">모집인원</label> <input id="member" name="member"
						type="number"> 명
				</div>

				<div class="line"></div>

				<div class="dDay">
					<label id="interval">모집일</label> <input id="currentDate"
						type="date" name="dDay">
				</div>

				<div class="line"></div>

				<div class="postnum">
					<label id="interval">주소</label> <input id="postnum" name="postnum"
						type="text" placeholder="우편번호"> <input id="road_addr"
						name="address" type="text" placeholder="주소"> <input
						id="detAddr" name="detAddress" type="text" placeholder="상세주소">
					<input id="postnum_search" type="button" onclick="DaumPostcode()"
						value="찾기">
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