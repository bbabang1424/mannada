<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<title>만나다</title>
<link rel="stylesheet" href="/resources/css/list.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div class="banner">
			<ul class="banner_text">
				<li>HOME</li>
				<i class="bi bi-caret-right-fill"></i> 
				<li>회원관리</li>	
			</ul>
	</div>

	<div class="mg-background-image"></div>

	<div class="mg-container-box">
		<div>
			<h3>회원관리</h3>
			<p>* 상태가 회원탈퇴라면 1년후에 모든 정보와 회원정보를 삭제해주세요.</p>
			<div>
				<button id="delBtn" class="btn btn-dark btn-sm">회원삭제</button>
			</div>
		</div>
		<div>
			<form class="row mb-2">
				<div class="col-3">
					<select class="form-select form-select-sm" name="search">
						<option value="1">회원번호</option>
						<option value="2">이메일</option>
						<option value="3">닉네임</option>
						<option value="4">소개 글</option>
						<option value="5">탈퇴일자</option>
					</select>
				</div>
				<div class="col-4">
					<input class="form-control form-control-sm keyword-all"
						name="keyword" type="text">
				</div>

				<div class="col-2">
					<button id="searchBtn" class="btn btn-dark btn-sm">검색</button>
				</div>
				<div class="col-1"></div>
			</form>
		</div>
		<div class="user-table">
			<table border="1" class="table">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>이메일</th>
						<th>닉네임</th>
						<th>가입일</th>
						<th>탈퇴일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="8">등록된 제품이 없습니다</td>
						</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.num}</td>
							<td><a href="/user/view/${item.num}">${item.id}</a></td>
							<td>${item.nickname}</td>
							<td><fmt:formatDate value="${item.regDate}"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${item.delDate}"
									pattern="yyyy-MM-dd" /></td>
							<td>${item.status_}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="8">
							<ul class="pagination pagination-sm justify-content-center">
								<li class="page-item"><a href="?page=1${pager.query}"
									class="page-link">처음</a></li>
								<li class="page-item"><a
									href="?page=${pager.prev}${pager.query}" class="page-link">이전</a></li>

								<c:forEach var="page" items="${pager.list}">
									<li class="page-item">
										<!-- 삼항연산자를 이용하여 active 효과 삽입 --> <a
										href="?page=${page}${pager.query}"
										class="page-link ${page eq pager.page ? 'active':'' }">${page}</a>
									</li>
								</c:forEach>

								<li class="page-item"><a
									href="?page=${pager.next}${pager.query}" class="page-link">다음</a></li>
								<li class="page-item"><a
									href="?page=${pager.last}${pager.query}" class="page-link">마지막</a></li>
							</ul>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="go-back">
			<a href="javascript:window.history.back();" class="btn btn-secondary btn-sm">이전으로</a>
		</div>
	</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>