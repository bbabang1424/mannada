<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<link rel="stylesheet" href="/resources/css/password.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script> 
$(function() {
	let isCheck3;
	
	$('#changePW').click(function(){
		const form = document.changePW_form;
		
		//console.dir(form.newPW);
		
		if (form.pw.value == '') {
			swal('비밀번호변경', '현재비밀번호를 입력해주세요', 'info');
            form.pw.focus();
            return;
		} else if (isCheck3 != form.pw.value) {
			swal('비밀번호변경', '현재비밀번호를 확인해주세요', 'warning');
			return;
		} else if (form.newPW.value == '') {
			swal('비밀번호변경', '새로운 비밀번호를 입력해주세요', 'info');
            form.newPW.focus();
            return;
		} else if (form.newPW2.value == '') {
			swal('비밀번호변경', '새로운 비밀번호 확인해주세요', 'info');
            form.newPW2.focus();
            return;
		} else if (form.newPW.value != form.newPW2.value) {
			swal('비밀번호변경', '새로운 비밀번호가 서로 다릅니다', 'warning');
            form.newPW.focus();
            form.newPW2.focus();
            return;
        }
		swal('비밀번호 변경이 완료되었습니다', '', 'success');
	     //console.dir(changePW_form);
	    form.submit();
	})
	
	$('#checkPW').click(function() {
		const pw = $('#pw').val();
		$.ajax({
			url:'/mg/checkPW',
			contentType: "application/json",
			type: 'POST',
			data: JSON.stringify({
				//불러오는 값이 이메일이면 .kr을 확장자로 처리해서 삭제되기 때문에 
				//따로 데이터에 '값'을 넣어서 문자열이라는 것을 인식시켜야함 : 회원번호로 구성하는게 베스트 
				id: '${manager.id}',
				pw: pw}),
			success: function(pw) {
				if(pw == 'OK') { 
					console.log(pw);
					swal("비밀번호 변경이 가능합니다", '', 'success');
					return isCheck3 = $('#pw').val();
				} else {
					console.log(pw);
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
				<li>비밀번호변경</li>	
			</ul>
	</div>
	
<div class="mg-background-image"></div>

	<div class="mg-container-box">
		<div class="title">
			<h3>비밀번호변경</h3>
		</div>
		
		<form name="changePW_form" method="post">
			<div class="password-box">
				<label style="font-weight: bold;">현재비밀번호</label>
				
				<div class="password">
					<input type="password" name="pw" id="pw">
				</div>
				
				<button type="button" id="checkPW">확인</button>
			</div>
			
			<div class="new-pw-box">
				<label style="font-weight: bold;">새 비밀번호</label>
				
				<div class="password-new">
					<input type="password" name="newPW">
				</div>
			</div>
				
			<div class="pw-ok-box">
				<label style="font-weight: bold;">새로운 비밀번호 (확인)</label>
				
				<div class="password-ok">
					<input type="password" name="newPW2">
				</div>
			</div>
			
			<div class="btn-box">	
				<div class="go-back">			
					<button type="button" id="goBack">이전으로</button>
				</div>
				
				<div class="change">
					<button type="button" id="changePW">등록</button>
				</div>
			</div>
		</form>
	</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>