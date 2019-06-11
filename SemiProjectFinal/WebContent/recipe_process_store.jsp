<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/storedb_process.js"></script>
</head>
<body>
	<form action="RecipeController.do" method="post">
      <input type="hidden" name="command" value="storedb_process" />
      <input type="submit" value="db에 저장"/>
      <table>
         <thead></thead>
         <tbody></tbody>
      </table>
   </form>
   
</body>
</html>