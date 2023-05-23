/*EtValue>> enrolment:등록 EtValue>
줄여서 등록값*/
/*제목 아이디 써야 등록*/
function EtValue() {
	const form = document.write_post;
	
	let content = form.content.value.replace(/&nbsp;/g, '');
	content = content.replace("<br>", '');
	content = content.replace("<p>", '');
	content = content.replace("</p>", '');
	

	if(form.title.value == '' || form.title.value == ' ') {
        swal('','제목을 입력해주세요.','error')
		form.title.focus();
		return;
	}else if(content.trim() == '') {
        swal('','내용을 입력해주세요.','error')
		form.content.focus();
		return;
	}
	form.submit();
}