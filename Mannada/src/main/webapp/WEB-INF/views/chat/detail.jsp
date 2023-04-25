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
            <div class="message">
	            <c:forEach var="item" items="${chatList }">
	                <div class="list">
	                	${item.num }
	                    ${item.content }
	                    ${item.regDate }
	                </div>
	            </c:forEach>
            </div>

            <div class="send">
                <form action="../add" method="post">
                    <input type="number" name="mannaId" value="${item.id}" class="hidden" disabled>
                    <input type="text" name="content">
                    <button>전송</button>
                </form>
            </div>
        </div>
    </div>
    
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>