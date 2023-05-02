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
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			
			<tbody>
				<tr>
					<th rowspan="7">프로필사진</th>
					<td rowspan="7">
							
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${item.id}</td>
				</tr>
				
				<tr>
					<th>별명</th>
					<td>${item.nickname}</td>
				</tr>
				
				<tr>
					<th>게시글</th>
					<td></td>
				</tr>
				
				<tr>
					<th>별점</th>
					<td></td>
				</tr>
			</tbody>
		</table>
		
		<div>
			<button>목록</button>
		</div>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	fun
</script>
</html>