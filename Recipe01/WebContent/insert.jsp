<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.muldel.dao.MdBoardDao" %>
<%@ page import="com.muldel.dto.MdBoardDto" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="form/header.jsp" %>
	<div id="insertform">
	<h1>게시글 작성</h1>
		<form action="insertres.jsp" method="post">
			<table border="1">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="60" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="reset" onclick="location.href='boardlist.jsp'" value="취소">
					<input type="submit" value="작성"/>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="form/footer.jsp" %>
</body>
</html>