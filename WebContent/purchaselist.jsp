<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html lang="en">
<head>
<title>구매 목록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script>
        $(document).ready(function(){
          $( ".block1" ).mouseover(function() {
            $(this).addClass( "blur" );
          });
          $( ".block1" ).mouseout(function() {
            $(this).removeClass( "blur" );
          });
          $().UItoTop({ easingType: 'easeOutQuart' });
        }) 
     </script>
     <script type="text/javascript">
     function allChk(bool) {
 		$("input[name=chk]").each(function() {
 			$(this).prop("checked", bool);
 		});
 	}
 	function allcancel() {

 		if ($("input[name=chk]").length == $("input[name=chk]:checked").length) { //기존 chk와 체크된 chk의 길이가 같은 경우
 			// 전부 다 체크되어 있을 경우

 			$("input[name=all]").prop("checked", true);
 		} else {

 			$("input[name=all]").prop("checked", false);
 		}
 	}
      function send() {
         var count = 0;

         if(document.myform.cb.checked==true){
            count++;
            return true;
         }else{
            for (i = 0; i < document.myform.cb.length; i++) {
               if (document.myform.cb[i].checked == true) {
                  count++;
               }
            }
         }
         if (count === 0) {
            alert("하나이상선택하세요");
            return false;   
         }
      }
   </script>
<style type="text/css">
.btn_1 {
   background-color: #ffe3d5;
   border: none;
   color: black;
   padding: 1%;
   text-decoration: none;
   margin: 4px 2px;
   cursor: pointer;
   border-radius: 20%;
}
input[type=button], input[type=submit], input[type=reset] {
  background-color: #db5e49;
  border: none;
  color: #ffe3d5;
  padding: 1%;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
  font-family: '야놀자 야체','YanoljaYacheR' ;
}

td{
   text-align: center;
}
</style>
<%@ include file="./header.jsp"%>
</head>
<div style="background-color: white; width: 100%; height: 100%; padding: 3%;"></div>
<body class="page1">
   <div style="background: white; width: 100% ;height: 100%; margin: auto; padding-bottom: 2%">
<h1 style="color: #db5e49; font-family: '야놀자 야체','YanoljaYacheR'; font-size: 30pt; text-align: center;">내 구매 목록</h1>
   <form name="form" action="paycontroller.do" >
      <input type="hidden" name="unlock"> <input type="hidden" name="command" value="paymuldel">
      <input type="hidden" name="id" value="${ldto.id }">

      <table class="tbl" style="margin: auto;">
         <col width="100">
         <col width="100">
         <col width="100">
         <col width="100">
         <col width="100">
         <tr>
            <th style="background-color: #ffe3d5;"><input type="checkbox" name="all" onclick="allChk(this.checked)"
							id=""></th>
            <th style="background-color: #ffe3d5;">번호</th>
            <th style="background-color: #ffe3d5;">구매일</th>
            <th style="background-color: #ffe3d5;">구매가격</th>
            <th style="background-color: #ffe3d5;">구매장소</th>
            <th style="background-color: #ffe3d5;">삭제</th>
         </tr>
         <c:choose>
            <c:when test="${empty list }">
               <tr>
                  <td colspan="5" style="text-align: center;">-----담긴 리스트가 없습니다.-----</td>
               </tr>
            </c:when>
            <c:otherwise>
               <c:forEach items="${list }" var="dto">
                  <tr>
                     <td><input type='checkbox' name='chk' onclick='allcancel();'value="${dto.payseq }" style="text-align: center;"/></td>
                     <td>${dto.payseq }</td>
                     <td>${dto.paydate }</td>
                     <td>${dto.price }</td>
                     <td>${dto.place}</td>
                     <td><input type="button" value="삭제"
                        onclick="location.href='paycontroller.do?command=payDelete&seq=${dto.payseq}&id=${ldto.id }'"></td>

                  </tr>
               </c:forEach>
            </c:otherwise>
         </c:choose>
         <tr>
            <td colspan="3">
             <input type="submit"id="btnsubmit" value="리스트에서 삭제" onclick="return send()">
             </td>
         </tr>
      </table>
   </form>


</div>






   <script>
      $(document).ready(function(){ 
         $(".bt-menu-trigger").toggle( 
          function(){
            $('.bt-menu').addClass('bt-menu-open'); 
          }, 
          function(){
            $('.bt-menu').removeClass('bt-menu-open'); 
          } 
        ); 
      }) 
    </script>
   <%@ include file="./footer.jsp"%>
</body>
</html>