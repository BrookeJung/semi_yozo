<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>찜목록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script>
	$(document).ready(function() {
		$(".block1").mouseover(function() {
			$(this).addClass("blur");
		});
		$(".block1").mouseout(function() {
			$(this).removeClass("blur");
		});
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
	})
</script>

<style type="text/css">
.tbl {
	margin: 100px auto 0px auto;
}

 table {
    border-top: 1px solid #444444;
    border-collapse: collapse;
    padding: 20%;
  }
  tr {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  td{
  }
  

input[type=button], input[type=submit], input[type=reset] {
  background-color: #db5e49;
  border: none;
  color: #ffe3d5;
  padding: 1%;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
  font-family: '야놀자 야체','YanoljaYacheR' ;
}
</style>
<%@ include file="./header.jsp" %>  
</head>
<body class="page1">

	<script type="text/javascript">
	
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
	</script>

	<script type="text/javascript">
		function send() {
			var count = 0;

			if(document.myform.cb.checked==true){
				count++;
				return true;
			}else{
				for (i = 0; i < document.myform.cb.length; i++) {
					if (document.myform.cb[i].checked == true) {
						count++;
					}
				}
			}
			if (count === 0) {
				alert("하나이상선택하세요");
				return false;	
			}
		}
	</script>
<div style="background: white; width: 100% ;height: 100%; text-align: left; padding: 5%;">
<h1 style="color: #db5e49; font-family: '야놀자 야체','YanoljaYacheR' ; font-size: 30pt; text-align: left; padding-left: 10px;">찜 목록</h1>
	<form name="myform" action="zzimController.do">
		<input type="hidden" name="unlock"> <input type="hidden" name="command" value="zzimmuldel">
		<input type="hidden" name="id" value="${ldto.id }">

		<table class="tbl">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">
			<tr>
				<th style="background-color: #ffe3d5;"><input type="checkbox" name="all" id="allChk(this.checked)"></th>
				<th style="background-color: #ffe3d5;">레시피 코드</th>
				<th style="background-color: #ffe3d5;">레시피 이름</th>
				<th style="background-color: #ffe3d5;">삭제</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="4">-----담긴 리스트가 없습니다.-----</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td><input type='checkbox' name='chk' onclick='allcancel();'
								value="${dto.seq }"></td>
							<td>${dto.recipe_id }</td>
							<td><a
								href="zzimController.do?command=zzimDetail&id=${dto.recipe_id}">${dto.recipe_nm_ko}</a></td>
							<td><input type="button" value="삭제"
								onclick="location.href='zzimController.do?command=zzimDelete&seq=${dto.seq}&id=${ldto.id }'"></td>

						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="3">
				 <input type="submit"id="btnsubmit" value="리스트에서 삭제" onclick="return send()">
				 </td>
			</tr>
		</table>
	</form>


</div>
	<!-- -- -->


	<script>
		$(document).ready(function() {
			$(".bt-menu-trigger").toggle(function() {
				$('.bt-menu').addClass('bt-menu-open');
			}, function() {
				$('.bt-menu').removeClass('bt-menu-open');
			});
		})
	</script>
	<%@ include file="./footer.jsp" %>
</body>
</html>