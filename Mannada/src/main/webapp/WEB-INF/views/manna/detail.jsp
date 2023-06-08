<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만나다</title>
<jsp:include page="../header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/manna_detail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

</head>
<body>
	<!--참여버튼 a-jax:이현주  -->
	<!-- 각 페이지 안내 베너:김소연  -->
	<div class="banner">
		<ul class="banner_text">
			<li>만나다</li> <i class="bi bi-caret-right-fill"></i>
			<li>글 목록</li>
		
		<h3 class="page_title">글 목록</h3>
		<p class="page_text">새로운 만남을 만날수 있는 곳 입니다. 관심있는 카드를 눌러 참여하세요!</p>
	</ul>
	</div>
	
	<section class="container">
		<div class="box">
			<div class="first" style="position: relative;">



				<div class="Category_address">
					[${item.category_}] <i class="bi bi-geo-alt"></i>${item.address}
				</div>

				<div class="title">
					<div class="font-size">${item.title}</div>
				</div>
				<!-- 사진 변경 -->
				<c:if test="${item.filename != null}">
				<div class="img_box">
					<img class="img" src="/upload/${item.uuid}_${item.filename}">
				</div>
				</c:if>
				<c:if test="${item.filename == null}">
					<div class="img_box">
						<img class="img" src="/resources/image/profile.png">
					</div>
				</c:if>
				<div class="writer_date">
					<div class="Writer">
						<span style="font-weight: 500;">작성자:</span><a
							href="/user/view/${item.num}" style="color: black;" class="b">
							${item.nickname}</a>
							<p class="arrow_box">회원정보</p> <i class="bi bi-star"></i> ${item.starAvg}(${item.starCnt})
					</div> 
					<div class="date">
						<i class="bi bi-calendar-check"></i> ${item.dDay}
					</div>
				</div>
				<!-- personnel:인원이란 뜻 -->
				<div class="model_personnel">
					<!-- 참여인원/모집인원 : 참여버튼을 눌른 이용자의 인원이 나와야함-->
					<span style="margin-right: 5px;">참여현황:</span>${item.sum }/${item.member}
				</div>
				<progress id="model_progress" value="${item.sum }"
					max="${item.member}"> </progress>

				<div class="views">
					<span style="margin-right: 5px;"><i class="bi bi-eye"></i></span> ${item.viewCnt }
				</div>
				<div class="model_line"></div>
			</div>
			<div class="model_middle">


				

				<div class="model_member_num_box_info">
					<div id="box_info">
					<div class="model_member">참여인원</div>
						<div style="border: 1px solid #ddd;" class="member_num"
							id="model_member_num">
							<!-- 참여버튼을 누른 사람의 아이디를 가져와야함-->
							<c:forEach var="member" items="${list}">
								<div class="${member.num } item">${member.nickname }</div>
							</c:forEach>
						</div>
					</div>
					<!-- Partic: 참여란 뜻으로 참여버튼 -->
					<!-- 참여버튼 눌렀을때 인원 표시되게 해야 함-->
					<div class="model_Partic">
						<c:if test="${item.status < 0 }">
							<button type="button" style="background-color: #999">참여 불가</button>
						</c:if>
						<c:if test="${item.status >= 0 && status == 0 && sessionScope.user.num != item.num && sessionScope.user != null }">
							<a href="../addJoin/${item.id }"><button type="button"
									id="join_btn">참여</button></a>
						</c:if>
						<c:if test="${item.status >= 0 && status == 1 && sessionScope.user.num != item.num && sessionScope.user != null }">
							<a href="../deleteJoin/${item.id }"><button type="button"
									id="join_btn" class="cancle">참여 취소</button></a>
						</c:if>
					</div>
				</div>

				<div class="model_text_box">${item.content}</div>
			</div>
			<!-- lower:하단이란 뜻 -->
			<div class="model_lower">
				<!-- modify:수정하다란 뜻 -->
				<!-- 수정이랑 목록 이동 모르겠음... -->
				<c:if test="${sessionScope.user.num == item.num }">
					<a href="../update/${id}"><button class="button_modify">수정</button></a>
					<a href="../delete/${id}"><button class="button_delete">삭제</button></a>
				</c:if>

				<c:if test="${status == 1 }">
					<!-- 채팅 버튼 일부러 뺴놈 이모지 넣음으로써 버튼 높 낮이 변함-->
					<a href="../../chat/detail/${item.id}"><button
							class="button_chatting">
							<i class="bi bi-chat-fill"></i>
						</button></a>
				</c:if>
			</div>


		</div>
		<div class="back">
			<a href="../list"><button class="button_back">목록</button></a>
		</div>
	</section>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>

<script type="text/javascript">
const mannaId = '${ item.id }';

// 참여 버튼
/* document.querySelector("#join_btn").addEventListener("click", e => {

    fetch("/addJoin/" + mannaId, {
        method: "POST",
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify()
    }).then(resp => {
        if (resp.status == 200)
            return resp.json();
    }).then(result => {
        document.querySelector("#join_btn").textContent = "참여 취소";
        document.querySelector("#join_btn").classList.add('cancle');
        
        document.querySelector(".model_personnel").textContent = '참여현황: ${sum}/${item.member}'
        document.querySelector("#model_progress").value = '${sum}'
        
        makeMember(memberList);
    });

});


// 참여 취소 버튼
document.querySelector("#join_btn.cancle").addEventListener("click", e => {

    fetch("/deleteJoin/" + mannaId, {
        method: "DELETE",
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify()
    }).then(resp => {
        if (resp.status == 200)
            return resp.json();
    }).then(result => {
        document.querySelector("#join_btn").textContent = "참여";
        document.querySelector("#join_btn").classList.remove('cancle');

        document.querySelector(".model_personnel").textContent = '참여현황: ${sum}/${item.member}'
        document.querySelector("#model_progress").value = '${sum}'
        
        makeMember(memberList);
    });

});

function makeMember(list){
	const body = document.querySelector("model_member_num")
	
	body.querySelectorAll(".item").forEach(element => {
        element.remove();
    });
	 */
	
	
}
</script>
</html>