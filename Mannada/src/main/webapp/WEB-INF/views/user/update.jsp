<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<title>만나다</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/user_update.js"></script> 

<style>
.imgBox img {
	width:300px; 
	height:300px;
}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div class="Container">
		<div>
			<h3>회원정보변경</h3>
		</div>
		<div>
			<form name="updateInfo_from" method="post">
				<div>
					<label>이메일</label>
					<input type="text" name="id" value="${user.id}" readonly>
				</div>
				<div>
					<label>닉네임</label>
					<input type="text" name="nickname" id="nick" value="${user.nickname}" placeholder="${user.nickname}">	
					<button type="button" id="checkNick">닉네임 중복확인</button>
					<div id="nicknameError" class="error"></div> 
				</div>
				
				<div>
					<label>현재비밀번호</label>
					<input type="password" name="pw" id="pw">
					<button type="button" id="checkPW">확인</button>
				</div>
				
				<div>
					<label>소개</label>
					<textarea name="intro">${user.intro}</textarea>
				</div>
				
				<div>
					<button type="button" id="updateInfo">등록</button>
					<button type="button" id="goBack">이전으로</button>
				</div>
			</form>
		</div>
	</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>