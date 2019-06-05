<%@page import="com.refrigerator.dto.RefrigeratorDto"%>
<%@page import="com.refrigerator.dao.RefrigeratorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String[] material=request.getParameterValues("realvalue");
String fakeid=request.getParameter("fakeid");

for(int i=0;i<material.length;i++){
	RefrigeratorDto dto=new RefrigeratorDto(fakeid,material[i]);
	RefrigeratorDao dao=new RefrigeratorDao();
	int res=dao.insertRefrigerator(dto);
}



%>
<script type="text/javascript">
		alert("냉장고에 저장성공")
		location.href = "myrefrigerator.jsp"
</script>

</body>
</html>