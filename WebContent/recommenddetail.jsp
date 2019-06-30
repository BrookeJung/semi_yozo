<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html;charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요리 상세보기</title>
<style type="text/css">
.pic {
   opacity: 0.5;
   opacity: 0.5;
   filter: alpha(opacity = 50);
}

.pic:hover {
   opacity: 1.0;
   filter: alpha(opacity = 100);
}

li {
   color: black;
   font-size:20pt;
}

ul li {
   position: relative;
}

ul ul {
   position: absolute;
   top: 1em;
   left: 0;
   display: none;

}

ul>li:hover ul {
   display: block;
   width: 250px;
   border: 1 solid black;
   color: black;
   background-color: white;
   font-size: 13pt;
   font-family: '야놀자 야체','YanoljaYacheR' ;
}

.p1 {
   background-color:white;
   color: #db5e49;
   font-family: '야놀자 야체','YanoljaYacheR' ;
   font-size: 20pt;
}

.p2 {
   color: #db5e49;
   font-family: '야놀자 야체','YanoljaYacheR' ;
   font-size: 16pt;
}

.p3 {
   font-family: '야놀자 야체','YanoljaYacheR' ;
   font-size: 15pt;
}
.ll{
   font-size: 15pt;
   
}

.btn_1{
    background-color: #db5e49;
  border: none;
  color: #ffe3d5;
  padding: 1%;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
.btn_1:hover{
   background-color: #F5C6BA;
}
#rname{
   font-size: 20pt;
   text-align: center;
}
input[type=button], input[type=submit], input[type=reset] {
	background-color: #db5e49;
	border: none;
	color: #ffe3d5;
	padding: 1%;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
	font-family: '야놀자 야체', 'YanoljaYacheR';
}
</style>

<%@ include file="./header.jsp"%>
</head>
<body style="font-family: '야놀자 야체','YanoljaYacheR' ;">
<div id="rname" style="background-color: white; width: 100%; height: 100%; padding: 3%;"><b>${infolist.recipe_nm_ko }</b></div>
<div style="background: white; width: 100%; text-align: left; padding: 2%; height: 100%;">
   <form action="paycontroller.do" method="post">
      <input type="hidden" name="command" value="order">
      <input type="hidden" name="recipe_id" value=${recipe_id }>
      

         <div class="basicRecipe" style="margin-left: 10%">
            <div style="width: 100%;">
            <c:choose>
                  <c:when test="${infolist.recipe_id gt 195453 }">
               <div style="float:left; width: 50%; margin-bottom: 3%;">${infolist.img_url}</div>
                </c:when>
                <c:otherwise>
                  <img src="${infolist.img_url }" alt="" width="20%" height="2%">
                  </c:otherwise>   
                  </c:choose>
               <div style="float:right; width: 50%; margin-bottom: 3%;">
               <ul >
                  <li style="font-size: 20pt; color: black; margin-bottom: 20px; line-height: normal;">
                     <p class="p1">요리재료보기</p><br/>
                     <ul style="line-height: normal; margin-top: 4%;" >
                        <li style="line-height: normal;">${infolist.qnt }</li>
                           <c:forEach items="${materiallist }" var="materiallist">
                           <input type="hidden" name="ordermaterial" value="${materiallist.irdnt_nm }">
                           <li style="display: inline; float: left; line-height: normal;">${materiallist.irdnt_ty_nm }:</li>
                           <li style="line-height: normal;">&nbsp; ${materiallist.irdnt_nm }</li>
                           </c:forEach>
                        </ul>
                     </li>
                  </ul>
               </div>
            </div>
               
               <div style="width:100%; float: left;"><p>
               <h4 class="p1">기본정보</h4><p>
               <ul class="cookInfo">
                  <li  style="font-size: 13pt;"><b class="p2" >시간 : </b>${infolist.cooking_time }</li>
               </ul>
               </div>
               <div style="width: 500px; clear: both; float: ">
               <h4 class="p2">요리과정</h4><br/><br/>
               <ul class="cookProcess" style="   font-size: 15pt;">



                  <c:forEach items="${processlist }" var="dto" varStatus="status">
                     <li><span class="num">${dto.cooking_no }</span>${dto.cooking_dc }

                        <div class="imgArea">
                           <img src="${dto.stre_step_image_url }" alt="" title="">
                        </div></li>
                  </c:forEach>


               </ul>
               </div>
               <br/><br/>
               <input class="btn_1" type="submit" value="주문하러가기">
         </div>
         
   
      
   </form>
      </div>
   <%@ include file="./footer.jsp"%>
</body>
</html>