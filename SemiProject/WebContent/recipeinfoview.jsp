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
					
						<img src="${dto.img_url }" alt="" class="pic" title="콩비지동그랑땡" width="301" height="186">
						
					
					<div class="cookInfo">
						<strong id="viewTit" class="tit">${dto.recipe_nm_ko }</strong>
						<p>${dto.sumry }</p>
						<dl class="cookInfo">
							<dt>음식분류</dt>
							<dd>${dto.nation_nm } &gt; ${dto.ty_nm }</dd>
							<dt>조리시간</dt>
							<dd>${dto.cooking_time }</dd>
							
						</dl>
					</div>
				</div>
				<div class="basicRecipe">
					<h3>기본 요리법</h3>
					<h4>요리재료</h4><span>(3인분 기준)</span>
					<ul class="cookInfo">
						<li><b>주재료 : </b>
										    콩비지 300g

										, 다짐육 200g

										, 대파 1대
									
										, 호박 1/2개
									
										, 배추 2잎
	
										, 다진마늘 1T

										, 참기름 1T
	
										, 후추 1/2t

										, 소금 2t

										, 부침가루 1/2T

										, 전분 1/2T
	
										, 계란 5개
									
										, 밀가루 2CUP</li>
									
									
								
							
						
					</ul>
					<h4>기본정보</h4>
					<ul class="cookInfo">
							<li><b>시간 : </b>30분$</li>
						
							<li><b>열량 : </b>0kcal$</li>
						
						
							<li><b>난이도 : </b>보통$</li>
						
					</ul>
					<h4>요리과정</h4>
					<ul class="cookProcess">
						
							<li><span class="num">1</span>대파, 호박, 배추는 작게 다져준다.$
								
								
							</li>
						
							<li><span class="num">2</span>볼에 콩비지와 고기, 다진 채소, 다진마늘, 후추, 소금, 참기름을 넣어준다.$
								
									<div class="imgArea">
										<img src="http://file.okdab.com/recipe/148299577269600132.jpg" alt="" title="">$
									</div>
								
								
							</li>
						
							<li><span class="num">3</span>부침가루와 전분을 넣고 계란 1개를 넣어 반죽하듯 잘 섞어준다.$
								
									<div class="imgArea">
										<img src="http://file.okdab.com/recipe/148299577270200133.jpg" alt="" title="">$
									</div>
								
								
							</li>
						
							<li><span class="num">4</span>동그랑땡 반죽을 동글납작하게 모양을 잡아준다.$
								
									<div class="imgArea">
										<img src="http://file.okdab.com/recipe/148299577270600134.jpg" alt="" title="">$
									</div>
								
								
							</li>
						
							<li><span class="num">5</span>모양을 낸 반죽에 밀가루를 묻히고, 계란을 푼 계란물을 묻혀준다.$
								
									<div class="imgArea">
										<img src="http://file.okdab.com/recipe/148299577271000135.jpg" alt="" title="">$
									</div>
								
								
							</li>
						
							<li><span class="num">6</span>달궈진 팬에 기름을 두르고 옷을 계란물옷을 입힌 동그랑땡을 노릇하게 익혀준다.$
								
									<div class="imgArea">
										<img src="http://file.okdab.com/recipe/148299577271500136.jpg" alt="" title="">$
									</div>
								
								
							</li>
						
					</ul>
					</div>
					</div>				
				</div>
			</div>
			

	


</body>
</html>