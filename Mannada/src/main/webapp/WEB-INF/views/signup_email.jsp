<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="header.jsp"></jsp:include>
<title>이메일 회원가입</title>
<link rel="stylesheet" href="/resources/css/signup_email.css" />
<link rel="stylesheet" href="/resources/image/swiper1.jpg"/>


<style type="text/css">
	#top-button{
		display: none;
	}
</style>
</head>
<body>
<div class="background-image">
</div>
	<div class="body">
	<div class="wrapper">
		<form name="signup_form" action="/signup" method="post">
			<div class="title">
				<h1 style="font-size: 21px; font-weight:bold;">회원가입</h1>
			</div>
			<div class="email-title">이메일</div>
			<div class="email">
				<input id="email" type="email" name="id" placeholder="이메일">
				<div id="emailError" class="error"></div>
			</div>
			<div class="name-title">이름</div>
			<div class="name">
				<input id="name" type="text" name="name" placeholder="이름">
				<div id="nameError" class="error"></div>
			</div>
			<div class="password-title">비밀번호</div>
			<div class="password">
				<input id="password" type="password" name="pw"
					placeholder="비밀번호 (영문, 숫자 포함 최소 8자, 최대 20자 이내)">
				<div id="passwordError" class="error"></div>
			</div>
			<div class="passwordCheck-title">비밀번호 확인</div>
			<div class="passwordCheck">
				<input id="passwordCheck" type="password" name="pw_v"
					placeholder="비밀번호 확인">
				<div id="passwordCheckError" class="error"></div>
			</div>

			<div class="nickname-title">닉네임</div>
	        <div class="nickname">            
	            <input name="nickname" id="nickname" type="text" placeholder="닉네임 (공백없이 한글, 영문, 숫자만 입력 가능)">
	            <button type="button" class="id_overlap_button" onclick="id_overlap_check()" style="float:right;">중복확인</button>
	            <div id="nicknameError" class="error"></div>            
	        </div>      
	
		    <div class="phone-title">휴대폰 번호</div>               
	        <div class="phone">
	            <input type="tel" name="phone" id="phone" placeholder="휴대폰 번호 (-) 없이">
	            <button type="button" class="id_overlap_button" style="float:right;">본인인증</button>
	        </div>
	
	        <div class="line">
	            <hr>
	        </div>
	
	        <div class="inline">
	            <div class="signUp">
	                <button>회원가입</button>
	            </div>
	    
	            <div class="go_back">
	                <button type="button">취소</button>
	            </div>
	        </div>
        </form>
    </div>
	</div>
</body>
</html>