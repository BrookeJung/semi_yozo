<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Pension Reservation</title>

<script type="text/javascript">
	function keyword_check() {

		if (document.search.keyword.value == '') { //검색어가 없을 경우  

			alert('검색어를 입력하세요'); //경고창 띄움 

			document.search.keyword.focus(); //다시 검색창으로 돌아감 

			return false;

		}

		else
			return true;

	}
</script>

</head>

<body>

	<h1 align="CENTER">
		<!-- h1 사이즈로 내용 출력  -->

		PENSION RESERVATION

	</h1>

	<form name="search" align="left" style="margin-right: 70px;"
		method="get" action="nextfile.jsp" onsubmit="return keyword_check()">

		<!-- align : 정렬 , style : 스타일 정보 포함 (margin : 여백 설정) , method : 전달 방식 ,  action : submit 시 이동 경로 ,onsubmit : submit 클릭시 호출 조건 (true 일 때 action으로 넘어감 )-->

		<td><input type="text" name="keyword"></td>

		<td><input type="submit" value="search"></td>

	</form>

</body>

</html>