<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/storedb_info.js"></script>
</head>
<body>
	<form action="RecipeController.do" method="post">
      <input type="hidden" name="command" value="storedb_info" />
      <input type="submit" value="db에 저장"/>
      <table>
         <thead></thead>
         <tbody></tbody>
      </table>
   </form>

</body>
</html>