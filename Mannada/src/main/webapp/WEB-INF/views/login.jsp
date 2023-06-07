<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet" href="/resources/image/swiper1.jpg"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
/* 코드 많아서 js파일로 생성 시 에러발생함. jsp파일에 그냥 두기 */
$(function(){
	//메세지는 일치여부 하나니까 나눌 필요x
	const msg = '${msg}';
	if(msg)
		swal('로그인', msg, 'error');
	
	/* 유저 : 아이디 저장 표시 */
	let mail = getCookie("Cookie_mail");
	console.log(mail);		
	if(mail) {
		$("#user-login input[name='id']").val(mail);
		$("#user-rememberId").attr("checked", true);
	}
	
	/* 관리자 : 아이디 저장 표시 */
	let id = getCookie("Cookie_id");	
	console.log(id);	
	if(id) {
		$("#manager-login input[name='id']").val(id);
		$("#mg-rememberId").attr("checked", true);
	}
	
	$(".title li").eq(0).click(function() {
		$(".title li").css("text-decoration", "unset");
		$(".title li").css("font-size", "0.8em");
		$(".title li").css("font-weight", "400");
		$(".title li").eq(0).css("font-size", "1em");
		$(".title li").eq(0).css("font-weight", "bold");
		$("#manager-login").css("display", "none");
		$("#user-login").css("display", "unset");
	});

	$(".title li").eq(1).click(function() {
		$(".title li").css("text-decoration", "unset");
		$(".title li").css("font-size", "0.8em");
		$(".title li").css("font-weight", "400");
		$(".title li").eq(1).css("font-size", "1em");
		$(".title li").eq(1).css("font-weight", "bold");
		$("#user-login").css("display", "none");
		$("#manager-login").css("display", "unset");
	});
});
/* 아이디, 비밀번호 입력하면 로그인 */
function userValue() {
	const form = document.user_login;
	const checkBox = $('#user-rememberId').is(":checked");
	
	if(form.id.value == '') {
		form.id.focus();
		return; // 아래 if문을 막는다.
	} else if(form.pw.value == ''){
		form.pw.focus();
		return;
	} else if(checkBox){
		setCookie("Cookie_mail", form.id.value, 7);
	} else {
		deleteCookie("Cookie_mail");
	}
	form.submit();
}

function mgValue() {
	const form = document.mg_login;
	const checkBox = $('#mg-rememberId').is(":checked");
	
	if(form.id.value == '') {
		form.id.focus();
		return;
	} else if(form.pw.value == ''){
		form.pw.focus();
		return;
	} else if(checkBox){
		setCookie("Cookie_id", form.id.value, 7);
	} else {
		deleteCookie("Cookie_id");
	}
	form.submit();
}

/* 쿠키 관련 코드 */
//저장
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
//삭제
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
//불러오기
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>

<style>
#manager-login{
	display: none;
}

#center {
	margin-left:15%;
	margin-right:15%;
}
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
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
                <li style="cursor: pointer;" id="user">사용자 로그인</li>
                <span id="center">|</span>
                <li style="cursor: pointer;" id="mg">관리자 로그인</li>
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
	                    <input class="input" type="email" id="textbox user_id" name="id" placeholder="이메일 입력"
	                    value="">
	                </div>
	                
	                <div>
	                    <input class="input" type="password" id="textbox user_pw" name="pw" placeholder="비밀번호 입력">
	                </div>
	                
	                <div>
	                    <input type="checkbox" id="user-rememberId"> 아이디 저장
	                </div>
	                
					<button class="login-button" type="button" onclick="userValue();">로그인</button>
					
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
	                    <input class="input" type="text" id="textbox mg_id" name="id" placeholder="아이디 입력"
	                    value="">
	                </div>
	                
	                <div>
	                    <input class="input" type="password" id="textbox mg_pw" name="pw" placeholder="비밀번호 입력">
	                </div>
	                
	                <div>
	                    <input type="checkbox" id="mg-rememberId"> 아이디 저장
	                </div>
	                
					<button class="login-button" type="button" onclick="mgValue();">로그인</button>
				</form>
	        </div>
        </div>     
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>