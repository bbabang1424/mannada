<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<style>
.body {
   min-height: calc(100vh - 240px);
}

.board {
   background-color: white;
}

.board>div {
   width: -webkit-fill-available;
   background-color: unset;
}

th {
   width: auto !important;
}

.modal button {
   margin-top: 20px;
   width: 100px;
   height: 35px;
}
</style>

<script type="text/javascript">
   $(function() {
      $(".my-nav li").click(function() {
         $(".my-nav li").css("text-decoration", "unset");
         $(".my-nav li").eq(0).css("text-decoration", "underline");
         $(".my-set").css("display", "none");
         $("#info").css("display", "unset");
      });

      $(".my-nav li").eq(1).click(function() {
         $(".my-nav li").css("text-decoration", "unset");
         $(".my-nav li").eq(1).css("text-decoration", "underline");
         $(".my-set").css("display", "none");
         $("#my-post").css("display", "unset");
      });

      $(".my-nav li").eq(2).click(function() {
         $(".my-nav li").css("text-decoration", "unset");
         $(".my-nav li").eq(2).css("text-decoration", "underline");
         $(".my-set").css("display", "none");
         $("#my-reply").css("display", "unset");
      });

      $(".my-nav li").eq(3).click(function() {
         $(".my-nav li").css("text-decoration", "unset");
         $(".my-nav li").eq(3).css("text-decoration", "underline");
         $(".my-set").css("display", "none");
         $("#my-bookmark").css("display", "unset");
      });

   });
   
   

   
   function pw_modify() {
      const form = document.pw_modify_form;
   
      if(form.passwd_valid.value == "") {
         alert("비밀번호 확인을 입력 해 주세요");
         form.passwd_valid.focus();
         return;
      }
      
      if(form.pw.value != form.passwd_valid.value) {
         alert("비밀번호가 일치하지 않습니다");
         form.pw.focus();
         return;
      }
      
      form.submit();
   }
</script>

</head>
<body>
<!-- 헤더 -->
   <jsp:include page="header.jsp"></jsp:include>



   <div class="body">

      <div class="content">
         <section class="card">

            <div>
               <div id="card-photo">
                  <c:if test="${member.imageUrl != null }">
                     <img src="${member.imageUrl }">
                  </c:if>

                  <c:if test="${member.imageUrl == null }">
                     <div class="img"></div>
                  </c:if>
               </div>
               <div style="padding-top: 5px;">${user.name}</div>
            </div>


            <div style="font-size: large;">
               <div style="font-size: 1.3em; padding-bottom: 10px;">Lv.${member.level }</div>
               <div>${member.point}point</div>
            </div>


            <div>
               <c:if test="${member.id == sessionScope.member.id }">
                  <div style="padding-bottom: 10px;">
                     <button class="modal_open" id="modify_modal_open">회원 정보
                        수정</button>
                  </div>
                  <div>
                     <button class="modal_open" id="pw_modify_modal_open">비밀번호
                        변경</button>
                  </div>
               </c:if>

               <c:if test="${member.id != sessionScope.member.id }">
                  <div>쪽지보내기</div>
               </c:if>
            </div>

         </section>
      </div>


      <c:if test="${member.id == sessionScope.member.id }">
         <div>
            <nav class="my-nav">
               <ul>
                  <li>회원 정보</li>
                  <li>작성 글</li>
                  <li>작성 댓글</li>
                  <li>북마크</li>
               </ul>
            </nav>
         </div>
      </c:if>


      <div>
         <section class="my-set" id="info">
            <div class="board">
               <div>
                  <div>
                     <h3>information</h3>
                  </div>

                  <div id="my-info">
                     <table>
                        <tr>
                           <th>아이디</th>
                           <td>${member.id }</td>
                        </tr>
                        <tr>
                           <th>닉네임</th>
                           <td>${member.name }</td>
                        </tr>
                        <tr>
                           <th>프로필 사진</th>
                           <td><c:if test="${member.imageUrl != null }">
                                 <img src="${member.imageUrl }">
                              </c:if> <c:if test="${member.imageUrl == null }">
                                 <div class="img"></div>
                              </c:if></td>
                        </tr>
                        <tr>
                           <th>소개</th>
                           <td>${member.introduce }</td>
                        </tr>
                        <tr>
                           <th>포인트</th>
                           <td>${member.point }</td>
                        </tr>
                        <tr>
                           <th>레벨</th>
                           <td>${member.level }</td>
                        </tr>
                        <tr>
                           <th>가입일</th>
                           <td><fmt:formatDate value="${member.regDate}"
                                 pattern="yyyy-MM-dd" /></td>
                        </tr>
                     </table>
                  </div>
               </div>
            </div>
         </section>


         <c:if test="${member.id == sessionScope.member.id }">
            <section class="my-set" id="my-post">
               <div class="board">
                  <div>
                     <div>
                        <h3>작성 글</h3>
                     </div>
                     <table border="1">
                        <tr>
                           <th>No</th>
                           <th>카테고리</th>
                           <th>제목</th>
                           <th>작성일자</th>
                        </tr>
                        <c:forEach var="item" items="${mypost}">
                           <tr>
                              <td>${item.rnum}</td>
                              <td>${item.category}</td>
                              <td><a href="../${item.boardname }/detail/${item.id}">${item.title}</a></td>
                              <td><fmt:formatDate value="${item.regDate}"
                                    pattern="yyyy-MM-dd" /></td>
                           </tr>
                        </c:forEach>
                     </table>
                  </div>


               </div>
            </section>


            <section class="my-set" id="my-reply">

               <div class="board">
                  <div>
                     <div>
                        <h3>작성 댓글</h3>
                     </div>
                     <table border="1">
                        <tr>
                           <th>No</th>
                           <th>카테고리</th>
                           <th>내용</th>
                           <th>작성일자</th>
                        </tr>
                        <c:forEach var="item" items="${commuReply}">
                           <tr>
                              <td>${item.rnum}</td>
                              <td>${item.category}</td>
                              <td><a
                                 href="../${item.boardname }/detail/${item.boardId}">${item.content}</a></td>
                              <td><fmt:formatDate value="${item.regDate}"
                                    pattern="yyyy-MM-dd hh:mm" /></td>
                           </tr>
                        </c:forEach>
                     </table>
                  </div>

               </div>
            </section>


            <section class="my-set" id="my-bookmark">

               <div class="board">
                  <div>
                     <div>
                        <h3>북마크</h3>
                     </div>
                     <table border="1">
                        <tr>
                           <th>No</th>
                           <th>카테고리</th>
                           <th>제목</th>
                           <th>작성일자</th>
                        </tr>
                        <c:forEach var="item" items="${commuBmark}">
                           <tr>
                              <td>${item.rnum}</td>
                              <td>${item.category}</td>
                              <td><a
                                 href="../${item.boardname }/detail/${item.boardId}">${item.title}</a></td>
                              <td><fmt:formatDate value="${item.regDate}"
                                    pattern="yyyy-MM-dd hh:mm" /></td>
                           </tr>
                        </c:forEach>
                     </table>
                  </div>

               </div>
            </section>
         </c:if>

      </div>
   </div>


   <!-- 푸터 -->
   <jsp:include page="footer.jsp"></jsp:include>



   <!-- 회원정보 수정 모달 -->
   <div class="modal" id="modify_modal">
      <div class="modal_body">
         <div>
            <h3>회원정보 수정</h3>
         </div>
         <div>
            <form name="modify_form" method="post" action="../modify/${member.id}">

               <div>
                  <div>
                     <label>닉네임</label> <input type="text" name="name"
                        value="${member.name }">
                  </div>

                  <div>
                     <label>프로필 사진</label> <input type="file" name="imageUrl"
                        id="input-image" value="${member.imageUrl }"> <img id="preview-image" src="${member.imageUrl }">
                  </div>

                  <div>
                     <label>소개</label>
                     <textarea rows="" cols="" name="introduce"
                        style="border: 1px solid;">${member.introduce }</textarea>
                  </div>

               </div>

               <div>
                  <button>변경</button>
               </div>
            </form>
         </div>
      </div>
   </div>


   <!-- 비밀번호 변경 모달 -->
   <div class="modal" id="pw_modify_modal">
      <div class="modal_body">
         <div>
            <h3>비밀번호 변경</h3>
         </div>
         <div>
            <form name="pw_modify_form" method="post" action="../pwModify/${member.id}">

               <div>
                  <label>비밀번호</label> <input type="password" name="pw">
               </div>

               <div>
                  <label>비밀번호 확인</label> <input type="password" name="passwd_valid">
               </div>

               <div>
                  <button type="button" onclick="pw_modify()">변경</button>
               </div>
            </form>
         </div>
      </div>
   </div>


   <script type="text/javascript">
      
   if(${sessionScope.member.id == member.id}){
      
      const modifyModal = document.querySelector('#modify_modal');
      const modifyModalOpen = document.querySelector('#modify_modal_open');
      
      const pw_modifyModal = document.querySelector('#pw_modify_modal');
      const pw_modifyModalOpen = document.querySelector('#pw_modify_modal_open');
      
      
      modifyModalOpen.addEventListener('click', () => {
         modifyModal.classList.toggle('show');
         
         if (modifyModal.classList.contains('show')) {
            body.style.overflow = 'hidden';
         }
      });
      
      modifyModal.addEventListener('click', (event) => {
         if (event.target === modifyModal) {
            modifyModal.classList.toggle('show');
            
            if (!modifyModal.classList.contains('show')) {
               body.style.overflow = 'auto';
            }
         }
      });
      
      
      pw_modifyModalOpen.addEventListener('click', () => {
         pw_modifyModal.classList.toggle('show');
         
         if (pw_modifyModal.classList.contains('show')) {
            body.style.overflow = 'hidden';
         }
      });
      
      pw_modifyModal.addEventListener('click', (event) => {
         if (event.target === pw_modifyModal) {
            pw_modifyModal.classList.toggle('show');
            
            if (!pw_modifyModal.classList.contains('show')) {
               body.style.overflow = 'auto';
            }
         }
      });
      
      
      
      
      /* 정보수정 프로필사진 이미지 띄우기 */
      function readImage(input) {
          // 인풋 태그에 파일이 있는 경우
          if(input.files && input.files[0]) {
   
              // 이미지 파일인지 검사 (생략)
   
              // FileReader 인스턴스 생성
              const reader = new FileReader()
   
              // 이미지가 로드가 된 경우
              reader.onload = e => {
                  const previewImage = document.getElementById("preview-image")
                  previewImage.src = e.target.result
              }
   
              // reader가 이미지 읽도록 하기
              reader.readAsDataURL(input.files[0])
          }
      };
   
      // input file에 change 이벤트 부여
      const inputImage = document.getElementById("input-image")
      inputImage.addEventListener("change", e => {
          readImage(e.target)
      });
         
      
   }
   </script>

</body>
</html>