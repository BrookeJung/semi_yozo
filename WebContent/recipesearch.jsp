<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 레시피</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script>
	$(document)
			.ready(function() {
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
.pic {
	opacity: 1.0;
	filter: alpha(opacity = 100);
}

.pic:hover {
	opacity: 0.5;
	opacity: 0.5;
	filter: alpha(opacity = 50);
}

#sumry {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 300px;
	height: 20px;
}
</style>

<style>
input[type=button], input[type=submit], input[type=reset] {
	background-color: #db5e49;
	border: none;
	color: #ffe3d5;
	padding: 1%;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
	font-family: '야놀자 야체', 'YanoljaYacheR';
}
</style>
<%@ include file="./header.jsp"%>
</head>
<body class="page1" style="font-family: '야놀자 야체','YanoljaYacheR' ;">
<div
	style="background: white; width: 100%; height: 1700px; text-align: left;">


	<div id="content" style="padding-bottom: 50px;">
		<h1 class=""
			style="font-size: 30pt; color: #db5e49; font-family: '야놀자 야체', 'YanoljaYacheR'; text-align: left; padding-top: 3%; padding-left: 3%">검색된
			레시피</h1>

		<div style="padding-bottom: 50px;">
			<c:forEach items="${recommendrecipe }" var="dto">
				<form action="RecipeController.do" method="post">
					<!-- 3개선택된 select * from recipe_info   for문돌려서 각각 구역생성 form태그는 그 해당요리에 대한 '자세히보기'에 recipe_id넘겨주기위함-->
					<input type="hidden" name="command" value="recommenddetail">
					<input type="hidden" name="recommendrecipeid"
						value="${dto.recipe_id }">
					<div id="printView"
						style="float: left; width: 30%; height: 500px; padding-bottom: 2%; padding-left: 3%;">
						<div class="visualRecipe">

							<c:choose>
								<c:when test="${dto.recipe_id gt 195453 }">
									<div class="foruser" style="width: 60%; height: 20%;">${dto.img_url}</div>

								</c:when>
								<c:otherwise>
									<img src="${dto.img_url }" alt="" class="pic" title=""
										width="60%" height="20%">
								</c:otherwise>
							</c:choose>


							<div class="cookInfo">
								<strong id="viewTit" class="tit">${dto.recipe_nm_ko }</strong>
								<p>${dto.sumry }</p>
								<dl class="cookInfo">
									<dt>음식분류: ${dto.nation_nm }&gt;${dto.ty_nm }</dt>
									<dt>조리시간: ${dto.cooking_time } min</dt>
									<dt>조회수: ${dto.views }</dt>
								</dl>
							</div>
						</div>
						<input type="submit" value="자세히보러가기"> <input type="button"
							value="찜"
							onclick="location.href='zzimController.do?command=zzimInsert&id=${ldto.id}&recipe_id=${dto.recipe_id}&recipe_nm_ko=${dto.recipe_nm_ko}'">

					</div>
				</form>
			</c:forEach>

		</div>
	</div>
	</div>
		<div class="paging" style="position:absolute; width: 99%; height: 30px; padding: 10px; bottom: 300px; text-align: center;">
      
			<c:if test="${pm.prev }">
				<a
					href="RecipeController.do?command=reciperesearch&contentnum=9&pagenum=${pm.pagenum-1}&recipe_nm_ko_search=${valforpaging}">
					<span>◀</span>
				</a>
			</c:if>
			<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
				<a
					href="RecipeController.do?command=reciperesearch&contentnum=9&pagenum=${idx}&recipe_nm_ko_search=${valforpaging}">
					<span> <b><c:out value="[${idx }]"></c:out></b>
				</span>
				</a>
			</c:forEach>
			<c:if test="${pm.next }">
				<a
					href="RecipeController.do?command=reciperesearch&contentnum=9&pagenum=${pm.pagenum+1}&recipe_nm_ko_search=${valforpaging}">
					<span>▶</span>
				</a>
			</c:if>
		</div>


		<script>
			$(document).ready(function() {
				$(".bt-menu-trigger").toggle(function() {
					$('.bt-menu').addClass('bt-menu-open');
				}, function() {
					$('.bt-menu').removeClass('bt-menu-open');
				});
			})
		</script>

		<%@ include file="./footer.jsp"%>
		</body>
</html>