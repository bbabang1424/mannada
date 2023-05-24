<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="icon" type="image/ico"  href="/resources/image/favicon.ico"/>
<title>만나다</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="/resources/css/header.css" rel="stylesheet"> 
 
<script>
$(function() {
	  $('#check_box').on('click', function() {
	    event.stopPropagation();  
	    $('.header-nav').slideToggle('fast');
	  });

	  $('.header-nav').on('click', function() {
	    event.stopPropagation();
	  });
	// 다른 부분 누르면 자동으로 닫히게끔 하는 기능 추가하고 싶음
	

	  var btn = $('#top-button');
	  var btn2 = $('#talk-button');
		
	  /*
		$(window).scroll(function() {
		  if ($(window).scrollTop() > 300) {
		    btn.addClass('show');
		    btn2.addClass('show');
		  } else {
		    btn.removeClass('show');
		    btn2.removeClass('show');
		  }
		 
		});
	*/
		btn.on('click', function(e) {
		  e.preventDefault();
		  $('html, body').animate({scrollTop:0}, '300');
		});

});
</script>
<body>
	
	<div id="header">
		<div class="max-width">
		<div>
		 <div class="flex">
			<div id="logo">
				<a href="/"><img src="/resources/image/logo.png"></a>
			</div>

			<div class="flex-end">
				<div class="menu">
					<ul>
						<li><a href="/manna/list">만나다</a></li>
						<li><a href="/community/list">커뮤니티</a></li>
						<li><a href="/notice/list">공지사항</a></li>
					</ul>
				</div>
				
				<div class="login">
					<ul>
						<c:if test="${sessionScope.user == null && sessionScope.manager == null}">
							<li><a href="/signup">회원가입</a></li>
							<li><button onclick="location.href='/login'">로그인</button></li>
						</c:if>
						
						<c:if test="${sessionScope.user != null}">
							<li><a href="/user/view/${sessionScope.user.num}">${sessionScope.user.nickname}님</a></li>
							<li><button onclick="location.href='/logout'">로그아웃</button></li>
						</c:if>
						
						<c:if test="${sessionScope.manager != null}">
							<li><a href="/mg/view/${sessionScope.manager.num}">${sessionScope.manager.nickname}님</a></li>
							<li><button onclick="location.href='/logout'">로그아웃</button></li>
						</c:if>
					</ul>
				</div>
			</div>
				
			<div id="ham">
				<input type="checkbox" id="check_box" />
				    <label for="check_box">
				      <span></span>
				      <span></span>
				      <span></span>
				    </label>
			</div>

		 </div>			
		 </div>
		</div>	
	</div>
	
	<div class="header-nav">
		<div class="max-width header-inner">
			<div class="header-line">
				<ul>
					<h5><a href="/manna/list">만나다</a></h5>
					<li><a href="/mannada/category">공동구매</a></li>
					<li><a href="/mannada/category">스포츠</a></li>
					<li><a href="/mannada/category">게임</a></li>
					<li><a href="/mannada/category">식사</a></li>
					<li><a href="/mannada/category">기타</a></li>
				</ul>
			</div>
			
			<div class="header-line">
				<ul>
					<h5><a href="/community/list">커뮤니티</a></h5>
				</ul>
			</div>
			
			<div class="header-line">
				<ul>
					<h5>공지사항</h5>
					<li><a href="/notice/list">공지사항</a></li>
					<li><a href="/qna/list">QnA</a></li>
				</ul>
			</div>
			
			<div class="header-line">
				<ul>
<<<<<<< HEAD
					<c:if test="${sessionScope.user == null && sessionScope.manager == null}">
						<h5><a href="/login">마이페이지</h5>
					</c:if>
					<c:if test="${sessionScope.user != null}">
						<h5><a href="/user/view/${sessionScope.user.num}">마이페이지</h5>
					</c:if>
					<c:if test="${sessionScope.manager != null}">
						<h5><a href="/mg/view/${sessionScope.manager.num}">마이페이지</h5>
					</c:if>
=======
					<h5><a href="/mypage">마이페이지</a></h5>
>>>>>>> branch 'master' of https://github.com/xyident/mannada.git
				</ul>
			</div>
		</div>
	</div>
	

	<c:if test="${sessionScope.user != null}">
		<a href="/chat/list" id="talk-button" class="show"></a>
	</c:if>
	<a id="top-button" class="show"></a>