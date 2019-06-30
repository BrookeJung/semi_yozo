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
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>


<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="dist/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
   $(document).ready(function() {
      $('#summernote').summernote({
         height : 400

      });
   });
</script>


<script type="text/javascript">
   jQuery(document).ready(function() {
      if (jQuery('#lock').prop('checked')) {
         jQuery('#lock').val('');
      }
   });
</script>

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
.que-tbl {
   margin: 50px auto 0px auto;
}

.que-tbl th {
   background-color: #ddc1a9;
   font-size: 1.1em;
   color: #f0f0f0;
   border-width: 2px 0;
}

.que-tbl, .que-tbl th, .que-tbl td {
   border: 1px solid gray;
   border-width: 1px 0;
   border-collapse: collapse;
   text-align: center;
   padding: 8px;
}
footer{
margin-top: 50px;
 
}
input {
   outline-style: none;
}

input[type=checkbox]
{
  /* Double-sized Checkboxes */
  -ms-transform: scale(1.5); /* IE */
  -moz-transform: scale(1.5); /* FF */
  -webkit-transform: scale(1.5); /* Safari and Chrome */
  -o-transform: scale(1.5); /* Opera */
  padding: 4px;
}
#title{
width: 300px;
margin-right: 30px;
border-radius: 4px;
border-style: none;
border: solid 1px ;
border-color: #c2c7ba;
}

</style>
<%@ include file="./headerforque.jsp"%> 
</head>
<body>

   <script type="text/javascript">
      if ($('input[name=lock]').is(":checked")) {
         $('input[name=lock]').val('Y');
      } else {
         $('input[name=unlock]').val('N');
      }

   </script>

   <form id="frm" action="fileuploadController.do" method="post" enctype="multipart/form-data">
      <input type="hidden" name="command" value="queWriteForm"> <input
         type="hidden" name="writer" value="${ldto.id}"> <input
         type="hidden" name="password" value="${ldto.pw}">
      <table class="que-tbl">
         <tr>
            <td>제   목</td>
            <td><input type="text" id="title" name="title"
               style="width: 650px" /><span style="float: right;"><input type="checkbox" name="lock">&nbsp;비공개 등록</span> <input type="hidden" name="unlock"></td>
         </tr>
         <tr>
            <td>내   용</td>
            <td><textarea rows="10" cols="30" id="summernote" name="content" style="width: 650px; height: 350px;"></textarea></td>
         </tr>
         <tr>
            <td colspan="2"><input type="submit" id="save" value="등록" />         
            <input type="button" value="작성 취소"   onclick="location.href='recipeController.do?command=queboardlist&pagenum=1&contentnum=10&opt=5&condition=0'"/>
            </td>
         </tr>

      </table>

   </form>
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