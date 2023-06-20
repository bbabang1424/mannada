<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<title>만나다</title>
<link rel="stylesheet" href="/resources/css/view.css">
<script src="/resources/js/view.js"></script>

 
<script>
const notice_url = "/mg/api/notice";
const notice_item = [
	{name: "id" },
	{name: "title" },
	{name: "nickname" },
	{name: "regDate" },
	{name: "viewCnt" }
];
const qna_url = "/mg/api/qna";
const qna_item = [
	{name: "id" },
	{name: "title" },
	{name: "nickname" },
	{name: "regDate" },
	{name: "viewCnt" },
	{name: "status_" }
	
];

</script>

<script src="/resources/js/mg_pager.js"></script>

<script>
$(function() {
    $(".my-nav li").eq(0).click(function() {
       $(".my-nav li").css("text-decoration", "unset");
       $(".my-nav li").eq(0).css("text-decoration", "underline");
       $(".my-set").css("display", "none");
       $("#my-post").css("display", "unset");
    });

    $(".my-nav li").eq(1).click(function() {
       $(".my-nav li").css("text-decoration", "unset");
       $(".my-nav li").eq(1).css("text-decoration", "underline");
       $(".my-set").css("display", "none");
       $("#my-question").css("display", "unset");
    });
 });
</script>

<style>
#my-question{
	display: none;
}

.hide {
	display: none;
}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div class="title">마이페이지</div>
	<header class="profile-box">
		<div style="font-weight: bold;">${manager.nickname}님</div>
		<div class="mg-button">
			<c:if test="${sessionScope.manager == null}">
				<a href="/login">정보변경</a>
				<a href="/login">비밀번호변경</a>
				<a href="/login">회원관리</a>
			</c:if>
			
			<c:if test="${sessionScope.manager != null}">
				<a href="../update/${sessionScope.manager.id}"><button type="button" class="update">정보변경</button></a>
				<a href="../password/${sessionScope.manager.id}"><button type="button" class="password">비밀번호변경</button></a>
				<a href="../../user/list"><button type="button" class="list">회원관리</button></a>
			</c:if>
		</div>			
	</header>
	
	<nav class="my-nav">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">작성 글</li>
				<li class="tab-link" data-tab="tab-2">Q n A</li>
			</ul>
			
			<div id="tab-1" class="tab-content current">
				<div class="tabcontent">
					<div class="my-set" id="my-post">
			<table border="1" class="table table-hover table_table" id="table_size">
				<thead>
					<tr class="table_menu_2">
						<th>No</th>
						<th>공지</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody id="notice">
					<c:if test="${myNotice.size() < 1}">
						<tr class="empty">
							<td colspan="5">등록 된 게시글이 없습니다.</td>
						</tr>
					</c:if> 
				</tbody>
				<tfoot> 
					<tr>
						<td colspan="5">
							<div class="more">
								<button type="button" id="notice-more-btn">더보기</button>
							</div>
						</td>
					</tr>
				</tfoot> 
			</table>
		</div>
      </div>								
			</div>
			

	<div id="tab-2" class="tab-content">					
		<div>
			<table border="1" class="table table-hover table_table" id="table_size" id="my-question">
				<thead>
					<tr class="table_menu_2">
						<th>No</th>
						<th>질문</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody id="qna">
                   	<c:if test="${myQnA.size() < 1}">
						<tr>
							<td colspan="5">등록 된 게시글이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							<div class="more">
								<button type="button" id="qna-more-btn">더보기</button>
							</div>
						</td>
					</tr>
				</tfoot> 
			</table>
		</div>
			</div>
		
		</nav>
		
		
		
	<section>
		
		
	</section>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>