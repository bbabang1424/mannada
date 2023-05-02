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
		<form>
			<table border="1">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				
				<tbody>
					<tr>
						<th>프로필사진</th>
						<td>
							<input type="url" name="imgUrl" value="${item.imgUrl}">	
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="id" value="${item.id}" readonly></td>
					</tr>
					
					<tr>
						<th>비밀번호</th>
						<td><a href="../password/{item.id}"><button type="button">비밀번호 변경하기</button></a></td>
					</tr>
					
					<tr>
						<th>별명</th>
						<td>
							<input type="text" name="nickname" value="${item.nickname}">
							<button>자동생성</button>
							<button>중복확인</button>
						</td>
					</tr>
					
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="name" value="${item.name}">
						</td>
					</tr>
					
					<tr>
						<th>전화번호</th>
						<td>
							<input type="tel" name="phone" id="phone" value="${item.phone}" placeholder="휴대폰 번호 (-) 없이">
							<button>본인확인</button>
		            	</td>
					</tr>
				</tbody>
			</table>
			
			<div>
				<a href="#"><button>회원탈퇴</button></a>
				<button>수정하기</button>
				<a href="/"><button>목록</button></a>
			</div>
		</form>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>