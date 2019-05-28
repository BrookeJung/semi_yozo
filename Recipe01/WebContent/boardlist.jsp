<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.muldel.dao.MdBoardDao" %>
<%@ page import="com.muldel.dto.MdBoardDto" %>
<%@ page import="java.util.List" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.0.js"></script>
<script type="text/javascript">
	$(function(){
		$("#muldelform").submit(function(){
			if($("#muldelform input:checked").length==0){
				alert("삭제할 글을 하나 이상 체크해 주세요");
				return false;
			}
		});
		
		//checkbox
		$("input[name=chk]").click(function(){
			if($("input[name=chk]").length==$("input[name=chk]:checked").length){
				$("input[name=all]").prop("checked",true);
			}else{
				$("input[name=all]").prop("checked",false);
			}
		});
	})
	
	
	
	function allChk(bool){
		//향상된 for문처럼 생략해서도 사용 가능
		$("input[name=chk]").each(function(){
			$(this).prop("checked", bool);
		});
	}
	
</script>
</head>
	<%
		MdBoardDao dao = new MdBoardDao();
		List<MdBoardDto> list = dao.selectList();
	%>
<body>
	<%@ include file="./form/header.jsp" %>
	<h1>글 목록</h1>
	<!-- /:root 가장 최상위 폴더 ./:같은 폴더 ../:바로 위 상위폴더 -->
	<form action="./muldel.jsp" method="post" id="muldelform">
		<table border="1">
			<col width="30px"/>
			<col width="50px"/>
			<col width="100px"/>
			<col width="300px"/>
			<col width="100px"/>
			<tr>
				<th><input type="checkbox" name="all" onclick="allChk(this.checked)"/></th>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
	<%
		if(list.size()==0){
	%>
		<tr>
			<td colspan="5">-------글이 존재하지 않습니다---------</td>
		</tr>
	<%
		} else {
			for(int i=0;i<list.size();i++){
	%>
			<tr>
				<td><input type="checkbox" name="chk" value="<%=list.get(i).getSeq() %>"/></td>
				<td><%=list.get(i).getSeq() %></td>
				<td><%=list.get(i).getWriter() %></td>
				<td><a href="boarddetail.jsp?seq=<%=list.get(i).getSeq()%>"><%=list.get(i).getTitle() %></a></td>
				<td><%=list.get(i).getRegdate() %></td>
			</tr>
	<%
			}
		}
	%>
			<tr>
				<td colspan="5">
					<input type="button" value="글쓰기" onclick="location.href='insert.jsp'">
					<input type="submit" value="선택 삭제">
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="./form/footer.jsp" %>
	
</body>
</html>