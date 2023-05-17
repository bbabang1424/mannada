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

<script type="text/javascript">
	const pager_url = "/manna/list";
	const pager_item = [
		{name: "id"},
		{name: "category_"},
		{name: "title"},
		{name: "address"},
		{name: "dDay"},
		{name: "sum"},
		{name: "member"}
	];

</script>

<script src="/resources/js/manna.js"></script>

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
		<div>
			<select name="search">
				<option value="1">제목</option>
				<option value="2">내용</option>
			</select>
			<input name="category" type="text">
			<button type="button" id="search-btn">검색</button>
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
		
		
		
		<div id="card-box">
			<div class="empty_list">등록 된 게시글이 없습니다.</div>
		</div>
		
		
		<div>
			<button type="button" id="more-btn">더보기</button>
		</div>
	</div>



	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</body>
</html>