function replyUpdate(replyId, commuId, content){
	const reply = document.querySelector(".reply-content." + replyId);
	
	const div = '<div id = "reply-update">';
    div += '<form id = "reply-update-form" action="../replyUpdate/' + replyId + '" method="post">';
    div += '<input name="commuId" value="' + commuId + '" type="hidden">';
    div += '<textarea rows="5" cols="50" name="content" value="' + content + '"></textarea>';
    div += '<button type="button" id="reply-update-submit">수정하기</button></form></div>';

    reply.after(div);
};

document.querySelector("#reply-update-submit").addEventListener("click", e => {
    $.ajax({
        url : "../add",
        dataType : "json",
        type : "post",
        data : $("#reply-update-form").serialize(),
        success : function(data){
        }
    });

    reply.remove();
});