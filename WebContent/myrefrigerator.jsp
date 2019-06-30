<%@page import="com.user_login.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html;charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료선택</title>
<%@ include file="./header.jsp"%>
<style type="text/css">
 input[type=submit],input[type=button] {
	 background-color: #ffe3d5;
  border: none;
  color: #db5e49;
  padding: 1%;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
	
}
</style>
</head>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(function() {
    
    //재료추가 버튼 누르면 div에 재료 출력됨 출력되면서 db에 저장할 값을 넘겨주기위해  값들이 모두 input hidden으로 name은같고 각각value생성됨 
    $('#addMaterial')
          .click(
                function() {
                   var material = $('#datalist').val();
                   var nothingtext = document.getElementById("datalist").value;
                   if (nothingtext == null || nothingtext == "") {
                      alert("재료를 넣어주세요!!");
                      
                      
                      return false;
                   }
                   
                   $('#result')
                         .append(
                               "<div id='insertmaterials' name='fornull'><input type='checkbox' name='chk' onclick='allcancel();'/>"
                                     + material
                                     + "<input type='hidden' name='realvalue' value ='"+material+"'/></div>");

                });
    
 });
	//첵박 
	function allChk(bool) {
		$("input[name=chk]").each(function() {
			$(this).prop("checked", bool);
		});
	}
	function allcancel() {

		if ($("input[name=chk]").length == $("input[name=chk]:checked").length) { //기존 chk와 체크된 chk의 길이가 같은 경우
			// 전부 다 체크되어 있을 경우

			$("input[name=all]").prop("checked", true);
		} else {

			$("input[name=all]").prop("checked", false);
		}
	}
	function chkdelete() {
		$("input[name=chk]:checked").parent().remove();

	}
	//엔터금지
	function captureReturnKey(e) {

		if (e.keyCode == 13 && e.srcElement.type != 'textarea')
			return false;
	}
	function nullcheck() {
	      
		   
	      var nullcheck = document.getElementById("insertmaterials");
	      
	      if (nullcheck == null || nullcheck == "") {
	         alert("재료를 넣어주세요!!");
	         

	         return false;
	      }
	      
	      return true;
	      

	   }
</script>

<body>



	<div
		style="background-color: white; height: 60%; padding-bottom: 30px;">
		<br />
		<br />
		<br />
		<div style="padding-left: 30px; padding-left: 30%; padding-right: 30%; width: 100%;">
			<fieldset
				style="width: 40%; height: 35%; padding-left: 10px; text-align: left;">
				<legend style="font-size: 30px; color: #db5e49; font-family: '야놀자 야체','YanoljaYacheR' ;">
					재료 전체출력
				</legend>



				<form action="RecipeController.do" method="post"
					style="padding-bottom: 30px;" onsubmit="return nullcheck();">


					<!-- onkeydown="return captureReturnKey(event) : 엔터 막을려고 보내는 함수 -->
					<input type="text" list="materiallist" id="datalist"
						onkeydown="return captureReturnKey(event)"> <input
						type="hidden" name="command" value="insertmyrefrigeratordb">
					
					<!-- 사용자id보내줌 -->

					<!-- 재료들을 뽑아준다. -->
					<datalist id="materiallist">
						<c:forEach items="${list }" var="dto">
							<!-- 전에 setattribute햇던 것 -->

							<option value="${dto.irdnt_nm }">
						</c:forEach>
					</datalist>

					<input type="button" id="searchMaterial" value="재료검색"> <input
						type="button" id="addMaterial" value="재료추가" onclick="return nothingtext();">

					<div id="result">
						<input type="checkbox" name="all" onclick="allChk(this.checked)"
							id="">전체선택 <input type="button" name="delete"
							onclick="chkdelete();" id="" value="항목에서 빼기"> <br>
					</div>

					<input type="submit" value="냉장고에 저장"><span><img
						alt="냉장고" src="images/nangjang.png" style="width: 30px;"></span>
					<!-- controller로 command넘어가고 추가될재료 hidden타입 여러개가 넘어가고 사용자id 넘어감  추가될재료들은 배열로 받아질예정 -->

				</form>
			</fieldset>
		</div>
	</div>

	<%@ include file="./footer.jsp"%>
</body>
</html>