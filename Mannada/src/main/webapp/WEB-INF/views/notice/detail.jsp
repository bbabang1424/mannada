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
<link rel="stylesheet" href="/resources/css/community_detail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
<div class="banner">
		<div class="banner_text">
			<li>공지사항</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>목록</li>
		</div>
		<h3 class="page_title">공지사항</h3>
		<p class="page_text">만나다의 새로운 소식, 시스템 점검등을 공지하는 공간입니다.</p>
	</div>
	
	<section class="container">
		<div class="box">
			<div class="title">
				<h4>${item.title}</h4>
			</div>
		<div class="Writer_date_views">
			<div class="Writer_date">
				<div class="Writer">
					<span style="font-weight: bold; margin-right: 3px;"> 작성자</span> ${item.nickname}
				</div>
			</div>
				<div class="date_views">
					<fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd " />
				| 조회수 ${item.viewCnt}
				</div>
			
			</div>

			<div class="text_box_notice">
				<div class="">${item.content }</div>
			</div>
			
			<div class="attach" >

				<div>
					<c:forEach var="attach" items="${item.attachs }">
						<li><i class="bi bi-paperclip" style="color: #0d6efd; font-family: 'Material Icons';"></i>
						<a href="/upload/${attach.uuid }_${attach.filename}">${attach.filename }</a>
						</li>
					</c:forEach>
				</div>

			</div>
		</div>
		<!-- lower:하단이란 뜻 -->
		<div class="lower">
			<!-- modify:수정하다란 뜻 -->
			
			<c:if test="${sessionScope.manager.id != null }"> 
			<a href="../update/${id}"><button class="button_modify">수정</button></a>
			<a href="../delete/${id}"><button class="button_delete">삭제</button></a>
			</c:if>
			<a href="../list"><button class="button_back">목록</button></a>
		</div>
	</section>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>