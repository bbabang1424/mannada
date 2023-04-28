<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 회원가입</title>
<script src="/resources/js/signup_email.js"></script>
<link rel="stylesheet" href="/resources/css/signup_email.css" />

<script>
   let idCheck;
   
   function checkId(){
      const form = document.signup_form;
      
      const xhr = new XMLHttpRequest();
      
      xhr.onreadystatechange = function(){
         console.log(xhr.readyState);
         
         if(xhr.readyState == XMLHttpRequest.DONE){
            if(xhr.status == 200) { 
                  
               const result = xhr.responseText;
               console.log("응답 : " + result);
               
               if(result == "OK") {
                  alert("사용 가능한 아이디 입니다");
                  idCheck = form.id.value;
               } else
                  alert("이미 사용중인 아이디 입니다");
            }
         }
      };
      
      xhr.open("GET", "checkId/" + form.id.value, true);
      
      xhr.send();
      
   }

   function signup() {
      const form = document.signup_form;

      if(idCheck != form.id.value){
         alert("아이디 중복 검사를 해야 합니다.");
         return;
      }
      
      if(form.id.value == "") {
         alert("아이디를 입력 해 주세요");
         form.id.focus();
         return;
      }
      
      if(form.pw.value == "") {
         alert("비밀번호를 입력 해 주세요");
         form.pw.focus();
         return;
      }
      
      if(form.passwd_valid.value == "") {
         alert("비밀번호 확인을 입력 해 주세요");
         form.pw_v.focus();
         return;
      }
      
      if(form.pw.value != form.pw_v.value) {
         alert("비밀번호가 일치하지 않습니다");
         form.pw.focus();
         return;
      }
      
      form.submit();
   }

</script>
</head>
<body>
	<div class="wrapper">
		<form name="signup_form" action="/signup" method="post">

			<div class="title">
				<h1 style="font-size: 21px;">회원가입</h1>
			</div>

			<div class="email">
				<input id="email" type="email" name="id" placeholder="이메일">
				<div id="emailError" class="error"></div>
			</div>

			<div class="name">
				<input id="name" type="text" name="name" placeholder="이름">
				<div id="nameError" class="error"></div>
			</div>

			<div class="password">
				<input id="password" type="password" name="pw"
					placeholder="비밀번호 (영문, 숫자 포함 최소 8자, 최대 20자 이내)">
				<div id="passwordError" class="error"></div>
			</div>

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
</body>
</html>