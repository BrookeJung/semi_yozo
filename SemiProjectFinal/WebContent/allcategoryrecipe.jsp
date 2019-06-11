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
		
		<c:forEach items="${categorylist }" var="categorylist">
			<div id="printView">
					<div class="visualRecipe">

						<img src="${categorylist.img_url }" alt="" class="pic" title=""
							width="301" height="186">


						<div class="cookInfo">
							<strong id="viewTit" class="tit">${categorylist.recipe_nm_ko }</strong>
							<p>${categorylist.sumry }</p>
							<dl class="cookInfo">
								<dt>음식분류</dt>
								<dd>${categorylist.nation_nm }&gt;
									${categorylist.ty_nm }</dd>
								<dt>조리시간</dt>
								<dd>${categorylist.cooking_time }</dd>

							</dl>
						</div>
					</div>
					
				</div>
	
		</c:forEach>
		
	</div>
</body>
</html>