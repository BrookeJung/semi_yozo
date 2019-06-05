<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html;charset=UTF-8");%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>

$(function(){
	//재료추가 버튼 누르면 div에 재료 출력됨
    $('#addMaterial').click(function(){
    	var material = $('#datalist').val();
      $('#result').append("<div id='insertmaterials'><input type='checkbox' name='chk' onclick='allcancel();'/>"+material+"<input type='hidden' name='realvalue' value ='"+material+"'/></div>");
      
       

    });
	
	
	
	
 });
 //첵박 
 function allChk(bool) {
    $("input[name=chk]").each(function(){
       $(this).prop("checked",bool);
    });
 }
 function allcancel(){
	
	 if($("input[name=chk]").length == 
         $("input[name=chk]:checked").length){ //기존 chk와 체크된 chk의 길이가 같은 경우
             // 전부 다 체크되어 있을 경우
            
             $("input[name=all]").prop("checked",true);
     } else {
   	  
         $("input[name=all]").prop("checked",false);
     }
 }
 function chkdelete(){
	 $("input[name=chk]:checked").parent().remove();
	 
	 
 }
 


</script>
<body>
<h1>재료 전체출력</h1>
	



	<form action="recipeController.do" method="post">
	
		<input type="text" list="materiallist" id="datalist" >
		<input type="hidden" name="command" value="insertrefrigerator">
	
		<datalist id="materiallist">
			<c:forEach items="${list }" var="dto">
	
				<option value="${dto.irdnt_nm }">
			</c:forEach>
		</datalist>
		
		<input type="button" id="searchMaterial" value="재료검색">
		<input type="button" id="addMaterial" value="재료추가">
		<!-- button누르면 div에 텍스트출력 계속해서  -->
		
	
	
		<div id="result">
				<input type="checkbox" name="all" onclick="allChk(this.checked)" id="">전체선택
				<input type="button" name="delete" onclick="chkdelete();" id="" value="항목에서 빼기">
				<br>	
				
		</div>
	
		<input type="submit" value="냉장고에 저장" />

	</form>
	

</body>
</html>