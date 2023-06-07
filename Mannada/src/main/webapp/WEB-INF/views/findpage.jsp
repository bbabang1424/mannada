<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" href="/resources/css/findpage.css" /> 
</head>
<script>
$(function(){
	const findID = document.getElementById("findID");
	const findPW = document.getElementById("findPW");
	const fistForm = document.getElementById("form1");
	const secondForm = document.getElementById("form2");
	const container = document.querySelector(".container");
	
	findID.addEventListener("click", () => {
		//console.log("111");
	  container.classList.remove("left-panel-active");
	  container.classList.add("right-panel-active");
	});
	
	findPW.addEventListener("click", () => {
		//console.log("222");
		container.classList.remove("right-panel-active");
	  	container.classList.add("left-panel-active");
	});
	
	fistForm.addEventListener("submit", (e) => e.preventDefault());
	secondForm.addEventListener("submit", (e) => e.preventDefault());
});
</script>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div class="banner">
			<ul class="banner_text">
				<li>HOME</li>
				<i class="bi bi-caret-right-fill"></i> 
				<li>아이디/비밀번호 찾기</li>	
			</ul>
	</div>
	<div class="body">
		<div class="container right-panel-active">
			<!-- 아이디 찾기 -->
			<div class="container__form container--signup">
				<form name="findID" class="form" id="form1">
					<p class="form__title">아이디 찾기</p>
		      		<input type="email" placeholder="Email" class="input" />
					<div id="emailError" class="error"></div>
		      		<button class="btn">확인</button>
		    	</form>
		  	</div>
		
			<!-- 비밀번호 찾기 -->
			<div class="container__form container--signin">
			  	<form name="findPW" class="form" id="form2">
			    	<p class="form__title">비밀번호 찾기</p>
			      	<input type="email" placeholder="Email" class="input" />
			      	<div id="pwAlarm" class="error"></div>
			      	<button class="btn">메일 보내기</button>
			   </form>
			</div>
			
			<!-- Overlay -->
			<div class="container__overlay">
				<div class="overlay">
					<div class="overlay__panel overlay--left">
					<button class="btn" id="findPW">비밀번호 찾기</button>
					</div>
					<div class="overlay__panel overlay--right">
						<button class="btn" id="findID">아이디 찾기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>