<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<style>
.body {
   min-height: calc(100vh - 240px);
}

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

#my-post, #my-reply, #my-set{
	display: none;
}
</style>

<script type="text/javascript">
$(function() {
	$(".my-nav li").click(function() {
		$(".my-nav li").css("text-decoration", "unset");
		$(".my-nav li").eq(0).css("text-decoration", "underline");
		$(".my-set").css("display", "none");
		$("#info").css("display", "unset");
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
		$(".my-nav li").eq(3).css("text-decoration", "underline");
		$(".my-set").css("display", "none");
		$("#my-bookmark").css("display", "unset");
	});
});
 
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
<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>
   
	<div class="body">
		<div class="content">
			<form method="post" class="card">
				<div>
					<div id="card-photo">
						<c:if test="${user.img != null}">
							<img src="${user.img}">
						</c:if>

						<c:if test="${user.img == null }">
							<div class="img"></div>
						</c:if>
					</div>
					<div>${user.nickname}</div>
				</div>
				
			<!-- <div>
					<div>평균 star : ☆${review.starAvg}</div>
					<div>${review.star}</div>
					<div>${review.content}</div>
				</div> -->
			</form>
		</div>
	</div>


	<c:if test="${user.id == sessionScope.user.id}">
		<div>
			<nav class="my-nav">
				<ul>
					<li>회원 정보</li>
					<li>작성 글</li>
					<li>작성 댓글</li>
					<li>북마크</li>
				</ul>
			</nav>
		</div>

		<section class="my-set" id="info">
			<div class="board">
				<div>
	 				<h3>information</h3>
				</div>
	
				<div id="my-info">
					<table>
						<tr>
	   						<th>프로필 사진</th>
							<td>
								<c:if test="${user.imgUrl != null}">
									<img src="${user.imgUrl}">
								</c:if>
								<c:if test="${user.imgUrl == null}">
									<div class="img"></div>
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
							<button class="modal_open" id="modify_modal_open">회원정보수정</button>
						</div>
						<div>
	  						<button class="modal_open" id="pw_modify_modal_open">비밀번호변경</button>
						</div>
					</div>
				</div>
			</div>
		</section>


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
	</c:if>


<!-- 푸터 -->
<jsp:include page="footer.jsp"></jsp:include>



<!-- 회원정보 수정 모달 -->
<div class="modal" id="modify_modal">
	<div class="modal_body">
		<div>
			<h3>회원정보 수정</h3>
		</div>
		<form name="modify_form" method="post" action="../modify/${user.id}">
			<div>
				<div>
					<label>프로필 사진</label>
					<input type="file" name="imgUrl" id="input-image" value="${user.imgUrl}"> 
					<img id="preview-image" src="${user.img}">
                  </div>
                  
				<div>
					<label>닉네임</label>
					<input type="text" name="nickname" value="${user.nickname}">
				</div>
                  
				<div>
					<label>이름</label>
					<input type="text" name="name" value="${user.name}">
				</div>
                  
				<div>
					<label>전화번호</label>
					<input type="text" name="phone" value="${user.phone}">
				</div>
 			</div>

			<div>
				<button>변경</button>
			</div>
		</form>
	</div>
</div>


<!-- 비밀번호 변경 모달 -->
<div class="modal" id="pw_modify_modal">
	<div class="modal_body">
		<div>
			<h3>비밀번호 변경</h3>
		</div>		
		<form name="pw_modify_form" method="post" action="../pwModify/${member.id}">
			<div>
				<div>
					<label>비밀번호</label> 
					<input type="password" name="pw">
				</div>
				<div>
					<label>비밀번호 확인</label>
					<input type="password" name="passwd_valid">
				</div>

				<div>
					<button type="button" onclick="pw_modify()">변경</button>
				</div>
			 </div>
		</form>
	</div>
</div>
  


<script type="text/javascript">
if(${sessionScope.user.id == user.id}){
	const modifyModal = document.querySelector('#modify_modal');
	const modifyModalOpen = document.querySelector('#modify_modal_open');
	
	const pw_modifyModal = document.querySelector('#pw_modify_modal');
	const pw_modifyModalOpen = document.querySelector('#pw_modify_modal_open');
      
      
	modifyModalOpen.addEventListener('click', () => {
		modifyModal.classList.toggle('show');
         
		if(modifyModal.classList.contains('show')) {
			body.style.overflow = 'hidden';
         }
	});
      
	modifyModal.addEventListener('click', (event) => {
		if(event.target === modifyModal) {
			modifyModal.classList.toggle('show');
		}   
		if(!modifyModal.classList.contains('show')) {
			body.style.overflow = 'auto';
		}  
	});
      
      
	pw_modifyModalOpen.addEventListener('click', () => {
		pw_modifyModal.classList.toggle('show');
         
		if(pw_modifyModal.classList.contains('show')) {
			body.style.overflow = 'hidden';
		}
	});
      
	pw_modifyModal.addEventListener('click', (event) => {
		if(event.target === pw_modifyModal) {
			pw_modifyModal.classList.toggle('show');
		}   
		if(!pw_modifyModal.classList.contains('show')) {
			body.style.overflow = 'auto';
		}
	});

	/* 정보수정 프로필사진 이미지 띄우기 */
	function readImage(input) {
		// 인풋 태그에 파일이 있는 경우
		if(input.files && input.files[0]) {
			// FileReader 인스턴스 생성
			const reader = new FileReader()
			// 이미지가 로드가 된 경우
			reader.onload = e => {
				const previewImage = document.getElementById("preview-image")
					previewImage.src = e.target.result
			}
	   
			// reader가 이미지 읽도록 하기
			reader.readAsDataURL(input.files[0])
		}
	};
	   
	/* input file에 change 이벤트 부여 */
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
		readImage(e.target)
	});
}
</script>

</body>
</html>