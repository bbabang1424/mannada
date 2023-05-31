<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="header.jsp"></jsp:include>
<title>만나다</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/css/signup_email.css" />
<link rel="stylesheet" href="/resources/image/swiper1.jpg"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/signup_email.js"></script>

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
	<div class="body">
	<div class="wrapper">
		<form name="signup_form" action="/signup" method="post">
			<div class="title">
				<h1 style="font-size: 21px; font-weight:bold;">회 원 가 입</h1>
			</div>
			<div class="line">
	            <hr>
	        </div>
			<div class="email-title">이메일</div>
			<div class="email">
				<input name="id" id="email" type="email" placeholder="이메일">
				<button type="button" class="id_overlap_button" id="checkId" style="float:right;">중복확인</button>																											
				<div id="emailError" class="error"></div>
				<input id="email_auth_key" type="text" style="width: 70%;" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
				<button type="button" class="id_overlap_button" id="mail-check-btn" style="float:right;">본인인증</button>
			</div>				
			
			<div class="password-title">비밀번호</div>
			<div class="password"> 
				<input name="pw" id="password" type="password"
					placeholder="비밀번호 (영문+숫자 8~20자리)" maxlength="20">
				<div id="passwordError" class="error"></div>
			</div>
			
			<div class="passwordCheck-title">비밀번호 확인</div>
			<div class="passwordCheck">
				<input name="pw_v" id="passwordCheck" type="password"
					placeholder="비밀번호 확인">
				<div id="passwordCheckError" class="error"></div>
			</div>
			
						
			<div class="nickname-title">닉네임</div> 
	        <div class="nickname">            
	            <input name="nickname" id="nick" type="text" placeholder="닉네임 (공백없이 20자이내 한글, 영문, 숫자만 입력 가능)" maxlength="20">
	            <button type="button" class="id_overlap_button" id="checkNick" style="float:right;">중복확인</button>	            
	            <div id="nicknameError" class="error"></div>            
	        </div>    
	        
	        					
			<div class="checkbox">
				<input type="checkbox" id="aggrement">개인정보 수집 및 정보이용에 동의합니다.
			</div>
		
	        <div class="line">
	            <hr>
	        </div>
	
	        <div class="inline">
	            <div class="signUp">
	                <button type="button" id="infoCheck">회원가입</button>
	            </div>
	    
	            <div class="go_back">
	                <button type="button">취소</button>
	            </div>
	        </div>
        </form>
    </div>
	</div>
</body>

<script type="text/javascript">

$('#mail-check-btn').click(function() {
	const eamil = $('#email').val(); // 이메일 주소값 얻어오기!
	console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
	const checkInput = $('#email_auth_key') // 인증번호 입력하는곳 
	
	$.ajax({
		type : 'get',
		url : '/mailCheck?email="/>'+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}			
	}); // end ajax
}); // end send eamil

// 인증번호 비교 
// blur -> focus가 벗어나는 경우 발생
$('#email_auth_key').blur(function () {
	const inputCode = $(this).val();
	//const $resultMsg = $('#mail-check-warn');
	
	if(inputCode === code){
		$resultMsg.html('인증번호가 일치합니다.');
		$resultMsg.css('color','green');
		$('#mail-check-btn').attr('disabled',true);
		$('#mail').attr('readonly',true);
	}else{
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
		$resultMsg.css('color','red');
	}
});

$('.go_back').click(function(){
	window.history.back();
});
</script>
<jsp:include page="footer.jsp"></jsp:include>
</html>