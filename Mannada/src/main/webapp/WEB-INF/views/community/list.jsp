<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community_list</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/css/community_list.css">
<jsp:include page="../header.jsp"></jsp:include>
<style type="text/css">
.page_nation_item .page-link.active {
	color: white !important;
	background-color: #555555 !important;
	border-color: #555555 !important;
}
</style>
</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>커뮤니티</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>목록</li>
		</ul>
		<h3 class="page_title">커뮤니티</h3>
		<p class="page_text">사람들과 소통하는 공간입니다.</p>
	</div>
	
	<div>	
		<div>
			<div class="writing">
			<c:if test="${sessionScope.user.id != null }">
				<a href="add">
					<button class="writing_btn">
						<i class="bi bi-check"></i>글쓰기
					</button>
				</a>
			</c:if>
		</div>

			<table class="table table-hover table_table "
				style="text-align: center; width: 65%; margin-top: 2%;">
				<thead>
					<tr class="table_menu">
						<th>No</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="5">등록된 글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<tr style="border: 1px solid #dddddd; padding-top: 10px;">
							<td>${item.rnum}</td>
							<td><a style="color: black;" href="detail/${item.id}">${item.title}</a></td>
							<td ><div class="nickname">${item.nickname}</div></td>
							<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd " /></td>
							<td>${item.viewCnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<tfoot >
				<tr>
					<td colspan="5">
						<ol class="pagination pagination-sm justify-content-center"
							style="margin-bottom: 5%; margin-top: 5%;">
							<li class="page_nation_item"><a href="?page=1${pager.query}"
								class="page-link">처음</a></li>
							<li class="page_nation_item"><a
								href="?page=${pager.prev}${pager.query}" class="page-link">이전</a></li>

							<c:forEach var="page" items="${pager.list}">
								<li class="page_nation_item"><a
									href="?page=${page}${pager.query}"
									class="page-link ${page eq pager.page ? 'active' : ''}">${page}</a></li>
							</c:forEach>

							<li class="page_nation_item"><a
								href="?page=${pager.next}${pager.query}" class="page-link">다음</a></li>
							<li class="page_nation_item"><a
								href="?page=${pager.last}${pager.query}" class="page-link">마지막</a></li>
						</ol>
					</td>
				</tr>
			</tfoot>
		</div>
	
	<!-- <a href="../">이전</a> -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>