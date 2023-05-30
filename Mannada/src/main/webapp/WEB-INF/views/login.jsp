<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다</title>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet" href="/resources/image/swiper1.jpg"/>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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

/*아이디, 비밀번호 입력하면 로그인*/
function userValue() {
	const form = document.user_login;
	
	if(form.id.value == '') {
		form.id.focus();
		return;
	}else if(form.pw.value == ''){
		form.pw.focus();
		return;
	}
	form.submit();
}

function mgValue() {
	const form = document.mg_login;
	
	if(form.id.value == '') {
		form.id.focus();
		return;
	}else if(form.pw.value == ''){
		form.pw.focus();
		return;
	}
	form.submit();
}
</script>

<style type="text/css">
#manager-login{
	display: none;
}
</style>
</head>
<body>
<div class="banner">
		<ul class="banner_text">
			<li>HOME</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>로그인</li>
			
		</ul>
	</div>
<div class="background-image">
</div>

	<div class="login-box">
        <br>
        <div class="title">
            <ul>
                <li style="cursor: pointer;">사용자 로그인</li>
                <li style="cursor: pointer;">관리자 로그인</li>
            </ul>
        </div>
        
        <security:http>
			<security:remember-me data-source-ref="dataSource" token-validity-seconds="604800"/>
			
			<!-- logout -->
			<security:logout logout-url="/logout" invalidate-session="true" delete-cookies="remember-me, JSEESION_ID"/>
		</security:http>

        <div id="user-login">
	        <div>
	            <form name="user_login" method="post" action="/userLogin" class="login-form">
	                <div>
	                    <input class="input" type="email" id="textbox user_id" name="id" placeholder="아이디(이메일) 입력">
	                </div>
	                
	                <div>
	                    <input class="input" type="password" id="textbox user_pw" name="pw" placeholder="비밀번호 입력">
	                </div>
	                
	                <div>
	                    <input type="checkbox" id="remember-check">아이디 저장
	                    <input name="remember-me" type="checkbox" id="remember-check">자동 로그인
	                </div>
	                
					<button class="login-button" type="button" onclick="userValue()">로그인</button>
					
					<!--  csrf 공격 방어를 위해 동적 생성 -->
    				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	            </form>
	        </div>
	
	        
	        <div class="flex">
	            <div class="find-account">
	               | <a href="">아이디 찾기</a> | <a href="">비밀번호 찾기</a> |               
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
	            <form name="mg_login" method="post" action="/managerLogin" class="login-form">
	                <div>
	                    <input class="input" type="email" id="textbox mg_id" name="id" placeholder="아이디(이메일) 입력">
	                </div>
	                
	                <div>
	                    <input class="input" type="password" id="textbox mg_pw" name="pw" placeholder="비밀번호 입력">
	                </div>
	                
	                <div>
	                    <input type="checkbox" id="remember-check">아이디 저장
	                    <input type="checkbox" id="remember-check">자동 로그인
	                </div>
	                
					<button class="login-button" type="button" onclick="mgValue()">로그인</button>
				</form>
	        </div>
        </div>     
</body>
</html>