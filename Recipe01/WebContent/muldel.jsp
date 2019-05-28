<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.muldel.dao.MdBoardDao" %>
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
	//chk에 있는 값들을 String으로 가져와준다.
	String[] seq = request.getParameterValues("chk");

	if(seq==null || seq.length==0){
%>
	<script type="text/javascript">
		alert("삭제할 글을 하나 이상 체크해주세요!");
		location.href="boardlist.jsp";
	</script>
<%
	}else{
		MdBoardDao dao = new MdBoardDao();
		int res = dao.multiDelete(seq);
		if(res>0){
%>
		<script type="text/javascript">
			alert("체크된 글들을 삭제 성공하였습니다!");
			location.href="boardlist.jsp";
		</script>
<%
		}else{
%>
		<script type="text/javascript">
			alert("체크된 글들을 삭제 실패하였습니다!");
			location.href="boardlist.jsp";
		</script>
<%
		}
	}
%>
</body>
</html>