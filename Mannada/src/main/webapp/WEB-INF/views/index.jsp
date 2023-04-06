<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>북북</title>

<link href="/resources/css/style.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<div>
			<a href="/userLogin">사용자 로그인</a>
			<a href="/managerLogin">관리자 로그인</a>
			<a href="/signup">회원가입</a>
			<a href="/logout">로그아웃</a>
			<a href="/mypage">마이페이지</a>
			<a>${sessionScope.user.name }</a>
		</div>

		<div>
			<ul>
				<a href="/mannada/list"><li>만나다</li></a>
				<a href="/community/list"><li>커뮤니티</li></a>
				<li>공지사항
					<ul>
						<a href="/notice/list">공지사항</a>
						<a href="/qna/list">QnA</a>
					</ul>
				</li>
			</ul>
		</div>
		
		<div>
			<ul>
				<a href="/mannada/category"><li>카테고리</li></a>
				<a href="/mannada/category"><li>카테고리</li></a>
				<a href="/mannada/category"><li>카테고리</li></a>
				<a href="/mannada/category"><li>카테고리</li></a>
				<a href="/mannada/category"><li>카테고리</li></a>
			</ul>
		</div>
	</div>
</body>
</html>