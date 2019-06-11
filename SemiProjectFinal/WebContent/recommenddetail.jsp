<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html;charset=UTF-8");%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="basicRecipe">
					<h3>기본 요리법</h3>
					<h4>요리재료</h4><span>${infolist.qnt }</span>
					<ul class="cookInfo">
						
						
						
						<c:forEach items="${materiallist }" var="dto">
							<li><b>${dto.irdnt_ty_nm }</b>:<b>${dto.irdnt_nm }</b>
								

							</li>
						</c:forEach>
									
				
						
					</ul>
					<h4>기본정보</h4>
					<ul class="cookInfo">
							<li><b>시간 : </b>${infolist.cooking_time }</li>
							<li><b>난이도 : </b>${infolist.level_nm }</li>
						
					</ul>
					<h4>요리과정</h4>
					<ul class="cookProcess">
						
							
						
						<c:forEach items="${processlist }" var="dto">
							<li><span class="num">${dto.cooking_no }</span>${dto.cooking_dc }
								
									<div class="imgArea">
										<img src="${dto.stre_step_image_url }" alt="" title="">
									</div>

							</li>
						</c:forEach>
						
						
					</ul>
					</div>


</body>
</html>