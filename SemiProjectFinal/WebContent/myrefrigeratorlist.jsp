<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html;charset=UTF-8");%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.c1{
width: 1700px;
height:1500px;}
.nag { /*  냉장고 */
   background-image: url("./image/nagjang00.png");
   background-size: 1700px 90%;
   width: 89%;
   height: 60%;
   z-index: 1;
   position: relative;
   background-repeat: no-repeat;
   margin-left: 2%;
}

#bag { /*  복주머니 */
   z-index: 99;
   background-image: url("./image/bag.png");
   /* background-size : 65%; */
   background-position: center;
   background-size: 300px 80%;
   width: 300px;
   height: 150px;
   position: absolute;
   background-repeat: no-repeat;
   list-style: none;
}

.b1 {
   margin-top: 270px;
   margin-left: 250px;
}

.b2 {
   margin-top: 270px;
   margin-left: 465px;
}

.b3 {
   margin-top: 270px;
   margin-left: 680px;
}

.b4 {
   margin-top: 420px;
   margin-left: 250px;
}

.b5 {
margin-top: 420px; margin-left: 465px;
   
}

.b6 {
margin-top: 420px; margin-left: 680px;
   
}

.b7 {
margin-top: 570px; margin-left: 250px;
   
}

.b8 {
   margin-top: 570px; margin-left: 465px;
}

.b9 {
   margin-top: 570px; margin-left: 680px;
}

#a1 {
   display: block;
   margin-left: 80px;
   margin-top: 85px;
}

</style>
<%
String id=request.getParameter("fakeid");
%>
<body><!-- 사용자id계속받음 -->

<form action="RecipeController.do" method="post">
	<input type="hidden" name="command" value="recommend_refri_recipe">
	<input type="hidden" name="fakeid" value="fake"><!-- 아이디 계속보냄 -->
	
	<input type="submit" value="요리추천받으로 가기">
	<div class="c1">
	<ul class="nag">
	<c:forEach items="${myrefrigerator }" var="dto" varStatus="status"><!-- setattribute한거 -->
	
	
	<li id="bag" class="b${status.index+1 }"><b id="a1">${dto.irdnt_nm }</b></li>
     
	
	</c:forEach>

	</ul>
	</div>
	<input type="button" onclick="location.href='RecipeController.do?command=recommend_refri_recipe_delete&fakeid=<%=id %>'" value="냉장고재료삭제">
	
	
	
</form>
</body>
</html>