<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="login.css">
</head>
<body>
	<div class="login-box">
        <br>
        <div class="title">
            <ul>
                <li>사용자 로그인</li>
                <li>관리자 로그인</li>
            </ul>
        </div>

        <div id="user-login">
            <form method="post" action="서버의url" class="login-form">
                <div>
                    <input class="input" type="text" id="textbox" name="textbox" placeholder="아이디(이메일) 입력">
                </div>
                <div>
                    <input class="input" type="text" id="textbox" name="textbox" placeholder="비밀번호 입력">
                </div>
                <div>
                    <input type="checkbox" id="remember-check">아이디 저장
                    <input type="checkbox" id="remember-check">자동 로그인
                </div>
            </form>
        </div>


        <div id="manager-login">
            <form method="post" action="서버의url" class="login-form">
                <div>
                    <input class="input" type="text" id="textbox" name="textbox" placeholder="아이디(이메일) 입력">
                </div>
                <div>
                    <input class="input" type="text" id="textbox" name="textbox" placeholder="비밀번호 입력">
                </div>
                <div>
                    <input type="checkbox" id="remember-check">아이디 저장
                    <input type="checkbox" id="remember-check">자동 로그인
                </div>
            </form>
        </div>

        <button class="login-button" type="submit">로그인</button>
        
        <div class="flex">
            <div class="find-account">
                <a href="">아이디 찾기</a> | <a href="">비밀번호 찾기</a>               
            </div>
            
        </div> 

            <button type="button" class="naver-btn"><img src="image/naver_logo.png" alt="">네이버 계정으로 로그인</button>
            
            <button  type="button" class="kakao-btn"><img src="image/kakao_logo.png" alt="">카카오 계정으로 로그인</button>

            <button  type="button" class="google-btn"><img src="image/google_logo.png" alt="">구글 계정으로 로그인</button>       

            <div class="blank">
                아직 회원이 아니신가요?
            </div>

            <div>
                <a href=""><button type="button" class="signup">회원가입</button></a>
            </div>
        </div>
</body>
</html>