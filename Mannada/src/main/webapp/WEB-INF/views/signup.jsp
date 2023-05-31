<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다</title>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/css/signup.css">
<link rel="stylesheet" href="/resources/image/swiper1.jpg"/>


<style type="text/css">
	#top-button{
		display: none;
	}
</style>
</head>
<body>
<div class="banner">
		<ul class="banner_text">
			<li>HOME</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>회원가입</li>
			
		</ul>
	</div>
	
<div class="background-image">
</div>
 <div class="signup-box">
        <div class="title">
            회원가입
        </div>
        <br>
        <div class="blank">

           <button type="button" class="naver-btn"><img src="/resources/image/naver_logo.png" alt="">네이버로 회원가입 하기</button>
           
           <button  type="button" class="kakao-btn"><img src="/resources/image/kakao_logo.png" alt="">카카오로 회원가입 하기</button>
           
           <button  type="button" class="google-btn"><img src="/resources/image/google_logo.png" alt="">구글로 회원가입 하기</button>       
           
           <div class="blank">
               또는
            </div>
            
            <a href="/signup_email"><button type="button" class="email-btn">이메일로 회원가입 하기</button></a>
            
        </div>
    </div>
</body>
</html>