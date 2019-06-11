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
<body>
	<div id="content">
		<h1 class="">추천레시피!!</h1>
		
		<c:forEach items="${recommendrecipe }" var="dto">
			<form action="RecipeController.do" method="post"><!-- 3개선택된 select * from recipe_info   for문돌려서 각각 구역생성 form태그는 그 해당요리에 대한 '자세히보기'에 recipe_id넘겨주기위함-->
			<input type="hidden" name="command" value="recommenddetail"> 
			<input type="hidden" name="fakeid" value="fake">
			<input type="hidden" name="recommendrecipeid" value="${dto.recipe_id }">
				<div id="printView">
					<div class="visualRecipe">

						<img src="${dto.img_url }" alt="" class="pic" title=""
							width="301" height="186">


						<div class="cookInfo">
							<strong id="viewTit" class="tit">${dto.recipe_nm_ko }</strong>
							<p>${dto.sumry }</p>
							<dl class="cookInfo">
								<dt>음식분류</dt>
								<dd>${dto.nation_nm }&gt;
									${dto.ty_nm }</dd>
								<dt>조리시간</dt>
								<dd>${dto.cooking_time }</dd>

							</dl>
						</div>
					</div>
					<input type="submit" value="자세히보러가기">
				</div>
			</form>
		</c:forEach>
		
	</div>


</body>
</html>