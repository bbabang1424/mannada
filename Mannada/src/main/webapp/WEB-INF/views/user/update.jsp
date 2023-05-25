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

<title>회원정보수정</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(function() {
	let isCheck2;
	let isCheck3;
	
	$('#updateInfo').click(function(){
		const form = document.updateInfo_from;
		
		//console.dir(form.nickname);
		
		$('#nick').click(function(){
			if (form.nickname.value == '') { 
				swal('회원정보변경', '닉네임을 입력해주세요', 'info');
	            form.nickname.focus();
	            return;
			} else if (isCheck2 != form.nickname.value) {
				swal('회원정보변경', '닉네임 중복체크 해주세요', 'warning');
	            return;
			}
		})
		
		if (form.pw.value == '') {
			swal('회원정보변경', '현재비밀번호를 입력해주세요', 'info');
            form.pw.focus();
            return;
		} else if (isCheck3 != form.pw.value) {
			swal('회원정보변경', '현재비밀번호를 확인해주세요', 'warning');
			return;
        } else if (form.intro.value == '') {
        	swal('회원정보변경', '간단한 소개를 입력해주세요', 'info');
            form.intro.focus();
            return;
		}
		swal('회원정보변경이 완료되었습니다', '', 'success');
	     console.dir(updateInfo_from);
	     form.submit();
	})
	
	$('#checkNick').click(function () {
    	const nickname = $('#nick').val();
        $.ajax({
            url: '/checkNick/' + nickname, //컨트롤러에서 요청 받을 주소
            type: "GET",
            //data: { nickname: nickname }, : ?nickname으로 경로 data값이 나옴 = 즉 경로가 변함
            success: function (nickname) { 
                if (nickname == 'OK') {
                    console.log(nickname);
                    swal('사용가능 합니다', '', 'success');
                    return isCheck2 = $('#nick').val();
                } else {
                    console.log(nickname);
                    swal('사용 불가능합니다', '', 'error');
                    return $('#nick').val('');
                }
            },
            //error:
        });
    });
	
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
					swal("정보 변경이 가능합니다", '', 'success');
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
			<h3>회원정보변경</h3>
		</div>
		<div>
			<form name="updateInfo_from" method="post">
				<div>
					<label>이메일</label>
					<input type="text" name="id" value="${user.id}" readonly>
				</div>
				<div>
					<label>닉네임</label>
					<input type="text" name="nickname" id="nick" value="${user.nickname}">
					<button type="button" id="checkNick">닉네임 중복확인</button>
				</div>
				
				<div>
					<label>현재비밀번호</label>
					<input type="password" name="pw" id="pw">
					<button type="button" id="checkPW">확인</button>
				</div>
				
				<div>
					<label>소개</label>
					<textarea name="intro">${user.intro}</textarea>
				</div>
				
				<div>
					<button type="button" id="updateInfo">등록</button>
					<button type="button" id="goBack">이전으로</button>
				</div>
			</form>
		</div>
	</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>