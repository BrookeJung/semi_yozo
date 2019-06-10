<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 확인</title>
<script type="text/javascript">
	onload=function(){//페이지가 처음에 실행 될 때 확인해라
		var id = opener.document.getElementsByName("id")[0].value;
		document.getElementsByName("id")[0].value = id;
	}

	function idConfirm(bool){
		if(bool == "true"){
			opener.document.getElementsByName("id")[0].title="y";
			opener.document.getElementsByName("pw")[0].focus();
		}else{
			opener.document.getElementsByName("id")[0].focus();
		}
		self.close();
	}
</script>
</head>
<body>
	<%
		String idnotused = request.getParameter("idnotused");
	%>

	<table border="1">
		
		<tr>
			<td><%=idnotused.equals("true")?"사용이 가능 한 ID 입니다." : "이미 가입 된 아이디 입니다." %></td>
		</tr>
		<tr>
			<td><input type="button" value="확인" onclick="idConfirm('<%=idnotused%>')" /></td>
		</tr>
	</table>


</body>
</html>