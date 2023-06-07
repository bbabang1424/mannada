<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<title>만나다</title>
<!-- <script src="/resources/js/photo.js"></script> -->
<link rel="stylesheet" href="/resources/css/photo.css">

</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>
	<div class="background-image"></div>


	<div class="container-box">
		<div>
			<h3>프로필 수정</h3>
			<!-- <p>
	            500x500의 크기인 사진을 등록하시는걸 권장합니다.
	            <br> 등록 가능한 파일은 .jpg, .jpeg, .png이고 크기는 최대 10MB입니다.
	            <br> 사진을 선택하지 않고 등록하시면 기본 이미지가 프로필 사진이 됩니다.
	        </p>  -->
		</div>
		<div>
			<form name="photoInfo_from" method="post" style="width: 700px"
				enctype="multipart/form-data">
				<div>
					<div class="profile">
						<img src="/resources/image/profile.png" id="preview">
					</div>


					<div class="pro1">				
						 <div class="upload-btn">						 
							<button><input type="file" name="uploadFile" accept=".jpg, .jpeg, .png"></button>							
						</div>
						
						<div class="pro-btn">
							<div class="pro-btn1">
								<button type="button" id="goBack">취소</button>
							</div>

							<div class="pro-btn2">
								<button class="upload" id="button" type="submit">적용</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
<script>
	$(function() {
		$('#goBack').click(function() {
			window.history.back();
		});

		//input의 name="uploadFile" 결과값을 저장할 변수, 파일 미리보기 변수, 파일 선택 시 미리보기 생성 변수
		let fileTag = document.querySelector("input[name=uploadFile]");
		let imgTag = document.querySelector("#preview");
		let reader = new FileReader();
		/* 파일 태그 변화 함수 */
		fileTag.onchange = function() {
			//파일 여부 확인
			if (fileTag.files.length > 0) {
				reader.onload = function(data) {
					console.log(data);
					imgTag.src = data.target.result;
				}
				reader.readAsDataURL(fileTag.files[0]);
			}
		}
	});
</script>
</html>