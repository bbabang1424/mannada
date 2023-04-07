<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	li {
		display: inline-block;
		border: 1px solid black;
		margin: 10px;
	}
</style>
</head>
<body>
	<div>
		<div>
			<h3>list</h3>
		</div>

		<div class="menu">
			<div class="title">
				<h3>공지사항</h3>

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
						<tr>
							<td>${item.rnum}</td>
							<td><a href="detail/${item.id}">${item.title}</a></td>
							<td><a href="../mypage/${item.memberId}">${item.name}</a></td>
							<td><fmt:formatDate value="${item.regDate}"
									pattern="yyyy-MM-dd" /></td>
							<td>${item.viewcount}</td>
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