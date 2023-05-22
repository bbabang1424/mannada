/*EtValue>> enrolment:등록 EtValue>
줄여서 등록값*/
/*제목 아이디 써야 등록*/
function EtValue() {
	const form = document.write_post;
	
	if(form.title.value == '' || form.title.value == ' ') {
        swal('','글의 내용을 입력해주세요.','error')
		form.title.focus();
		return;
	}else if(form.content.value == '' || form.content.value == ' '){
        
		form.content.focus();
		return;
	}
	form.submit();
}