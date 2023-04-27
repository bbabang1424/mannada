<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>manna_list</title>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/manna_list.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
			<div id="sign_up_out">
				<a href="add"><button class="sign_up_in">
						<i class="bi bi-check"></i>글 등록
					</button></a>
			</div>

			<!-- <a href="../">이전</a> -->
			
			<c:if test="${list.size() < 1 }">
				<div>검색된 게시글이 없습니다.</div>
			</c:if>
			<div class="card_box">
				<!-- c:forEach 반복 필요할때 쓰는 것-->
				<c:forEach var="item" items="${list}">
					<a href="detail/${item.id}"><div id="card">
							<div>
								<div class="Category">
									<span>${item.category }</span>
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
								<i class="bi bi-check"></i>인원: (${item.num }/${item.member})
							</div>
							<progress value="40" max="100">
								<strong>Progress:10%</strong>
							</progress>
						</div></a>
				</c:forEach>
			</div>
		</section>
		
		<table>
			<tfoot>
				<tr>
					<td colspan="5">
						<ol class="pagination pagination-sm justify-content-center"
							style="margin: 0">
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
</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>