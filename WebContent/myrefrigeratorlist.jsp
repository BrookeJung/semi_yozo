<%@page import="com.user_login.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html;charset=UTF-8");%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료추가</title>
<%@ include file="./header.jsp" %>  
</head>
 <style>
.c1 {
	width: 1500px;
	height: 1500px;
	padding: 0px;
}

.nag { /*  냉장고 */
	background-image: url("./image/nagjang00.png");
	background-size: 900px 60%; width : 99%;
	height: 90%;
	z-index: 1;
	position: relative;
	background-repeat: no-repeat;
	margin-left: 2%;
	padding: 0px;
	width: 99%
}

#bag { /*  복주머니 */
	z-index: 99;
	background-image: url("./image/bag.png");
	/* background-size : 65%; */
	background-position: center;
	background-size: 180px 80%;
	width: 200px;
	height: 120px;
	position: absolute;
	background-repeat: no-repeat;
	list-style: none;
	display: block;
}

.b1 {
	margin-top: 70px;
	margin-left: 0px;
}

.b2 {
	margin-top: 70px;
	margin-left: 150px;
}

.b3 {
	margin-top: 70px;
	margin-left: 300px;
}

.b4 {
	margin-top: 200px;
	margin-left: 0px;
}

.b5 {
	margin-top: 200px;
	margin-left: 150px;
}

.b6 {
	margin-top: 200px;
	margin-left: 300px;
}

.b7 {
	margin-top: 330px;
	margin-left: 0px;
}

.b8 {
	margin-top: 330px;
	margin-left: 150px;
}

.b9 {
	margin-top: 330px;
	margin-left: 300px;
}

#a1 {
	display: block;
	text-align:center;
	margin-top: 35%;
}

@media ( max-width : 600px ) {
	.c1 {
		width: 550px;
		height: 800px;
	}
	.nag { /*  냉장고 */
		background-image: url("./image/nagjang00.png");
		background-size: 550px 70%;
		width: 99%;
		height: 90%;
		z-index: 1;
		position: relative;
		background-repeat: no-repeat;
		margin-left: 2%;
		padding: 0px;
	}
	#bag { /*  복주머니 */
		z-index: 99;
		background-image: url("./image/bag.png");
		/* background-size : 65%; */
		background-position: center;
		background-size: 100px 80%;
		width: 100px;
		height: 80px;
		position: absolute;
		background-repeat: no-repeat;
		list-style: none;
	}
	.b1 {
		margin-top: 40px;
		margin-left: 10px;
	}
	.b2 {
		margin-top: 40px;
		margin-left: 100px;
	}
	.b3 {
		margin-top: 40px;
		margin-left: 200px;
	}
	.b4 {
		margin-top: 120px;
		margin-left: 10px;
	}
	.b5 {
		margin-top: 120px;
		margin-left: 100px;
	}
	.b6 {
		margin-top: 120px;
		margin-left: 200px;
	}
	.b7 {
		margin-top: 200px;
		margin-left: 10px;
	}
	.b8 {
		margin-top: 200px;
		margin-left: 100px;
	}
	.b9 {
		margin-top: 200px;
		margin-left: 200px;
	}
	#a1 {
		font-size: 10pt;
		display: block;
		margin-top: 45%;
		text-align: center;
	}
}


 input[type=submit],input[type=button] {
	background-color: #ffe3d5;
  color: #db5e49;
  padding: 1%;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
  border:none;
	
}
</style>
<body><!-- 사용자id계속받음 -->
<div style="background: white; width: 100% ;height: 100%; text-align: left; padding: 5%;">

<form action="RecipeController.do" method="post">
	<input type="hidden" name="command" value="recommend_refri_recipe">

	
	<input type="submit" value="요리추천받으로 가기">
	<input type="button" onclick="location.href='RecipeController.do?command=recommend_refri_recipe_delete'" value="냉장고재료삭제">
	
	
	
	<div class="c1">
	<ul class="nag">
	<c:forEach items="${myrefrigerator }" var="dto" varStatus="status"><!-- setattribute한거 -->
	
	
	<li id="bag" class="b${status.index+1 }"><b id="a1">${dto.irdnt_nm }</b></li>
     
	
	</c:forEach>

	</ul>
	</div>
	
</form>
</div>
<%@ include file="./footer.jsp" %>  
</body>
</html>