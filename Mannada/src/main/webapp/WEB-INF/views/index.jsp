<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<jsp:include page="header.jsp"></jsp:include>
<link href="/resources/css/style.css" rel="stylesheet">
</head>
<body> 
	<div class="container">
		<ul>
			<li><a href="/login">사용자로그인</a></li>
			<li><a href="/signup">회원가입</a></li>
			<li><a href="/logout">로그아웃</a></li>
			<li><a href="/mypage">마이페이지</a></li>
			<li><a>${sessionScope.user.name }</a></li>
			<li><a>${sessionScope.manager.id }</a><li>
		</ul>
	
		<ul> 
			<a href="/manna/list"><li>만나다</li></a>
			<a href="/community/list"><li>커뮤니티</li></a>
			<li>공지사항
				<ul>
					<a href="/notice/list">공지사항</a>
					<a href="/qna/list">QnA</a>
				</ul>
			</li>
		</ul>
				
		<a href="/chat/list">chat</a>
	</div>
	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>