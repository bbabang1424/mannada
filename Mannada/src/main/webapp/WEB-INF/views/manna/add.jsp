<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manna_add</title>

<!-- 우편번호 찿기인데.. -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="/resources/css/manna_add.css">
<jsp:include page="../header.jsp"></jsp:include>
<script src="/resources/js/manna_add.js"></script>
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
			<form method="post" >
			<table class="box">
				<colgroup>
					<col width="10%" />
					<col width="35%" />
				</colgroup>

				<tbody>
					<tr style="border-bottom: 1px solid #ccc; ">
						<th id="interval">제 목</th>
						<td class="title"><input id="title" name="title" type="text">${item.id}</td>
					</tr>

					<tr  style="border-bottom: 1px solid #ccc;">
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
						<td class="postnum">
						<input id="postnum" name="postnum" type="text" placeholder="우편번호">
						 <input class="road_addr" id="address"name="address" type="text" placeholder="주소"> 
						 <input class="detAddr" id="detAddress" name="detAddress" type="text" placeholder="상세주소">
						<input id="postnum_search" type="button" onclick="DaumPostcode()"
							value="찾기">${item.postnum} ${item.address}
							${item.detAddress}</td>
					</tr>

					<tr>
						<th id="interval">본문내용</th>
						<td class="detail">
						<textarea class="control" placeholder="텍스트 내용을 입력해주세요"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- 하단:lower -->
			<div class="lower">
				<button class="raise_btn">등록</button>
				<a href="list"><button type="button" class="cancel_btn">취소</button></a>
			</div>
		</form>
	 </div>
	 <jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>