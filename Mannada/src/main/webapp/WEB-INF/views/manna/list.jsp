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
<link rel="stylesheet" href="/resources/css/manna_list.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">


</head>
<body>
	
	<section class="content ">
	<div id="sign_up_out">
		<a href="add"><button class="sign_up_in"><i class="bi bi-check"></i>글 등록</button></a>
	</div>
	
	<!-- <a href="../">이전</a> -->
	
		<c:if test="${list.size() < 1 }">
			<div>등록 된 게시글이 없습니다.</div>
		</c:if>
		<div class="card_box">
		<c:forEach var="item" items="${list }">
			<div id="card" >
				<div>
					<div class="Category">
						<span >${item.category }</span>
					</div>
				</div>

				<div class="title">
				
						<h5><strong >${item.title}</strong></h5>
				</div>
				 <div class="line"></div>
				
				<div class="interval">
						<i class="bi bi-check"></i>${item.address}
				
				</div>
				<div class="interval">
					<i class="bi bi-check"></i>만나는 날: ${item.dDay} 
									</div>
				<div class="interval">
					<i class="bi bi-check"></i>인원: (${item.num })
				</div>

				<div id="gauge_bar">
					<span class="gauge"><em></em></span>
				</div>
			</div>
			
		</c:forEach>
		 <button id="more">more</button>
		</div>
		<script src="/resources/js/manna_list.js"></script>
</body>
</html>