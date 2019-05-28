<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.muldel.dao.MdBoardDao" %>
<%@ page import="com.muldel.dto.MdBoardDto" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	MdBoardDao dao = new MdBoardDao();
	
	int res = dao.delete(seq);
	if(res>0){
%>
	<script type="text/javascript">
		alert("삭제 완료");
		location.href="boardlist.jsp";
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert("삭제 실패");
		location.href="boardlist.jsp";
	</script>
<%
	}
%>
</body>
</html>