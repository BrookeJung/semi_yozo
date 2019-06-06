<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%

%>
<body>
	<div id="contentWrap">
	

		<div id="content">
			<h1 class="">안심레시피</h1>
			
			<div id="printView">
				<div class="visualRecipe">
					
						<img src="${infodto.img_url }" alt="" class="pic" title="콩비지동그랑땡" width="301" height="186">
						
					
					<div class="cookInfo">
						<strong id="viewTit" class="tit">${infodto.recipe_nm_ko }</strong>
						<p>${infodto.sumry }</p>
						<dl class="cookInfo">
							<dt>음식분류</dt>
							<dd>${infodto.nation_nm } &gt; ${infodto.ty_nm }</dd>
							<dt>조리시간</dt>
							<dd>${infodto.cooking_time }</dd>
							
						</dl>
					</div>
				</div>
				
					</div>				
				</div>
			</div>
			

	


</body>
</html>