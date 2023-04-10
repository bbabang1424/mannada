<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	li {
		display: inline-block;
		border: 1px solid black;
		margin: 10px;
	}
</style>
</head>
<body>
	<div>
		<div>
			<h3>list</h3>
		</div>

		<div>
			<c:if test="${list.size() < 1 }">
				<div>등록 된 게시글이 없습니다.</div>
			</c:if>
			
			<ul>
				<c:forEach var="item" items="${list }">
					<li>
						<div>
							<p>${item.category }</p>
							<p>${item.title }</p>
							<p>${item.userId }</p>
							<a href="update/${item.id }">변경</a>
							<a href="delete/${item.id }">삭제</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>

		<div>
			<a href="add">추가</a>
			<a href="../">이전</a>
		</div>
	</div>
</body>
</html>