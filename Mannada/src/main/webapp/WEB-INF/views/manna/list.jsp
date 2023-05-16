<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>manna_list</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/manna_list.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

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
	margin-left: 2% !important;
}
</style>
</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>만나다</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>글 목록</li>
		</ul>
		<h3 class="page_title">글 목록</h3>
		<p class="page_text">새로운 만남을 만날수 있는 곧 입니다. 관심있는 카드를 눌러 참여하세요!</p>
	</div>

	<div class="container">
		<section class="content ">
			<div class="selelct_lsit">
				<div class="category_select">
					<select name="search" class="form-select form-select-sm">
						<option value="1">제목</option>
						<option value="2">내용</option>
					</select> <input class="search_box" id="category" name="category"
						type="text">
					<div class="search">
						<button class="search_btn">검색</button>
					</div>
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
					<div class="writing"></div>
				</c:if>
			</div>
			<!-- <a href="../">이전</a> -->

			<c:if test="${list.size() < 1 }">
				<div>등록 된 게시글이 없습니다.</div>
			</c:if>
			<div class="card_box">
				<!-- c:forEach 반복 필요할때 쓰는 것-->
				<c:forEach var="item" items="${list}">
					<a href="detail/${item.id}">
						<div id="card">
							<div>
								<div class="Category">
									<span>${item.category_}</span>
								</div>
							</div>

							<div class="title">

								<h5>
									<strong>${item.title}</strong>
								</h5>
							</div>
							<div class="line"></div>

							<div class="date_day">
								<i class="bi bi-check"></i>${item.address}

							</div>
							<div class="interval">
								<i class="bi bi-check"></i>만나는 날: ${item.dDay}
							</div>
							<div class="interval">
								<i class="bi bi-check"></i>인원: (${item.sum }/${item.member})
							</div>
							<progress value="40" max="100">
								<strong>Progress:10%</strong>
							</progress>
						</div>
					</a>
				</c:forEach>
			</div>
		</section>
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
	</div>

	<!-- <a href="../">이전</a> -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</body>
</html>