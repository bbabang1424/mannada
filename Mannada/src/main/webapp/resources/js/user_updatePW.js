$(function() { 
	let isCheck3;
	
	let keyupPW;
	
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
        } else if(keyupPW == false) {
            swal('비밀번호변경', '비밀번호 형식에 맞게 입력해주세요', 'warning');
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
			url: url,
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
	
	$('#goBack').click(function(){
		window.history.back();
	});
});