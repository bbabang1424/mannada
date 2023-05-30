$(function () {
    let isCheck;
    let isCheck2;

    $('#infoCheck').click(function () {
        const form = document.signup_form;
        const checkBox = $('#aggrement').is(":checked")

        if (form.id.value == '') {
            swal('회원가입', '이메일을 입력하세요', 'info');
            form.id.focus();
            return;
        } else if (isCheck != form.id.value) {
            swal('회원가입', '중복체크 해주세요', 'warning');
            return;
        } else if (form.pw.value == '') {
            swal('회원가입', '비밀번호를 입력하세요');
            form.pw.focus();
            return;
        } else if (form.pw_v.value == '') {
            swal('회원가입', '비밀번호를 확인하세요');
            form.pw_v.focus();
            return;
        } else if (form.pw.value != form.pw_v.value) {
            swal('회원가입', '비밀번호가 서로 다릅니다', 'warning');
            form.pw.focus();
            return;
        } else if (form.nickname.value == '') { 
			swal('회원가입', '닉네임을 입력해주세요', 'info');
	        form.nickname.focus();
	        return;
		} else if (isCheck2 != form.nickname.value) {
			swal('회원가입', '닉네임 중복체크 해주세요', 'warning');
	        return;
       } else if(checkBox == false) {
            swal('회원가입', '개인정보 수집 및 이용에 동의해주세요', 'warning');
            return;
       }
       swal('회원가입 완료' , '', 'success');
       form.submit();
    });

    $('#checkId').click(function () {
        const id = $('#email').val(); //이메일의 id값
        $.ajax({
            url: '/checkId', //컨트롤러에서 요청 받을 주소
            type: "GET",
            data: { "id" : id },
            success: function (id) { 
                if (id == 'OK') {
                    console.log(id);
                    swal('사용가능 합니다', '', 'success');
                    isCheck = $('#email').val();
                } else {
                    console.log(id);
                    swal('사용 불가능합니다', '', 'error');
                    $('#email').val('');
                }
            },
            //error:
        });
    });
    
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
});