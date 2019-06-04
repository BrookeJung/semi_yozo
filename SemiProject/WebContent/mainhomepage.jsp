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
<a href="recipeController.do?command=start_info">레시피정보 DB저장방법</a>

<a href="recipeController.do?command=start_material">레시피재료 DB저장방법</a>

<!-- xml로 가서 다시 controller로 -->
<a href="recipeController.do?command=myrefrigerator">냉장고에 재료넣기</a>


</body>
</html>