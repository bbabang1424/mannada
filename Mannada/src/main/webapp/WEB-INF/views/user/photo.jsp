<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<title>만나다</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div class="container"> 
		<div>
			<h3>프로필 등록</h3> 
		</div> 
		<div>
			<form name="photoInfo_from" method="post" style="width:700px" enctype="multipart/form-data">
	            <div>
	            	<img id="preview" style="border:1px solid black; width:500px; height:500px">
	            	<div>	            		
		            	<input type="file" name="uploadFile" accept=".jpg, .jpeg, .png">
		            	<button type="submit">등록</button>
		            	<button type="button" id="goBack">목록</button>
	            	</div>
	             </div>
	             <p></p>
			</form>
		</div>
	</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
<script>
$(function() {
	$('#goBack').click(function(){
		window.history.back();
	});
	
	//input의 name="uploadFile" 결과값을 저장할 변수
	let fileTag = document.querySelector("input[name=uploadFile]");
	//파일 태그 변화 함수
	fileTag.onchange = function(){
		//파일 미리보기 변수
		let imgTag = document.querySelector("#preview");
		
		//파일 여부 확인
		if(fileTag.files.length>0){
			//파일 선택 시 미리보기 생성
			let reader = new FileReader();
			
			reader.onload = function(data){
				console.log(data);
				imgTag.src = data.target.result;
			}
			
			reader.readAsDataURL(fileTag.files[0]);
		}	
	}
});
</script>
</html>