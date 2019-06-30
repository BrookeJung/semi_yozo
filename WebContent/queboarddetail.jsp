<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
   rel="stylesheet">
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
   src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>



<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<script src="dist/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $('#summernote').summernote({
         height : 300
      });
   });
</script>
<title>Insert title here</title>
<style type="text/css">
footer{
background-color: #db5e49;
text-align: center;
padding-top: 30px;
padding-bottom: 30px;
margin-top: 50px;
}
.copy,.copy a{
margin-top: 10px;
color: #fd8479;
}
#Updateform {
   display: none;
}

.que-tbl {
   margin: 100px auto 0px auto;
}

.que-tbl2 {
   margin: 0px auto 0px auto;
   width: 180px;
}

.que-tbl, .que-tbl th, .que-tbl td {
   border-collapse: collapse;
   text-align: left;
   padding: 8px;
}

.que-tbl th {
   background-color: #c2c7ba;
   font-weight:350;
   color: #f0f0f0;
   width: 150px;
   text-align: center;
   border: none;
   opacity: 0.9 ;
}

.que-tbl2 th {
   background-color: #db5e49;
   font-size: 1.1em;
   color: #f0f0f0;
   width: 150px;
   height: 30px;
   padding-right: 10px;
   opacity: 0.9 ;
}
body{
position: relative;
}


input {
   color: #433f3a;font-weight:lighter;border-radius: 4px;padding:2;border-style: none;height: 23px;
}

textarea {
   border-color: #db5e49;
   resize: none;
   border-bottom-left-radius: 5px;
   border-bottom-right-radius: 5px;
   border-width: 1.6px;
   outline-style: none;
}

</style>
<%@ include file="./headerforque.jsp"%>
</head>

<body>
   <div id="Detailform">
      <table class="que-tbl">
         <col width="20px">
         <col width="600px">
         <tr>
            <th>글 번호</th>
            <td>${dto.boardno }</td>
         </tr>
         <tr>
            <th>작성자</th>
            <td>${dto.writer }</td>
         </tr>
         <tr>
            <th>작성일</th>
            <td>${dto.regdate }</td>
         </tr>
         <tr>
            <th>제 목</th>
            <td>${dto.title }</td>
         </tr>
         <tr height="300px">
            <th>내 용</th>
            <td>${dto.content }</td>
         </tr>
         <tr>
            <td colspan="2"><c:if test="${ldto.id == dto.writer ||ldto.role=='ADMIN'}">
                  <input type="button" value="글수정" onclick="showUp()">
                  <input type="button" value="글삭제"
                     onclick="location.href='recipeController.do?command=queDelete&groupno=${dto.groupno}'">
               </c:if> <input type="button" value="목록으로"
               onclick="location.href='recipeController.do?command=queboardlist&pagenum=1&contentnum=10&opt=5&condition=0'">
            </td>
         </tr>
      </table>
      <div class="reply"></div>
   </div>

   <div id="Updateform">
      <form action="recipeController.do" method="post">
         <input type="hidden" name="command" value="queUpdateForm"> <input
            type="hidden" name="boardno" value="${dto.boardno }"> <input
            type="hidden" name="groupno" value="${dto.groupno}">

         <table class="que-tbl">
            <col width="20px">
            <col width="700px">
            <tr>
               <th>글 번호</th>
               <td>${dto.boardno }</td>
            </tr>
            <tr>
               <th>작성자</th>
               <td>${dto.writer }</td>
            </tr>
            <tr>
               <th>작성일</th>
               <td>${dto.regdate }</td>
            </tr>
            <tr>
               <th>제 목</th>
               <td><input type="text" name="title" value="${dto.title }">
               </td>
            </tr>
            <tr>
               <th>내 용</th>
               <td><textarea name="content" id="summernote" rows="10"
                     cols="100">${dto.content }</textarea></td>
            </tr>
            <tr>
               <td colspan="2"><input type="submit" id="savebutton"
                  value="수정확인"> <input type="button" value="수정취소"
                  onclick="showBack()"> <input type="button" value="목록으로"
                  onclick="location.href='recipeController.do?command=queboardlist&pagenum=1&contentnum=10&opt=5&condition=0'">
               </td>
            </tr>
         </table>
      </form>
   </div>
   <hr>
   <form action="recipeController.do" method="post">
      <input type="hidden" name="command" value="queReplyForm"> <input
         type="hidden" name="parentno" value="${dto.boardno }"> <input
         type="hidden" name="groupnoReply" value="${dto.groupno}">


      <c:if test="${ldto.id==dto.writer|| ldto.role=='ADMIN' }">
         <table class="que-tbl2">
            <tr>
               <th colspan="2"">&nbsp;&nbsp;답변달 글 : ${dto.boardno } 작성자 : <input
                  type="text" style="width: 100px" name="writerReply" value="${ldto.id }"
                  readonly="readonly"> 제 목 : <input type="text" style="width: 150px"
                  name="titleReply" value=" re."><input type="submit" value="답변등록" style="float: right;"></th>
            </tr>
            <tr>
               <td><textarea rows="10" cols="100" name="contentReply" placeholder="답변을 작성해 주세요" ></textarea></td>
            </tr>
      
         </table>
      </c:if>
   </form>
   <hr>
   <table class="que-tbl2">
      <c:choose>
         <c:when test="${empty listReply }">
            <tr>
               <td colspan="4"><i class="far fa-sticky-note"></i>답변을 기다려주세요</td>
            </tr>
         </c:when>
         <c:otherwise>
            <c:forEach items="${listReply }" var="dtoReply">
               <tr>
                  <th>댓글제목:${dtoReply.title } 작성자: ${dtoReply.writer }</th>
               </tr>
               <tr>
                  <th align="right">${dtoReply.regdate } <c:if
                        test="${ldto.id == dtoReply.writer || ldto.role=='ADMIN' }">
                        <input type="button" value="삭제"
                           onclick="location.href='recipeController.do?command=queDeleteReply&groupno=${dto.groupno }&boardno=${dtoReply.boardno}&pboardno=${dto.boardno}'">
                     </c:if>
                  </th>
               </tr>

               <tr>
                  <td><textarea rows="5" cols="100">${dtoReply.content }</textarea></td>
               </tr>

            </c:forEach>
         </c:otherwise>
      </c:choose>
   </table>
   <script type="text/javascript">
      $(document).ready(function() {
         $('#summernote').summernote();
      });

      function showUp() {
         $("#Detailform").hide();
         $("#Updateform").show();

      }

      function showBack() {
         $("#Updateform").hide();
         $("#Detailform").show();
      }
   </script>
   <footer style="background-color: #ffe3d5;">
         <div class="grid_6 prefix_3">
            <a id="logo" href="#" class="f_logo" style="width: 100%;height: 100%;"><img
               src="image/LOGO.png" alt="" width="300px" height="80px"></a>
            <div class="copy">
               &copy; 2019 | <a href="#">YOLIJOLI_Recipe</a> <br> Website by
               <a href="https://www.iei.or.kr/main/main.kh" rel="nofollow">KH_yolijoli</a>
            </div>
         </div>
   </footer>

</body>
</html>
