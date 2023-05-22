<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community_detail</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/community_detail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>커뮤니티</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>목록</li>
		</ul>
		<h3 class="page_title">커뮤니티</h3>
		<p class="page_text">만남에 대한 후기와 소통을 자유옵게 글로 적어주세요!</p>
	</div>

	<section class="container">
		<div class="box">
			<div class="title">
				<h4>${item.title}</h4>
			</div>

			<div class="Writer_date_views">
				<div class="Writer_date">
					<img src="/resources/image/person.png" class="person">
					<div class="Writer">
						<span style="font-weight: bold; margin-right: 3px;">작성자</span> ${item.nickname}
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
			<a href="../list"><button class="button_back">목록</button></a>
			<!-- modify:수정하다란 뜻 -->
			<a href="../update/${id}"><button class="button_modify">수정</button></a>
			<a href="../delete/${id}"><button class="button_delete">삭제</button></a>
		</div>
	</section>



	<!-- 댓글 영역 -->

	<div class="content">

		<!-- 댓글 쓰기  -->
		<c:if test="${sessionScope.user != null}">
			<!-- 댓글 입력 -->
			<div class="replyFrom">
				<form action="../replyAdd" method="post">
					<div class="text-board">
						<textarea name="content" placeholder="로그인 후 코멘트를 달아주세요!"></textarea>
						<input type="hidden" name="commuId" value="${item.id }">
					</div>
					<div class="reply_up">
						<button class="reply_up_btn">등록</button>
					</div>
				</form>
			</div>
		</c:if>
		<div class="reply_text">
			<span class="all_reply">전체 댓글</span>
			<div class="mow_many">0</div>
		</div>
		<!-- 댓글 목록 -->
		<div class="reply-box">
			<div class="list_btn">
				<div style="margin-top: 2%;"></div>
			</div>

			<c:forEach var="reply" items="${reply }">
				<li>
					<div>
						<table class="replyTag">
							<tbody class="leply_list">
								<tr>
									<td width="5%;" align="left" valign="top"><img
										class="profile" src="/resources/image/profile.png"></td>
									<td style="width: 0%;"></td>
									<td style="margin: 5%; width: 51%;">

										<div class="reply_name_date">

											<span class="reply_nickname">${reply.nickname }<span
												class="reply_date"><fmt:formatDate
														value="${reply.regDate}" pattern="yyyy-MM-dd hh:mm" /></span></span>
										</div>
										<div class="content_info">
											<div class="reply-content ${reply.id }">${reply.content }</div>
										</div> <!-- 수정 삭제 -->
										<div class="reply_btn">
											<c:if test="${sessionScope.user.num == reply.num }">
												<a href="../replyUpdate/${reply.id}"><button class="reply-update-btn ${reply.id }" type="button"
													onclick="replyUpdate(${reply.id}, ${reply.commuId }, ${reply.content })">수정</button></a>
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


			<div style="border-top: 1px solid #ccc; margin-top: 2%;"></div>
		</div>	
		<!-- 페이지네이션 형태만 잡음-->
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