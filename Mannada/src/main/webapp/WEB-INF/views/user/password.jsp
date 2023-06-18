<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<link rel="stylesheet" href="/resources/css/password.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font /bootstrap-icons.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/user_updatePW.js"></script>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div class="banner">
			<ul class="banner_text">
				<li>HOME</li>
				<i class="bi bi-caret-right-fill"></i> 
				<li>비밀번호변경</li>	
			</ul>
	</div>
	
<div class="background-image"></div>
	<div class="container-box">
		<div class="title">
			<h3>비밀번호변경</h3>
		</div>
		
		<form name="changePW_form" method="post">
			<div>
				<label>이메일(ID)</label>
				
				<div class="email">
					<input type="text" name="id" id="email" value="${user.id}" readonly>
				</div>
				 
			</div>
			<div class="password-box">
				<label>현재 비밀번호</label>
				
				<div class="password">
					<input type="password" name="pw" id="pw">
				</div>
				
				<button type="button" id="checkPW">확인</button>
			</div>
			
			<div class="new-pw-box">
				<label>새 비밀번호</label>
				
				<div class="password-new">
					<input type="password" name="newPW" id="password" maxlength="20">
				</div>
				
				<div id="passwordError" class="error"></div>
			</div>
			
			<div class="pw-ok-box">
				<label>새 비밀번호 (확인)</label>
				
				<div class="password-ok">
					<input type="password" name="newPW2">
				</div>
				
			</div>
			
			<div class="btn-box">
				<div class="go-back">
					<button type="button" id="goBack">이전으로</button>	
				</div>
			
				<div class="change">
					<button type="button" id="changePW">등록</button>
				</div>							
			</div>
		</form>
	</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>