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

<a href="RecipeController.do?command=start_info">레시피정보 DB저장방법</a>

<a href="RecipeController.do?command=start_material">레시피재료 DB저장방법</a>

<a href="RecipeController.do?command=start_process">레시피과정 DB저장방법</a>



<form action="RecipeController.do"> <!-- 처음부터 id를 들고감(냉장고쪽은 아이디가 필요) -->
<input type="hidden" name="command" value="myrefrigerator">
<input type="hidden" name="fakeid" value="fake">
<input type="submit" value="냉장고에 재료 넣으로 가기">
</form>


</body>
</html>