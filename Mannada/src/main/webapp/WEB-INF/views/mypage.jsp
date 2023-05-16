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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@@5.3.0@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<title>마이페이지</title>

<style>
.board {
   background-color: white;
}

.board>div {
   width: -webkit-fill-available;
   background-color: unset;
}

th {
   width: auto !important;
}

.modal button:not {
   margin-top: 20px;
   width: 100px;
   height: 35px;
}

#my-info, #my-reply, #my-set, #my-calender {
	display: none;
}

.bi bi-person-fill {
	font-size: xxx-large;
    text-align: center;
}
</style>

<script>
/*메뉴탭 관련*/
$(function() {
	$(".my-nav li").click(function() {
		$(".my-nav li").css("text-decoration", "unset");
		$(".my-nav li").eq(0).css("text-decoration", "underline");
		$(".my-set").css("display", "none");
		$("#my-post").css("display", "unset");
	});

	$(".my-nav li").eq(1).click(function() {
		$(".my-nav li").css("text-decoration", "unset");
		$(".my-nav li").eq(1).css("text-decoration", "underline");
		$(".my-set").css("display", "none");
		$("#my-reply").css("display", "unset");
	});

	$(".my-nav li").eq(2).click(function() {
		$(".my-nav li").css("text-decoration", "unset");
		$(".my-nav li").eq(2).css("text-decoration", "underline");
		$(".my-set").css("display", "none");
		$("#my-bookmark").css("display", "unset");
	});

	$(".my-nav li").eq(3).click(function() {
		$(".my-nav li").css("text-decoration", "unset");
		$(".my-nav li").eq(3).css("text-decoration", "underline");
		$(".my-set").css("display", "none");
		$("#my-calender").css("display", "unset");
	});

	$(".my-nav li").eq(4).click(function() {
		$(".my-nav li").css("text-decoration", "unset");
		$(".my-nav li").eq(4).css("text-decoration", "underline");
		$(".my-set").css("display", "none");
		$("#my-info").css("display", "unset");
	});
});
/*비밀번호 확인*/
function pw_modify() {
	const form = document.pw_modify_form;
   
	if(form.pw.value == "" && form.pw.value == " ") {
		alert("비밀번호를 입력해주세요");
		form.pw.focus();
		return;
	}else if(form.passwd_valid.value == "" && form.passwd_valid.value == " ") {
		alert("비밀번호 확인을 입력해주세요");
		form.passwd_valid.focus();
		return;
	}else if(form.pw.value != form.passwd_valid.value) {
		alert("비밀번호가 불일치합니다");
		form.pw.focus();
		return;
	}
      
	form.submit();
}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<header id="userCard">
		<div>
			<form method="post">
				<div>
					<div>
						<c:if test="${user.img != null}">
							<img src="${user.img}">
						</c:if>

						<c:if test="${user.img == null }">
							<i class="bi bi-person-fill"></i>
						</c:if>
					</div>		
					<div>${user.nickname}</div>
					<%-- <div>☆${review.starAvg}</div> --%>
				</div>
			<!-- 
			<section class="my-set" id="my-review">
				<div>
					<div>평균 star : ☆${review.starAvg}</div>
					<div>${review.star}</div>
					<div>${review.content}</div>
				</div>
			</section>	
			 -->
			</form>
		</div>
	</header>


	<c:if test="${user.id == sessionScope.user.id}">
		<div>
			<nav class="my-nav">
				<ul>
					<li>작성 글</li>
					<li>작성 댓글</li>
					<li>북마크</li>
					<li>캘린더</li>
					<li>회원 정보</li>
				</ul>
			</nav>
		</div>

		<section class="my-set" id="my-post">
			<div class="board">
				<div>
					<h3>작성 글</h3>
				</div>
				<table border="1">
					<thead>
						<tr>
							<th>No</th>
							<th>만나다</th>
							<th>카테고리</th>
							<th>작성일자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${myManna.size() < 1}">
							<tr>
								<td colspan="5">등록 된 게시글이 없습니다.</td>
							</tr>
						</c:if> 
						<c:forEach var="item" items="${myManna}"> 
							<tr>
		 						<td>${item.id}</td>
								<td>${item.title}</td>
								<td><a href="/manna/detail/${item.id}">${item.category_}</a></td>
								<td><fmt:formatDate value="${item.regDate}"
		                                   pattern="yyyy-MM-dd" /></td>
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
				<table border="1">
					<thead>
						<tr>
							<th>No</th>
							<th>커뮤니티</th>
							<th>작성일자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
	                   	<c:if test="${myCommu.size() < 1}">
							<tr>
								<td colspan="5">등록 된 게시글이 없습니다.</td>
							</tr>
						</c:if>  
						<c:forEach var="item" items="${myCommu}">
							<tr>
		 						<td>${item.id}</td>
								<td><a href="/community/detail/${item.id}">${item.title}</a></td>
								<td><fmt:formatDate value="${item.regDate}"
		                                  pattern="yyyy-MM-dd" /></td>
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
				<table border="1">
					<thead>
						<tr>
							<th>No</th>
							<th>질문</th>
							<th>작성일자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
	                   	<c:if test="${myQuest.size() < 1}">
							<tr>
								<td colspan="5">등록 된 게시글이 없습니다.</td>
							</tr>
						</c:if>  
						<c:forEach var="item" items="${myQuest}">      	
		  					<tr>
								<td>${item.id}</td>
								<td><a href="/qna/detail/${item.id}">${item.title}</a></td>
								<td><fmt:formatDate value="${item.regDate}"
	                                   pattern="yyyy-MM-dd" /></td>
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
		</section>
		
		
		<section class="my-set" id="my-reply">
			<div class="board">
				<div>
					<h3>작성 댓글</h3>
				</div>
				<table>
					<tbody>
						<c:if test="${commuReply.size() < 1}">
							<tr>
								<td colspan="5">등록 된 게시글이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="item" items="${commuReply}">
							<tr>
								<td>${item.id}</td>
								<td><a href="/community/detail/${item.commuId}">
										${item.content}
								</a></td>
								<td><fmt:formatDate value="${item.regDate}"
									pattern="yyyy-MM-dd hh:mm" /></td>
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
            

		<!-- <section class="my-set" id="my-bookmark">
			<div class="board">
				<div>
					<h3>북마크</h3>
				</div>
				<c:if test="${list.size() < 1 }">
					<div>등록 된 북마크가 없습니다.</div>
				</c:if>
				<c:if test="${list.size() >= 1 }">
					<table border="1">
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>작성일자</th>
	 					</tr>
						<c:forEach var="item" items="${mannaBmark}">
							<tr>
								<td>${item.id}</td>
								<td><a href="/manna/detail/${item.mannaId}">
									${item.title}
								</a></td>
								<td><fmt:formatDate value="${item.regDate}"
									pattern="yyyy-MM-dd hh:mm" /></td>
							</tr>
						</c:forEach>   
					</table>
				</c:if>
			</div>
		</section> -->
		
		<!-- <section class="my-set" id="my-calender">
			<div class="board">
				<div>
					<h3>캘린더</h3>
				</div>
			</div>
		</section> -->
		
		<section class="my-set" id="my-info">
			<div class="board">
				<div>
	 				<h3>information</h3>
				</div>
				<table>
					<tr>
	  					<th>사진파일</th>
						<td>
							<c:if test="${user.img != null}">
								<img src="${user.img}">
							</c:if>
							<c:if test="${user.img == null}">
								<i class="bi bi-person-fill"></i>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${user.id}</td>
	 				</tr>
					<tr>
						<th>닉네임</th>
						<td>${user.nickname}</td>
					</tr>					
					<tr>
						<th>이름</th>
						<td>${user.name}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${user.phone}</td>
					</tr>
				</table>
				<div>
					<div>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModal">
  							회원정보수정
  						</button>
					</div>
					<div>
  						<button type="button" id="pw-update">비밀번호변경</button>
					</div>
				</div>
			</div>
		</section>
	</c:if>

<!-- 회원정보수정 Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">회원정보변경</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="/modify/{id}">
        	<div>
        		<label>사진설정</label>
        		<input type="file" name="img" value="${item.img}">
        	</div>
        	<div>
        		<label>이메일</label>
        		<input type="email" name="img" value="${item.id}" readonly>
        	</div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">목록</button>
        <button type="button" class="btn btn-primary">등록</button>
      </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
$(function() {
	$("#updatemodal").modal("show");
});
</script>
</html>