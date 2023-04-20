<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 변경</title>

<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<div>
			<h3>글 등록</h3>
		</div>
		<div>
			<form method="post" class="row g-4">
				<div class="col-md-3">
					<label for="id" class="form-label">제품번호</label>
					<input id="id"  class="form-control" name="id" type="number" value="${item.id}" readonly>
				</div>
				
				<div class="col-md-9">
					<label for="title" class="form-label">제목</label>
					<input id="title"  class="form-control" name="title" type="text" value="${item.title}">
				</div>
				
				<div class="col-md-4">
					<label for="category" class="form-label">카테고리</label>
					<select id="category" class="form-select" name="category">
						<option value="1" ${item.category==1?"selected":""}>공동구매</option>
						<option value="2" ${item.category==2?"selected":""}>운동</option>
						<option value="3" ${item.category==3?"selected":""}>식사</option>
						<option value="4" ${item.category==4?"selected":""}>게임</option>
						<option value="5" ${item.category==5?"selected":""}>기타</option>
					</select>
				</div>
				
				<div class="col-md-4">
					<label for="member" class="form-label">모집인원</label>
					<input id="member"  class="form-control" name="member" type="number" value="${item.member}">
				</div>
				
				<div class="col-md-4">
					<label for="dDay" class="form-label">모집일</label>
					<input id="dDay"  class="form-control" name="dDay" type="date" value="${item.dDay}">
				</div>
				
				<div class="col-md-12">
					<label for="postnum" class="form-label">주소</label>			
					<input id="postnum"  class="form-control" name="postnum" type="text" value="${item.postnum}" placeholder="우편번호">
					<input type="button" class="btn btn-primary btn-icon-split btn-sm" onclick="DaumPostcode()" value="우편번호찾기">
					<input id="road_addr" class="form-control" name="address" type="text" value="${item.address}" placeholder="주소">
					<input id="detAddr" class="form-control" name="detAddress" type="text" value="${item.detAddress}" placeholder="상세주소">
				</div>
				
				<div class="col-md-12">
					<label class="form-label">내용</label>
					<textarea id="summernote" class="form-control" name="content">${item.content}</textarea>
				</div>
				
				<div>
					<button class="btn btn-primary btn-sm">등록</button>
					<a href="list"><button type="button" class="btn btn-light btn-sm">취소</button></a>
				</div>
			</form>
		</div>
	</div>
</body>
<jsp:include page="../header.jsp"></jsp:include>
</html>