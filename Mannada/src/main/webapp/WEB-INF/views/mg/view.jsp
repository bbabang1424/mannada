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

<title>관리자 마이페이지</title>

<script>
$(function() {
    $(".my-nav li").click(function() {
       $(".my-nav li").css("text-decoration", "unset");
       $(".my-nav li").eq(0).css("text-decoration", "underline");
       $(".my-set").css("display", "none");
       $("#my-info").css("display", "unset");
    });

    $(".my-nav li").eq(1).click(function() {
       $(".my-nav li").css("text-decoration", "unset");
       $(".my-nav li").eq(1).css("text-decoration", "underline");
       $(".my-set").css("display", "none");
       $("#my-post").css("display", "unset");
    });

    $(".my-nav li").eq(2).click(function() {
       $(".my-nav li").css("text-decoration", "unset");
       $(".my-nav li").eq(2).css("text-decoration", "underline");
       $(".my-set").css("display", "none");
       $("#my-question").css("display", "unset");
    });
 });
</script>
<style>
#my-post, #my-question{
	display: none;
}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<header>
		<div>
			<div>
				<img src="/resources/image/profile.png">
			</div>
		</div>
		<div>
			<c:if test="${sessionScope.manager == null}">
				<a href="/login">정보변경</a>
				<a href="/login">비밀번호변경</a>
				<a href="/login">회원관리</a>
			</c:if>
			<c:if test="${sessionScope.manager != null}">
				<a href="../update/${sessionScope.manager.num}">정보변경</a>
				<a href="../password/${sessionScope.manager.num}">비밀번호변경</a>
				<a href="../../user/list">회원관리</a>
			</c:if>
		</div>
		<nav class="my-nav">
			<ul>
				<li>작성 글</li>
				<li>Q n A</li>
			</ul>
		</nav>
	</header>
	<section>
		<div class="my-set" id="my-info">
			<table border="1">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
				</colgroup>			
				<tbody>
					<tr>
						<th>이메일</th>
						<td>${manager.id}</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>${manager.nickname}</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="my-set" id="my-post">
			<table border="1">
				<thead>
					<tr>
						<th>No</th>
						<th>공지</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${myNotice.size() < 1}">
						<tr>
							<td colspan="5">등록 된 게시글이 없습니다.</td>
						</tr>
					</c:if> 
					<c:forEach var="item" items="${myNotice}"> 
						<tr>
	 						<td>${item.id}</td>
							<td><a href="/notice/detail/${item.id}">${item.title}</a></td>
							<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd" /></td>
							<td>${item.viewCnt}</td>
						</tr>
					</c:forEach>
				</tbody>
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
			</table>
		</div>
			
		<div class="my-set" id="my-question">
			<table border="1">
				<thead>
					<tr>
						<th>No</th>
						<th>질문</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
                   	<c:if test="${myQnA.size() < 1}">
						<tr>
							<td colspan="5">등록 된 게시글이 없습니다.</td>
						</tr>
					</c:if>  
					<c:forEach var="item" items="${myQnA}">      	
	  					<tr>
							<td>${item.id}</td>
							<td><a href="/qna/detail/${item.id}">${item.title}</a></td>
							<td>${item.nickname}</td>
							<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd" /></td>
							<td>${item.viewCnt}</td>
							<td>${item.status_}</td>
						</tr>
					</c:forEach>
				</tbody>
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
			</table>
		</div>
	</section>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>