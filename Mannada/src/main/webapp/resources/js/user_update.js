$(function() { 
	let isCheck2;
	let isCheck3;
	
	let keyupNick;
	
	$('#updateInfo').click(function(){
		const form = document.updateInfo_from;
		
		//console.dir(form.nickname);
		
		$('#nick').click(function(){
			if (form.nickname.value == '') { 
				swal('회원정보변경', '닉네임을 입력해주세요', 'info');
	            form.nickname.focus();
	            return;
	        } else if(keyupNick == false) {
	            swal('회원정보변경', '닉네임 형식에 맞게 입력해주세요', 'warning');
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
	
	/* 뒤로 가기 */
	$('#goBack').click(function(){
		window.history.back();
	});
});