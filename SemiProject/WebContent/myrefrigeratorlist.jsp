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
<%
String id=request.getParameter("fakeid");
%>
<body><!-- 사용자id계속받음 -->

<form action="RecipeController.do" method="post">
	<input type="hidden" name="command" value="recommend_refri_recipe">
	<input type="hidden" name="fakeid" value="fake"><!-- 아이디 계속보냄 -->
	<div class="myrefrigeratorlist">
	<ul>
	<c:forEach items="${myrefrigerator }" var="myrefrigerator"><!-- setattribute한거 -->
	<li>
	<b>${myrefrigerator.id }</b>:<b>${myrefrigerator.irdnt_nm }</b>
	</li>
	
	</c:forEach>

	</ul>
	
	<input type="submit" value="요리추천받으로 가기">
	</div>
</form>
</body>
</html>