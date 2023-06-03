<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<title>만나다</title>
<link rel="stylesheet" href="/resources/css/view.css">
<script src="/resources/js/view.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
			$("#my-reply").css("display", "unset");
		});

		$(".my-nav li").eq(3).click(function() {
			$(".my-nav li").css("text-decoration", "unset");
			$(".my-nav li").eq(2).css("text-decoration", "underline");
			$(".my-set").css("display", "none");
			$("#my-calender").css("display", "unset");
		});

		/* 별점 */
		const checkStar = document.querySelectorAll(".checkStar");
		const star = document.querySelectorAll(".star");
		const chooseWord = document.querySelector("#chooseWord");
		const starCnt = document.querySelector("#starCnt");

		function color(event) {
			const num = parseInt(event.target.value);

			for (var i = 0; i < checkStar.length; i++) {
				star[i].classList.remove("yellowStar");
			}
			for (var i = 0; i < num; i++) {
				star[i].classList.add("yellowStar");
			}

			switch (num) {
			case 1: // if (x === 'value1')
				chooseWord.style.color = '#999999';
				chooseWord.innerText = "별로에요";
				break;

			case 2: // if (x === 'value2')
				chooseWord.style.color = '#999999';
				chooseWord.innerText = "그저그래요";
				break;

			case 3: // if (x === 'value2')
				chooseWord.style.color = '#999999';
				chooseWord.innerText = "괜찮아요";
				break;

			case 4: // if (x === 'value2')
				chooseWord.style.color = '#999999';
				chooseWord.innerText = "좋아요";
				break;

			case 5: // if (x === 'value2')
				chooseWord.style.color = '#999999';
				chooseWord.innerText = "최고에요";
				break;
			}
		}

		for (var i = 0; i < checkStar.length; i++) {
			checkStar[i].addEventListener("click", color);
		}

		$('#reviewSubmit').click(function() {
			const form = document.reviewInfo_from;

			if (form.star.value < 1) {
				swal('한줄평', '별(★)을 선택해주세요', 'info');
				form.star.focus();
				return;
			}
			form.submit();
		});
	});
</script>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div class="title">마이페이지</div>


	<header class="profile-box">
		<div class="user-button">
			<c:if test="${sessionScope.user == null}">
				<a href="/login">프로필수정</a>
				<a href="/login">회원정보변경</a>
				<a href="/login">비밀번호변경</a>
				<a href="/login">회원탈퇴</a>
			</c:if>


			<c:if test="${sessionScope.user != null}">
				<a href="../photo/${sessionScope.user.num}"><button
						type="button" class="photo">프로필 수정</button></a>

				<a href="../update/${sessionScope.user.num}"><button
						type="button" class="update">회원정보변경</button></a>

				<a href="../password/${sessionScope.user.num}"><button
						type="button" class="password">비밀번호변경</button></a>

				<a href="../stop/${sessionScope.user.num}"><button type="button"
						class="stop">회원탈퇴</button></a>
			</c:if>
		</div>

		<div class="pro1">
			<c:if test="${user.attach.filename != null}">
				<div>
					<img src="/upload/${user.attach.uuid}_${user.attach.filename}">
				</div>
			</c:if>
			<c:if test="${user.attach.filename == null}">
				<div>
					<img class="profile" src="/resources/image/profile.png">
				</div>
			</c:if>
		</div>

		<div class="user-nickname">
			<div style="font-weight: bold;">${user.nickname} 님</div>
			<div>★${user.starAvg}(${user.starCnt})</div>
		</div>
		<div class="my-set" id="my-info">
			<div class="user-date">
				<table border="1">
					<colgroup>
						<col width="15%" />
						<col width="55%" />
					</colgroup>
					<tbody>						
						<tr>
							<th style="left: 10px;">소개:</th>
							<td>${user.intro}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</header>
	
	
	<!--tab-->
	<nav class="my-nav">
	<div class="tab">
		<ul class="tabnav">
			<li><a href="#tab01">My Page</a></li>
			<li><a href="#tab02">작성 글</a></li>
			<li><a href="#tab03">작성 댓글</a></li>
			<c:if test="${sessionScope.user.id == user.id}">
			<li><a href="#tab04">캘린더</a></li>
			</c:if>			
		</ul>
		
		<div class="tabcontent">
			<div id="tab01">
	<section>

			<div>
				<div class="review-title">
					<div class="text1">나의 평점은?</div>
					<div class="text2">별점과 이용경험을 남겨주세요.</div>					
				</div>
				<div class="self-hidden">
					<!-- user에 있는 form이니까 action은 user의 경로 사용 -->
					<form name="reviewInfo_from" method="post" style="width: 700px"
						enctype="multipart/form-data" action="../review/${user.num}">
						<div class="review-star">
							<label class="star" for="star1">★</label><input type="radio"
								class="checkStar" id="star1" value="1" name="star"> <label
								class="star" for="star2">★</label><input type="radio"
								class="checkStar" id="star2" value="2" name="star"> <label
								class="star" for="star3">★</label><input type="radio"
								class="checkStar" id="star3" value="3" name="star"> <label
								class="star" for="star4">★</label><input type="radio"
								class="checkStar" id="star4" value="4" name="star"> <label
								class="star" for="star5">★</label><input type="radio"
								class="checkStar" id="star5" value="5" name="star">
							<p id="chooseWord" style="color: rgb(153, 153, 153);position: relative;right: 120px;"></p>
						</div>
						<div class="text-note">
							<textarea rows="10" class="review_textarea" name="content"
								placeholder="로그인 후에 작성해주세요."></textarea>
							<button type="button" id="reviewSubmit" onClick="login_check();">등록</button>
						</div>
					</form>
				</div>
				<div>
					<table class="review-date">
						<tbody>	
							<th>닉네임</th><th>한줄평</th><th>작성일</th><th>별점</th>						
							<c:forEach var="review" items="${review}">																									
										<tr><td class="nickname">${review.nickname}</td>
										<td>${review.content}</td>
										<td class="regdate"><fmt:formatDate value="${review.regDate}"
											pattern="yyyy-MM-dd hh:mm" /></td>																											
										<td><c:if test="${review.star ==1}">
											<label class="yellowStar">★</label>
										</c:if> <c:if test="${review.star ==2}">
											<label class="yellowStar">★★</label>
										</c:if> <c:if test="${review.star ==3}">
											<label class="yellowStar">★★★</label>
										</c:if> <c:if test="${review.star ==4}">
											<label class="yellowStar">★★★★</label>
										</c:if> <c:if test="${review.star ==5}">
											<label class="yellowStar">★★★★★</label>
										</c:if>
										</td>														
								<td><c:if test="${sessionScope.user.num == review.writer}">
											<a href="../${user.num}/reviewDelete/${review.id}"
												class="btn btn-outline-danger"> <i class="bi bi-trash3"></i>
											</a>
										</c:if>
									</td>									
								
								</tr>
							</c:forEach>
						</tbody>			
				</table>
				</div>
			</div>
		</div>
			</div>
			<div id="tab02"></div>
			<div id="tab03"></div>
			<div id="tab04"></div>
		</div>
</nav>
						<tfoot>
							<tr>
								<td colspan="5">
									<ol class="pagination pagination-sm justify-content-center"
										style="margin-bottom: 5%; margin-top: 5%;">
										<li class="page_nation_item"><a
											href="?page=1${pager.query}" class="page-link">처음</a></li>
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
					

		<div class="my-set" id="my-post">
			<table border="1">
				<thead>
					<tr>
						<th>No</th>
						<th>만나다</th>
						<th>카테고리</th>
						<th>작성일</th>
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
							<td><a href="/manna/detail/${item.id}">${item.title}</a></td>
							<td>${item.category_}</td>
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
								<li class="page_nation_item"><a
									href="?page=1${pager.query}" class="page-link">처음</a></li>
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
						<th>작성일</th>
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
							<td><a href="/commu/detail/${item.id}">${item.title}</a></td>
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
								<li class="page_nation_item"><a
									href="?page=1${pager.query}" class="page-link">처음</a></li>
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
							<td><fmt:formatDate value="${item.regDate}"
									pattern="yyyy-MM-dd" /></td>
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
								<li class="page_nation_item"><a
									href="?page=1${pager.query}" class="page-link">처음</a></li>
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

		<div class="my-set" id="my-reply">
			<table border="1">
				<thead>
					<tr>
						<th>No</th>
						<th>내용</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${commuReply.size() < 1}">
						<tr>
							<td colspan="5">등록 된 댓글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="item" items="${commuReply}">
						<tr>
							<td>${item.rnum}</td>
							<td><a href="commu/detail/${item.commuId}">${item.content}</a></td>
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
								<li class="page_nation_item"><a
									href="?page=1${pager.query}" class="page-link">처음</a></li>
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

		<!-- 캘린더 추가 -->
	</section>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>