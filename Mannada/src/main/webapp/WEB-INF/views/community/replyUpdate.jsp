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
<link rel="stylesheet" href="/resources/css/community_detail.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!--jQuery 최신버전-->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

function EtValue() {
      const form = document.write_post;
      if (form.content.value.trim() == '') {
         swal('', '수정할 내용을 입력해주세요.', 'error')
         form.content.focus();
         return;
      }
      form.submit();
   }
</script>
</head>
<body>
   <div class="banner">
      <div class="banner_text">
         <li>커뮤니티</li>
         <i class="bi bi-caret-right-fill"></i>
         <li>댓글 수정</li>
      </div>
      <h3 class="page_title">커뮤니티</h3>
      <p class="page_text">만남에 대한 후기와 소통을 자유옵게 글로 적어주세요!</p>
   </div>

   <section class="container_box">
      <div class="box">
			<div class="category_title_box">
				<div class="category_color category_color_${item.category}">

					<div class="category_title">
						<h1 class="comm_category">
							<span class="category_info">${item.category_}</span>
							<div class="title_info">${item.title}</div>
						</h1>

					</div>
				</div>
			</div>

			<div class="Writer_date_views">
				<div class="Writer_date">
					<div class="Writer">
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
						<span class="writer_info">작성자</span>
						<a href="/user/view/${item.num}" style="color: black;" class="b">${item.nickname}</a>
						<p class="arrow_box">회원정보</p>
					</div>
				</div>
				<div class="date_views">
					<fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd " />
					| 조회수 ${item.viewCnt}
				</div>

			</div>

			<div>
				<div class="text_box">${item.content }</div>
			</div>
		</div>
   
   
   <div class="container_box">
      <form method="post" name="write_post" class="replyupdate_box">
         <div style="border-top: 2px solid blue;">
            <input type="hidden" name="replyId" value="${reply.id }">
            <div class="text_box_info">
               <textarea class="reply_update" style="resize: none;" name="content"
                  placeholder="수정할 내용을 입력해주세요.">${reply.content}</textarea>
            </div>
            <div class="reply_btn_lsit">
               <button class="replyupdate_btn" type="button" onclick="EtValue()">수정</button>
               <a href="javascript:history.back();"><button class="back_btn" type="button">취소</button></a>
            </div>
         </div>
      </form>
   </div>
   
   </section>
   <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>