<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../header.jsp"></jsp:include>
<link href="/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div>
		<h5>마이페이지</h5>
		<table border="1">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			
			<tbody>
				<tr>
					<th>프로필사진</th>
					<td>
							
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${item.id}</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><a href="password"><button type="button">비밀번호 변경하기</button></a></td>
				</tr>

				<tr>
					<th>이름</th>
					<td>${item.name}</td>
				</tr>
				
				<tr>
					<th>별명</th>
					<td>${item.nickname}</td>
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td>${item.phone}</td>
				</tr>
				
				<tr>
					<th>가입날짜</th>
					<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</tbody>
		</table>
		
		<div>
			<a href="#"><button>회원탈퇴</button></a>
			<a href="../proUpdate/${item.id}"><button>변경</button></a>
			<button>목록</button>
		</div>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>