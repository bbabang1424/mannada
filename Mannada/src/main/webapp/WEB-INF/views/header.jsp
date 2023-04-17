<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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

.max-width { position: relative; max-width: 1024px; margin: 0 auto; }
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
    background-color: #004fff;
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
 
</style> 
<body>
	<div id="header">
		<div class="max-width">
		 <div class="flex">
			<div id="logo">
				<a href="/"><img src="/resources/image/logo.png"></a>
			</div>

			<div class="flex-end">
				<div class="menu">
					<ul>
						<li><a href="/mannada/list">만나다</a></li>
						<li><a href="/community/list">커뮤니티</a></li>
						<li><a href="/notice/list">공지사항</a></li>
					</ul>
				</div>
				
				<div class="login">
					<ul>
						<li><a href="/signup">회원가입</a></li>
						<li><button onclick="location.href='/login'">로그인</button></li>
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