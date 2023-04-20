<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 회원가입</title>
<script type="/resources/js/signup_email.js"></script>
<link href="signup_email.css" rel="stylesheet" />
</head>
<body>
	<div class="wrapper">
        <div class="title"><h1 style="font-size: 21px;">회원가입</h1></div>
        <div class="email">
            <input id="email" type="text" placeholder="이메일">
            <div id="emailError" class="error"></div>
        </div>
        <div class="name">
            <input id="name"  type="text" placeholder="이름">
            <div id="nameError" class="error"></div>
        </div>
        <div class="password">
            <input id="password" type="password" placeholder="비밀번호 (영문, 숫자 포함 최소 8자, 최대 20자 이내)">
            <div id="passwordError" class="error"></div>
        </div>
        <div class="passwordCheck">
            <input id="passwordCheck" type="password" placeholder="비밀번호 확인">
            <div id="passwordCheckError" class="error"></div>
        </div>

        <div class="nickname">
            <input id="nickname" type="text" placeholder="닉네임 (공백없이 한글, 영문, 숫자만 입력 가능)">
            <div id="nicknameError" class="error"></div>
        </div>

        <div class="phone-number">
            휴대폰 번호        
        <div class="phone">
            <input id="phone1" type="text" size="1" maxlength="3" oninput="changePhone1()"> -
            <input id="phone2" type="text" size="3" maxlength="4" oninput="changePhone2()"> -
            <input id="phone3" type="text" size="3" maxlength="4" oninput="changePhone3()">
        </div>
    </div>
        <div class="auth">
            <div id="certificationNumber">000000</div>
            <button disabled id="sendMessage" onclick="getToken()">인증번호 전송</button>
        </div>

        <div class="timer">
            <div id="timeLimit">03:00</div>
            <button disabled id="completion" onclick="checkCompletion()">인증확인</button>
        </div>
       
        <div class="gender">
            <input id="gender_man" type="radio" name="gender">남성  
            <input id="gender_woman" type="radio" name="gender">여성
            <div id="genderError" class="error"></div>
        </div>

        <div class="line">
            <hr>
        </div>

        <div class="signUp">
            <button id="signUpButton" disabled onclick="signUpCheck()">가입하기</button>
        </div>
    </div>
</body>
</html>