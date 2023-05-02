<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community_detail</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/community_detail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>커뮤니티</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>목록</li>
		</ul>
		<h3 class="page_title">커뮤니티</h3>
		<p class="page_text">자유롭게 서로의 생각을 글로 표현 해주세요.</p>
	</div>

	<section class="container">
		<div class="box">
			<div class="title">
				<h4>${item.title}</h4>
			</div>
			<hr>
				<div class="Writer_date_views">
			<div class="Writer_date">
				<img src="/resources/image/person.png" class="person"><div class="Writer">
					<span> 작성자</span> ${item.nickname}
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
		<!-- lower:하단이란 뜻 -->
		<div class="lower">
			<!-- modify:수정하다란 뜻 -->
			<a href="../list"><button class="button_list">목록</button></a> 
			<a href="../update/${id}"><button class="button_modify">수정</button></a>
			<a href="../delete/${id}"><button class="button_delete">삭제</button></a>
		</div>
	</section>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>