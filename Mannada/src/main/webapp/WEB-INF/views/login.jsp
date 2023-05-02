<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$(".title li").eq(0).click(function() {
		$(".title li").css("text-decoration", "unset");
		$(".title li").eq(0).css("text-decoration", "underline");
		$("#manager-login").css("display", "none");
		$("#user-login").css("display", "unset");
	});

	$(".title li").eq(1).click(function() {
		$(".title li").css("text-decoration", "unset");
		$(".title li").eq(1).css("text-decoration", "underline");
		$("#user-login").css("display", "none");
		$("#manager-login").css("display", "unset");
	});
});
</script>

<style type="text/css">
	#manager-login{
		 display: none;
	}
</style>
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
	        <div>
	            <form method="post" action="/userLogin" class="login-form">
	                <div>
	                    <input class="input" type="email" id="textbox" name="id" placeholder="아이디(이메일) 입력">
	                </div>
	                
	                <div>
	                    <input class="input" type="password" id="textbox" name="pw" placeholder="비밀번호 입력">
	                </div>
	                
	                <div>
	                    <input type="checkbox" id="remember-check">아이디 저장
	                    <input type="checkbox" id="remember-check">자동 로그인
	                </div>
	                
					<button class="login-button" type="submit">로그인</button>
	            </form>
	        </div>
	
	        
	        <div class="flex">
	            <div class="find-account">
	                <a href="">아이디 찾기</a> | <a href="">비밀번호 찾기</a>               
	            </div>
	            
	        </div> 
	
	            <button type="button" class="naver-btn"><img src="/resources/image/naver_logo.png" alt="">네이버 계정으로 로그인</button>
	            
	            <button  type="button" class="kakao-btn"><img src="/resources/image/kakao_logo.png" alt="">카카오 계정으로 로그인</button>
	
	            <button  type="button" class="google-btn"><img src="/resources/image/google_logo.png" alt="">구글 계정으로 로그인</button>       
	
	            <div class="blank">
	                아직 회원이 아니신가요?
	            </div>
	
	            <div>
	                <a href="/signup"><button type="button" class="signup">회원가입</button></a>
	            </div>
	        </div>
	        
	        
	        <div id="manager-login">
	            <form method="post" action="/managerLogin" class="login-form">
	                <div>
	                    <input class="input" type="email" id="textbox" name="id" placeholder="아이디(이메일) 입력">
	                </div>
	                
	                <div>
	                    <input class="input" type="password" id="textbox" name="pw" placeholder="비밀번호 입력">
	                </div>
	                
	                <div>
	                    <input type="checkbox" id="remember-check">아이디 저장
	                    <input type="checkbox" id="remember-check">자동 로그인
	                </div>
	                
					<button class="login-button" type="submit">로그인</button>
				</form>
	        </div>
        </div>
        
         
</body>
</html>