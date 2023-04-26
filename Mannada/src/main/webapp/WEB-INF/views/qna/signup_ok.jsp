<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="signup_ok.css">

</head>
<body>
	<div class="signup-box">
        <div class="signup_ok">
        <div>
          <img src="image/checkmark_logo.png" alt="">
        </div>
          <br>                
          회원가입 완료
      </div>
      <br>
      <div class="signup_detail">
        {닉네임}님(아이디)의 회원가입이<br>
           성공적으로 완료되었습니다.            
      </div>
      <br>
      <div class="signup_edit">
        <p>*회원가입 내역 확인 및 수정은 <span style="color: red;">마이페이지 > 회원정보 수정</span>에서 가능합니다.</p>
      </div>
      <br>
      <div class="line">
        <hr>
      </div>

      <div class="home_button">
        <a href="/index.jsp"><button class="home_btn">홈으로</button></a>
      </div>

      <div class="login_button">
       <a href="/login.jsp"><button class="login_btn">로그인바로하기</button></a>
      </div>

    </div>
</body>
</html>