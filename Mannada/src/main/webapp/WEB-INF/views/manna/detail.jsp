<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manna_detail_Publishing</title>
<link rel="stylesheet" href="/resources/css/manna_detail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

</head>
<body>
	<section class="content">
		<div class="box">
			<div class="first">
				<div class="img"></div>

				<div class="Category">[${item.category_}]</div>
				<div class="address">
					<i class="bi bi-geo-alt"></i> ${item.address}
				</div>

				<div class="title">
					<h3>${item.title}</h3>
				</div>
				
				<!-- 데이터 가져 올려고 했는데 오류가 나서 안됨 가져 올수 있는거 가져 옴 -->
				<div class="Writer">작성자: 홍길동<%-- ${item.name} --%></div>
				<div class="grade">
					<i class="bi bi-star"></i> 4.5<%-- ${item.star}  --%>
				</div>
				<div class="views">
					<i class="bi bi-eye"></i> <%-- ${item.view} --%> 23
				</div>
				<div class="date">
					<i class="bi bi-calendar-check"></i> ${item.dDay}
				</div>

				<!-- personnel:인원이란 뜻 -->
				<div class="personnel">
					<!-- 참여인원/모집인원 : 참여버튼을 눌른 이용자의 인원이 나와야함-->
					<span>참여현황:${item.num }/${item.member}</span>
				</div>
				<progress value="40" max="100">
					<strong>Progress:10%</strong>
				</progress>
				<div class="line"></div>
			</div>
			<div class="middle">
				<div class="member">참여인원</div>

				<div class="member_num">
					<!-- 참여버튼을 누른 사람의 아이디를 가져와야함-->
					<%-- <c:forEach var="item" items="${list}"> --%>
					<!-- 조건을 참여버튼을 누른 사람의 아이디를 가져오게 해야함 -->
					<%-- <c:if test="${num.size()>0}"> --%>
					<div>${item.num}</div>
					<div>${item.num}</div>
					<%-- </c:if> --%>
					<%-- </c:forEach> --%>
				</div>

				<!-- Partic: 참여란 뜻으로 참여버튼 -->
				<!-- 참여버튼 눌렀을때 인원 표시되게 해야 함-->
				<div class="Partic">
					<button>참여</button>
				</div>
				<textarea class="text_box"><%-- ${item.content} --%></textarea>
			</div>
			<!-- lower:하단이란 뜻 -->
			<div class="lower">
				<!-- modify:수정하다란 뜻 -->
				<button class="button_chatting">채팅</button>
				<a href="../update/${id}"><button class="button_modify">수정</button></a>
				<a href="../delete/${id}"><button class="button_delete">삭제</button></a>
			</div>
		</div>
	</section>
</body>
</html>