$(function () {
    let isCheck;
    let isCheck2;
    
    let keyupPW;
    let keyupNick;

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
            swal('회원가입', '비밀번호를 입력하세요', 'info');
            form.pw.focus();
            return;
        } else if(keyupPW == false) {
            swal('회원가입', '비밀번호 형식에 맞게 입력해주세요', 'warning');
            return;
        } else if (form.pw_v.value == '') {
            swal('회원가입', '비밀번호를 확인하세요', 'info');
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
	    } else if(keyupNick == false) {
            swal('회원가입', '닉네임 형식에 맞게 입력해주세요', 'warning');
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
    
	/* 중복 이메일 확인 */
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
    
    /* 중복 닉네임 확인 */
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
    
    /* 비밀번호 구성 */
    $("#password").keyup(function(){
    	//console.log("..");
	    keyupPW = checkPassword($('#password').val());	    
	});
	function checkPassword(password){
		let passwordError = document.getElementById("passwordError");
	    let checkNumber = password.search(/[0-9]/g);
	    let checkEnglish = password.search(/[a-z]/ig);
	    let checkSpc = password.search(/[!@#$%^*+=-]/ig);
	    let checkBar = password.search(/\s/g);
	    
	    if(!/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,20}$/.test(password)){            
	        passwordError.innerText = '영어+숫자 조합으로 8~20자리 사용해야 합니다';      
	        $('#password').focus();
	        return false;
	    }
	    
	    if(checkNumber <0 || checkEnglish <0){
	        passwordError.innerText = '숫자와 영문자를 혼용하여야 합니다';
	        $('#password').focus();
	        return false;
	    }
	    
	    if(/(\w)\1\1\1/.test(password)){
	        passwordError.innerText = '같은 문자를 4번 이상 사용하실 수 없습니다'; 
	        $('#password').focus();
	        return false;
	    }
	    
	    if(checkSpc>0){
	    	passwordError.innerText = '특수문자를 사용하실 수 없습니다';      
	        $('#password').focus();
	        return false;
	    }
	    
	    if(checkBar>0){
	    	passwordError.innerText = '공백을 사용하실 수 없습니다';      
	        $('#password').focus();
	        return false;
	    }
	    
	    passwordError.innerText = '';
	    return true;
	}
    
    /* 닉네임 구성 */
    $("#nick").keyup(function(){
    	//console.log("..");
	    keyupNick =checkNick($('#nick').val());
	});
	function checkNick(nick){
		let nicknameError = document.getElementById("nicknameError");
		let checkSpc = nick.search(/[!@#$%^*+=-]/ig);
		let checkBar = nick.search(/\s/g);
					    
	    if(!/^(?=.*[a-z0-9가-힣]).{2,20}$/.test(nick)){            
	        nicknameError.innerText = '한글, 영문, 숫자만 2자리 이상 사용해야 합니다';      
	        $('#nick').focus();
	        return false;
	    }
	    
	    if(checkSpc>0){
	    	nicknameError.innerText = '특수문자를 사용하실 수 없습니다';      
	        $('#nick').focus();
	        return false;
	    }
	    
	    if(checkBar>0){
	    	nicknameError.innerText = '공백을 사용하실 수 없습니다';      
	        $('#nick').focus();
	        return false;
	    }
	    
	    nicknameError.innerText = '';
	    return true;
	}
});