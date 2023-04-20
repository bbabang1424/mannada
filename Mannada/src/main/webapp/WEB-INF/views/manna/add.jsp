<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>

<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<div>
			<h3>글 등록</h3>
		</div>
		<div>
			<form method="post" class="row g-4">
				<div class="col-md-12">
					<label for="title" class="form-label">제목</label>
					<input id="title"  class="form-control" name="title" type="text">
				</div>
				
				<div class="col-md-4">
					<label for="category" class="form-label">카테고리</label>
					<select id="category" class="form-select" name="category">
						<option value="1">공동구매</option>
						<option value="2">운동</option>
						<option value="3">식사</option>
						<option value="4">게임</option>
						<option value="5">기타</option>
					</select>
				</div>
				
				<div class="col-md-4">
					<label for="member" class="form-label">모집인원</label>
					<input id="member"  class="form-control" name="member" type="number">
				</div>
				
				<div class="col-md-4">
					<label for="dDay" class="form-label">모집일</label>
					<input id="dDay"  class="form-control" name="dDay" type="date">
				</div>
				
				<div class="col-md-12">
					<label for="postnum" class="form-label">주소</label>			
					<input id="postnum"  class="form-control" name="postnum" type="text" placeholder="우편번호">
					<input type="button" class="btn btn-primary btn-icon-split btn-sm" onclick="DaumPostcode()" value="우편번호찾기">
					<input id="road_addr" class="form-control" name="address" type="text" placeholder="주소">
					<input id="detAddr" class="form-control" name="detAddress" type="text" placeholder="상세주소">
				</div>
				
				<div class="col-md-12">
					<label class="form-label">내용</label>
					<textarea id="summernote" class="form-control" name="content"></textarea>
				</div>
				
				<div>
					<button class="btn btn-primary btn-sm">등록</button>
					<a href="list"><button type="button" class="btn btn-light btn-sm">취소</button></a>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function DaumPostcode() {
    	new daum.Postcode({
			oncomplete:function(data){
				//alert("data" + JSON.stringify(data));
				$('[name=postnum]').val(data.zonecode);
				$('[name=address]').val(data.address);
				$('[name=detAddress]').val(data.buildingName);
			}
		}).open();
    }
</script>
</html>