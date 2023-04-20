<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="signup.css">
</head>
<body>
 <div class="signup-box">
        <div class="title">
            회원가입
        </div>
        <br>
        <div class="blank">

           <button type="button" class="naver-btn"><img src="image/naver_logo.png" alt="">네이버로 회원가입 하기</button>
           
           <button  type="button" class="kakao-btn"><img src="image/kakao_logo.png" alt="">카카오로 회원가입 하기</button>
           
           <button  type="button" class="google-btn"><img src="image/google_logo.png" alt="">구글로 회원가입 하기</button>       
           
           <div class="blank">
               또는
            </div>
            
            <button type="button" class="email-btn">이메일로 회원가입 하기</button>
        </div>
    </div>
</body>
</html>