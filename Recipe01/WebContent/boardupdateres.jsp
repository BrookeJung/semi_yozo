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
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	MdBoardDao dao = new MdBoardDao();
	MdBoardDto dto = new MdBoardDto();
	
	dto.setSeq(seq);
	dto.setTitle(title);
	dto.setContent(content);
	
	int res = dao.update(dto);
	if(res>0){
%>
	<script type="text/javascript">
		alert("수정완료!");
		location.href="boarddetail.jsp?seq="+<%= seq%>;
	</script>
<%
	} else{
%>
	<script type="text/javascript">
		alert("수정 실패!");
		location.href="boarddetail.jsp?seq="+<%= seq%>;
	</script>
<%
	}
%>
</body>
</html>