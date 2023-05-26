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

<title>비밀번호변경</title>
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
			url:'/user/checkPW/${user.num}',
			contentType: "application/json",
			type: 'POST',
			data: JSON.stringify({ pw: pw}),
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
	<div class="container">
		<div>
			<h3>비밀번호변경</h3>
		</div>
		
		<form name="changePW_form" method="post">
			<div>
				<label>현재비밀번호</label>
				<input type="password" name="pw" id="pw">
				<button type="button" id="checkPW">확인</button>
			</div>
			<div>
				<label>새로운 비밀번호</label>
				<input type="password" name="newPW">
			</div>
				
			<div>
				<label>새로운 비밀번호 확인</label>
				<input type="password" name="newPW2">
			</div>
			
			<div>
				<button type="button" id="changePW">등록</button>
				<button type="button" id="goBack">이전으로</button>
			</div>
		</form>
	</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>