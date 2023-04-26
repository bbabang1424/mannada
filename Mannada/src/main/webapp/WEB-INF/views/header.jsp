<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>만나다</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<style>
a {text-decoration: none;}
li { list-style:none; }
#header {
	width: 100%;
	background-color: #fff; 
	position: sticky;
	top: 0;
	z-index: 100;
    padding: 10px 0;
}

#header li { display:inline-block;}

.max-width { position: relative; max-width: 1200px; margin: 0 auto; }
.flex {display: flex; align-items:center;}
.flex-end {margin-left: auto!important; display: inline-flex; align-items: center;}

#logo {display: inline-block;}
#logo img { width: 170px; filter: invert(20%) sepia(85%) saturate(7275%) hue-rotate(211deg) brightness(97%) contrast(98%); }

.menu, .login { position: relative;}
.menu ul, .login ul { margin-bottom: 0; }
.menu li, .login li { padding: 0 13px; font-size: 12pt; }
.menu a, .login a { color: #000; }
.menu li { font-weight:700; }
.login { margin-right: 10px; }
.login button {
	width: 90px;
    height: 35px;
    background-color: #0359d9;
    border: none;
    color: white;
    border-radius: 20px;
}
 
#check_box { display: none; }

#check_box + label {
  position: relative;
  display: block;
  width: 25px;
  height: 17px;
  cursor: pointer;
}

#check_box + label > span {
  position: absolute;
  display: block;
  width: 100%;
  height: 2.5px;
  background: #000; 
  transition: all 300ms;
}

#check_box:checked + label > span:nth-child(1) {
  top: 50%;
  transform: translate(0, -50%);
  transform: rotate(45deg);
} 

#check_box + label > span:nth-child(2) {
  top: 50%;
  transform: translate(0, -50%);
}

#check_box:checked + label > span:nth-child(2) {
  opacity: 0;
}

#check_box + label > span:nth-child(3) {
  bottom: 0;
}

#check_box:checked + label > span:nth-child(3) {
  top: 50%;
  transform: translate(0, -50%);
  transform: rotate(-45deg);
}

.header-nav { display:none; background-color:#fff; border-top:1px solid #d9d9d9; border-bottom:1px solid #d9d9d9;  position: fixed; top: 87.76px; width:100%; z-index:99; } 
.header-inner {    padding: 50px 20px; }
.header-nav ul {display: flex;}
.header-nav h5 { position: relative; }
.header-nav li {padding: 0 15px;}
 
 
#top-button {
  display: inline-block;
  background-color:#0359d9;
  width: 50px;
  height: 50px;
  text-align: center;
  border-radius: 25px;
  position: fixed;
  bottom: 30px;
  right: 30px;
  transition: background-color .3s, 
    opacity .5s, visibility .5s;
  opacity: 0;
  visibility: hidden;
  z-index: 1000;
  color:#fff
}
#top-button::before {
  content: "\f077";
  display: block;
  font-family: FontAwesome;
  font-weight: normal;
  font-style: normal;
  font-size: 5pt;
  color: #fff;
  padding-top: 16px;
  line-height: 0px;
}
#top-button::after {
  content: "TOP";
  font-weight: 900; 
  font-style: normal;
  font-size: 5pt;
  line-height: 10px;
  color: #fff;
}
#top-button:hover {
  cursor: pointer;
  background-color: #333;
}
#top-button:active {
  background-color: #555;
}
#top-button.show {
  opacity: 1;
  visibility: visible;
}


</style>
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

		$(window).scroll(function() {
		  if ($(window).scrollTop() > 300) {
		    btn.addClass('show');
		  } else {
		    btn.removeClass('show');
		  }
		});

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
						<c:if test="${sessionScope.user == null}">
							<li><a href="/signup">회원가입</a></li>
							<li><button onclick="location.href='/login'">로그인</button></li>
						</c:if>
						
						<c:if test="${sessionScope.user != null}">
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
			<div>
				<ul>
					<h5>만나다</h5>
					<li><a href="/mannada/category">공동구매</a></li>
					<li><a href="/mannada/category">스포츠</a></li>
					<li><a href="/mannada/category">게임</a></li>
					<li><a href="/mannada/category">식사</a></li>
					<li><a href="/mannada/category">기타</a></li>
				</ul>
			</div>
			
			<div>
				<ul>
					<h5><a href="/community/list">커뮤니티</a></h5>
				</ul>
			</div>
			
			<div>
				<ul>
					<h5>공지사항</h5>
					<li><a href="/notice/list">공지사항</a></li>
					<li><a href="/qna/list">QnA</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<a id="top-button"></a>