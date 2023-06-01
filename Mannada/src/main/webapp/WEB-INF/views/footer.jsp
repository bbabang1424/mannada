<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.footer { width: 100%; background-color:#4d4d4d; color:#fff; padding: 50px 0 100px; font-size: 10pt; z-index:5; position: relative; }
.footer a { color: #fff; }
.footer-flex { display: flex; }

#logo-footer img { width: 170px; filter: invert(99%) sepia(77%) saturate(343%) hue-rotate(228deg) brightness(120%) contrast(100%);}

.footer-contents { margin-left: 40px; }
.footer-contents span { position:relative; margin-left: 30px; }
.footer-contents > div:not(:first-child) { margin-bottom: 15px; }
.footer-top { font-weight: 700; padding: 20px 0 40px;}
.footer-top span:not(:last-child)::after {
    content: "";
    position: absolute;
    top: 6px;
    right: -17px;
    width: 1px;
    height: 10px;
    background-color: #999;
}
.footer-info { display: grid; }
</style>
</head>
<body>

	<div class="footer">
		<div class="max-width footer-flex">
			<div>
				<div id="logo-footer"> 
					<img src="/resources/image/logo.png">
				</div>
			</div>
			
			<div class="footer-contents">
				<div class="footer-top">
					<span><a href="#">개인정보처리방침</a></span>
					<span><a href="/notice/list">공지사항</a></span>
					<span><a href="/qna/list">QnA</a></span>
				</div>
				
				<div class="footer-info">
					<span><b>주소</b>    대전광역시 동구 우암로 352-21</span>
					<span><b>TEL 042-670-0600</b>   FAX 042-670-0519</span>
				</div>
				
				<div class="copyright">
					<span>COPYRIGHT 2023 BY MANNADA ALL RIGHTS RESERVED.</span>
				</div>
				
				<div class="footer-info">
					<span>본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며,</span>
					<span>이를 위반시 정보통신망법에 의해 형사처벌 됨을 유념하시기 바랍니다.</span>
				</div>
				
			</div>
			
		</div>
	</div>
	
	
</body>
</html>