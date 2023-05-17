function replyUpdate(replyId, commuId){
  
	const reply = document.querySelector(".reply-content.id" + replyId);
	
	const div = document.createElement("div");
    div.classList.add("reply-update");

    const input = document.createElement("input");
    input.name = "commuId";
    input.value = commuId;
    input.type = "hidden";
    div.append(input);

    const textarea = document.createElement("textarea");
    textarea.rows = "5";
    textarea.cols = "50";
    textarea.name = "content";
    textarea.value = "content";
    div.append(textarea);

    const button = document.createElement("button");
    button.type = "button";
    button.classList.add("reply-update-submit");
    button.id = replyId;
    button.textContent = "수정하기";
    div.append(button);
    
    reply.after(div);
    
    reply.style.display = "hidden";
};


$(document).on('click', '.reply-update-submit', function(e) {

	const Id = $(this).attr("id");
	const Content = $(".reply-update textarea").text();
	
	alert(Content);
	/*
    $.ajax({
        url : "../replyUpdate/" + Id,
        contentType: "application/json",
        dataType : "json",
        type : "put",
        data : JSON.stringify({
        	"id" : Id,
        	"content" : Content
        }),
        success : function(data){
        }
    });
	*/
	const reply = document.querySelector(".reply-update-submit").closest(".reply-update");
    reply.remove();
});

