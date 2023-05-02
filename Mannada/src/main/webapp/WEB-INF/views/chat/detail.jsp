<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp"></jsp:include>
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/chat.css" rel="stylesheet">

    <script type="text/javascript">
    	document.getElementById('sendMessage').addEventListener('click', () => {
	    	fetch("../add", {
	            method: "POST",
	            headers: { 'Content-Type': 'application/json' },
	            body: JSON.stringify(item)
	        }).then(resp => {
	            if (resp.status == 200)
	                return resp.json();
	        }).then(result => {
	            console.log(result);
	
	            const message = document.querySelector("#message");
	            const div = makeItem(result);
	
	            console.log(message);
	            console.log(div);
	
	            message.after(div);
	        });
    	});
    	
    	function makeItem(element){
    		const div = document.createElement("div");
    		div.classList.add("list");
    		
    		const head = document.createElement("p");
    		head.textContent = ${item.nickname} + " | " + ${item.regDate};
    		div.append(head);
    		
    		const content = document.createElement("p");
    		content.textContent = ${item.content};
    		div.append(content);
    		
    		return div;
    	};
    </script>
    
</head>
<body>
	<div>
		<h2>${item.title }</h2>
	</div>
	
    <div class="container">
        <div id="room">
	        <c:forEach var="item" items="${roomList }">
	            <a href="../detail/${item.id}">
	                <div class="list">
	                    <p>${item.dDay }</p>
	                    <p>${item.title }</p>
	                </div>
	            </a>
	        </c:forEach>
        </div>


        <div id="chat">
            <div class="message" id="message">
	            <c:forEach var="item" items="${chatList }">
	                <div class="list">
	                	<p>${item.nickname } | ${item.regDate }</p>
	                	<p>${item.content }</p>
	                </div>
	            </c:forEach>
            </div>

            <div class="send">
                <form action="../add" method="post">
                    <input type="number" name="mannaId" value="${item.id}" class="hidden">
                    <input type="text" name="content">
                    <button type="button" id="sendMessage">전송</button>
                </form>
            </div>
        </div>
    </div>
    
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>