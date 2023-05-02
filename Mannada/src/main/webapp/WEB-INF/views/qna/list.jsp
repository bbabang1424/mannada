<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna_list</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/css/qna_list.css">
<jsp:include page="../header.jsp"></jsp:include>


</head>
<body>
	<div>
		<div class="banner">
		<ul class="banner_text">
			<li>커뮤니티</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>목록</li>
		</ul>
		<h3 class="page_title">커뮤니티</h3>
		<p class="page_text">사람들과 소통하는 공간입니다.</p>
	</div>
			
			<c:if test="${sessionScope.member.id != null }">
				<a href="add"><button>글쓰기</button></a>
			</c:if>
		</div>


		<div>
			<table border="1">
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="4">등록된 글이 없습니다.</td>
						</tr>
					</c:if>

					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.rnum}</td>
							<td><a href="detail/${item.id}">${item.title}</a></td>
							<td><a href="../mypage/${item.num}">${item.num}</a></td>
							<td><fmt:formatDate value="${item.regDate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>


		<div class="pagenation">
			<ul class="pagination pagination-sm justify-content-center">

				<li><a href="?page=1"> << </a></li>
				<li><a href="?page=${pager.prev}">이전</a></li>

				<c:forEach var="page" items="${pager.list}">
					<li><a href="?page=${page}"
						class="${page eq pager.page ? 'active' : ''}">${page}</a></li>
				</c:forEach>

				<li><a href="?page=${pager.next}">다음</a></li>
				<li><a href="?page=${pager.last}"> >> </a></li>
			</ul>
		</div>
	</div>

		<div>
			<a href="add">추가</a>
			<a href="../">이전</a>
		</div>
	</div>
</body>
</html>