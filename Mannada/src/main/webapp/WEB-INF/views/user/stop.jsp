<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<title>만나다</title>
<link rel="stylesheet" href="/resources/css/stop.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font /bootstrap-icons.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script> 
$(function() {
	let isCheck3;
	
	$('#stop').click(function(){
		const form = document.stop_from;
		
		//console.dir(form.newPW);
		
		if (form.pw.value == '') {
			swal('회원탈퇴', '현재비밀번호를 입력해주세요', 'info');
            form.pw.focus();
            return;
		} else if (isCheck3 != form.pw.value) {
			swal('회원탈퇴', '현재비밀번호를 확인해주세요', 'warning');
			return;
        }
		swal('회원탈퇴가 완료되었습니다.', '', 'success');
	     //console.dir(changePW_form);
	     form.submit();
	})
	
	$('#checkPW').click(function() {
		const pw = $('#pw').val();
		$.ajax({
			url:'/user/checkPW/${user.num}',
			contentType: "application/json",
			type: 'POST',
			data: JSON.stringify({ pw: pw}),
			success: function(pw) {
				if(pw == 'OK') {
					console.log("인증성공"+pw);
					swal("회원탈퇴가 가능합니다", '', 'success');
					return isCheck3 = $('#pw').val();
				} else {
					console.log("인증실패"+pw);
					swal("현재비밀번호가 아닙니다", '', 'error');
					return $('#pw').val('');
				} 
			}
		});
	});
	
	$('#goBack').click(function(){
		window.history.back();
	});
});
</script>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div class="banner">
			<ul class="banner_text">
				<li>HOME</li>
				<i class="bi bi-caret-right-fill"></i> 
				<li>회원탈퇴</li>	
			</ul>
	</div>
	
<div class="background-image"></div>

	<div class="container-box">
		<div class="title">
			<h3>회원탈퇴</h3>
			
			<p>서비스를 더이상 이용하실 수 없습니다. <br> 계속 진행하시겠습니까?</p>			
		</div>
		
		<div class="title-sub">
			<p>* 회원탈퇴를 진행하셔도 개인정보나 <br> 게시한 글에 대한 정보는 1년 후에 완전히 삭제됩니다.</p>
		</div>
		
		
		<div>
			<form name="stop_from" method="post">
				<div class="password">
					<label>현재 비밀번호</label>
					
					<div class="pw">
						<input type="password" name="pw" id="pw">
					</div>
					
					<button type="button" id="checkPW">확인</button>
				</div>
				
				<div class="btn-box">
					<div class="go-back-btn">
						<button type="button" id="goBack">이전으로</button>
					</div>
				
					<div class="stop-btn">
						<button type="button" id="stop">회원탈퇴</button>
					</div>										
				</div>
			</form>
		</div>
	</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>