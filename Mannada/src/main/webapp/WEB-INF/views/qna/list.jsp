<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다</title>
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

.form-select {
	display: inline-block ! important;
	padding: 0.375rem 2.25rem 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	background-repeat: no-repeat;
	background-position: right 0.75rem center;
	background-size: 16px 12px;
	border: 1px solid #ced4da;
	border-radius: 0.375rem;
	width: 9% !important;

}
</style>
</head>
<body>
	
		<div class="banner">
			<ul class="banner_text">
				<li>Q & A</li>
				<i class="bi bi-caret-right-fill"></i>
				<li>목록</li>
			</ul>
			<h3 class="page_title">Q & A</h3>
			<p class="page_text">궁금한 점, 문의할 점을 올려주세요!</p>
		</div>
		<section class="table_info">
			<div class="selelct_list">
				<div class="category">
					<form> 
						<select name="search" class="form-select form-select-sm">
							<option value="1">제목</option>
							<option value="2">닉네임</option>
							<option value="3">내용</option>
						</select> 
						
						<input class="search_box" name="keyword" type="text">
						
						<div class="search">
							<button class="search_btn">검색</button>
						</div>
					</form>
				</div>


				<c:if test="${sessionScope.user.id != null }">
					<div class="writing">
						<a href="add">
							<button class="writing_btn">
								<i class="bi bi-pencil-fill"></i> 글쓰기
							</button>
						</a>
					</div>
				</c:if>
				<c:if test="${sessionScope.user.id == null }">
					<div class="writing">
					</div>
				</c:if>
			</div>
			<div>
				<table class="table table-hover table_table " id="table_size">
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
							<tr
								style="border: 1px solid #dddddd; padding-top: 10px; border-right: 1px solid White; border-left: 1px solid White;">
								<td>${item.rnum}</td>
								<td><a style="color: black;" href="detail/${item.id}">${item.title}</a></td>
								<td><div class="nickname">${item.nickname}</div></td>
								<td><fmt:formatDate value="${item.regDate}"
										pattern="yyyy-MM-dd " /></td>
								<td>${item.viewCnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</section>>

			<tfoot>
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
		
		<!-- <a href="../">이전</a> -->
		<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>