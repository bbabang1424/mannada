<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>만나다 리스트</title>
   <jsp:include page="../header.jsp"></jsp:include> 
<link rel="stylesheet" href="/resources/css/list.css">
<link rel="stylesheet" href="/resources/js/list.js">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">


</head>
<body>
	
	<section class="content ">
	<div>
		<h3>list</h3>
	</div>
		<c:if test="${list.size() < 1 }">
			<div>등록 된 게시글이 없습니다.</div>
		</c:if>
		<c:forEach var="item" items="${list }">
			<div class="card">
				<div>
					<div class="Category">
						<span>${item.category }</span>
					</div>
				</div>

				<div class="title">
						<h5><strong>${item.title }</strong></h5>
				</div>
				 <div class="line"></div>
				
				<div class="interval">
					
						<i class="bi bi-check"></i>${item.address}
				
				</div>
				<div class="interval">
					<i class="bi bi-check"></i>만나는 날: ${item.dDay} 
					<%--<fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd"/>--%>				</div>
				<div class="interval">
					<i class="bi bi-check"></i>인원: (${item.num })
				</div>

				<div id="gauge_bar">
					<span class="gauge"><em></em></span>
				</div>
			</div>
		</c:forEach>
	</section>
	<div id="sign_up_out">
		<button class="sign_up_in">
			<a href="add"><i class="bi bi-check"></i>글 등록</a>
		</button>
		<a href="../">이전</a>
	</div>
</body>
</html>