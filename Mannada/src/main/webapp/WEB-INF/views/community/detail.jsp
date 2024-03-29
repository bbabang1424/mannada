<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/community_detail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script type="text/javascript">

/*EtValue>> enrolment:등록 EtValue>
줄여서 등록값*/
/*제목 아이디 써야 등록*/
   function EtValue() {
      const form = document.write_post;

      if (form.content.value.trim() == '') {
         swal('', '내용을 입력해주세요.', 'error')
         form.content.focus();
         return;
      }
      form.submit();
   }
</script>
</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>HOME</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>커뮤니티</li>
		
		<h3 class="page_title">커뮤니티</h3>
		<p class="page_text">만남에 대한 후기와 소통을 자유롭게 글로 적어주세요!</p>
	</ul>
	</div>

	<section class="container">
		<div class="box">
			<div class="category_title_box">
				<div class="category_color category_color_${item.category}">

					<div class="category_title">
						<h1 class="comm_category">
							<span class="category_info">${item.category_}</span>
							<div class="title_info">${item.title}</div>
						</h1>

					</div>
				</div>
			</div>

			<div class="Writer_date_views">
				<div class="Writer_date">
					<div class="Writer">
				<!-- 사진 변경 -->
				<c:if test="${item.filename != null}">
				<div class="img_box">
					<img class="img" src="/upload/${item.uuid}_${item.filename}">
				</div>
				</c:if>
				<c:if test="${item.filename == null}">
					<div class="img_box">
						<img class="img" src="/resources/image/profile.png">
					</div>
				</c:if>
						<span class="writer_info">작성자</span>
						<a href="/user/view/${item.num}" style="color: black;" class="b">${item.nickname}</a>
						<p class="arrow_box">회원정보</p>
					</div>
				</div>
				<div class="date_views">
					<fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd " />
					| 조회수 ${item.viewCnt}
				</div>

			</div>

			<div>
				<div class="text_box">${item.content }</div>
			</div>
		</div>
		<!-- lower:하단이란 뜻 -->
		<div class="lower">
			
			<!-- modify:수정하다란 뜻 -->
			<c:if test="${sessionScope.user.num == item.num}">
				<a href="../update/${id}"><button class="button_modify">수정</button></a>
				<c:if test="${item.totalReply == 0}">
				<a href="../delete/${id}"><button class="button_delete">삭제</button></a>
				</c:if>
			</c:if>
			<a href="../list"><button class="button_back">목록</button></a>
		</div>
	



	<!-- 댓글 영역 -->

	<div class="content">
	<!-- 커뮤 댓글 로그인 안됐을때 권한이 권한이 없다고 보이게 하고 싶음... -->
		<c:if test="${sessionScope.user == null}">
		<div class="replyFrom">
			<div class="text-board">
				<div style="margin: 2%;">권한이 없습니다. 로그인해주세요!</div>
			</div>
		</div>
		</c:if>
		
		<!-- 댓글 쓰기  -->
		<c:if test="${sessionScope.user != null}">
			<!-- 댓글 입력 -->
			<div class="replyFrom">
				<form action="../replyAdd" method="post" name="write_post">
					<div class="text-board">
						<textarea name="content" placeholder="코멘트를 달아주세요!"></textarea>
						<input type="hidden" name="commuId" value="${item.id }">
					</div>
					<div class="reply_up">
						<button class="reply_up_btn" type="button" onclick="EtValue()">등록</button>
					</div>
				</form>
			</div>
		</c:if>
		<div class="reply_text">
			<span class="all_reply">전체 댓글</span>
			<div class="mow_many">${item.totalReply}</div>
		</div>
		<!-- 댓글 목록 -->
		<div class="reply-box">
			<div class="list_btn">
				<div style="margin-top: 1%;"></div>
			</div>
			<c:forEach var="reply" items="${reply }">
				<li>
					<div>
						<table class="replyTag">
							<tbody class="leply_list">
								<tr>
									<td width="5%;" align="left" valign="top">
											
										<!-- 사진 변경 --> 
										<c:if test="${reply.filename != null}">
											<div class="profile_box">
												<img class="img" src="/upload/${reply.uuid}_${reply.filename}">
											</div>
										</c:if>
										
										<c:if test="${reply.filename == null}">
											<div class="profile_box">
												<img class="profile" src="/resources/image/profile.png">
											</div>
										</c:if>
									</td>
										
									<td style="width: 0%;"></td>
									<td style="margin: 5%; width: 51%;">

										<div class="reply_name_date">

											<span class="reply_nickname"><a href="/user/view/${reply.num}" style="color:black; " class="c">${reply.nickname}</a>
											<p class="reply_arrow_box">회원정보</p>
											<span
												class="reply_date"><fmt:formatDate
														value="${reply.regDate}" pattern="yyyy-MM-dd hh:mm" /></span></span>
										</div>
										
										<div class="content_info">
											<div class="reply-content ${reply.id }">${reply.content }</div>
										</div>
										
										<!-- 수정 삭제 -->
										<div class="reply_btn">
											<c:if test="${sessionScope.user.num == reply.num}">
												<a href="../replyUpdate/${reply.id}">
												<button class="reply-update-btn ${reply.id}" type="button">수정</button></a>
												<a href="../replyDelete/${reply.id }?id=${item.id}">
												<button class="reply_delete">삭제</button></a>
											</c:if>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
			</c:forEach>
			<div style="border-top: 1px solid #ccc; margin-top: 1%;"></div>
		</div>	

	</div>
	
	<!-- 형태만 잡아 놓음/cif로 10개 넘어가면 보이게하기 -->
	<c:if test="${item.totalReply > 10 }">
		<tfoot>
			<tr>
				<td colspan="5">
					<ol class="pagination pagination-sm justify-content-center" style="margin: 5%;">
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
	</c:if>
	</section>
	


	<jsp:include page="../footer.jsp"></jsp:include>


	<script type="text/javascript">
	
		/* 댓글 삭제 명령 */
		$(document).on('click', '.replyDelete', function(e) {
		
			e.preventDefault();
			const Id = $(this).attr("id");
			const commuId = '${item.id}';
			
			console.log(Id, commuId);
			
			
			$.ajax({
				data: {
					id: Id,
					commuId: commuId
				},
				url: '../replyDelete/' + Id,
				type: 'POST',
				success: function(result) {
					   
					li.remove();
					   
					alert('삭제가 완료되엇습니다.');
				}
			});
		});
	
	</script>

</body>
<script src="/resources/js/reply.js"></script>
</html>