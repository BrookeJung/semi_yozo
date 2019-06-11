<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
     <head>
     <title>Yolijoli</title>
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
        $(document).ready(function(){
          $( ".block1" ).mouseover(function() {
            $(this).addClass( "blur" );
          });
          $( ".block1" ).mouseout(function() {
            $(this).removeClass( "blur" );
          });
          $().UItoTop({ easingType: 'easeOutQuart' });
        }) 
        
        
     </script>
  
     </head>
     <body class="page1">

<!--==============================header=================================-->
 <header> 
<form name="search" align="left" style="margin-left: 70px;"
         method="get" action="RecipeController.do" onsubmit="return keyword_check()">
         <input type="hidden" name="command" value="reciperesearch">
		
         <!-- align : 정렬 , style : 스타일 정보 포함 (margin : 여백 설정) , method : 전달 방식 ,  action : submit 시 이동 경로 ,onsubmit : submit 클릭시 호출 조건 (true 일 때 action으로 넘어감 )-->

         <input type="text" name="recipe_nm_ko_search">

        <input type="submit" value="search">

      </form>
	<form>
  <div class="container_12">
   <div class="grid_12"> 
    <div class="socials">
       <a id="log" href="login.jsp"><img alt="login" src="images/login.png"></a> 
    </div>
    <h1><a id="logo" href="mainboard.jsp"><img src="images/logo.png" alt="Boo House"></a> </h1>
    <div class="menu_block">


   <nav id="bt-menu" class="bt-menu">
        <a href="#" class="bt-menu-trigger"><span>Menu</span></a>
        <ul>
          <li class="current bt-icon "><a href="mainboard.jsp">Home</a></li>
         <li class="bt-icon"><a href="RecipeController.do?command=myrefrigerator&fakeid=fake">재료등록</a></li>
         <li class="bt-icon"><a href="RecipeController.do?command=allrecipe">레시피</a></li>
         <li class="bt-icon"><a href="write.jsp">레시피등록</a></li>
         <li class="bt-icon"><a href="#">Q&A</a></li>
         <li class="bt-icon"><a href="mypage.jsp">마이페이지</a></li>	
        </ul>
      </nav>
    
 <div class="clear"></div>
</div>
<div class="clear"></div>
          </div>
      </div>
      </form>
      
</header>

<!--==============================Content=================================-->

<div class="content"><div class="ic">More Website Templates @ TemplateMonster.com - December 02, 2013!</div>

<a href="RecipeController.do?command=myrefrigerator&fakeid=fake" class="block1"><!--id필요 -->
  <img src="images/sem1.gif" alt="">
  <span class="price"><span>냉장고 재료 등록</span>
<span><img src="images/nagjang.png" align="middle"><small></small></span><strong></strong></span>
</a>

<a href="RecipeController.do?command=allrecipe" class="block1">
  <img src="images/sem2.gif" alt="">
  <span class="price"><span>모든 레시피</span>
<span><img src="images/chken.png" align="middle"><small></small></span><strong></strong></span>
</a>
<a href="categoryrecipe.jsp" class="block1">
  <img src="images/sem3.gif" alt="">
  <span class="price"><span>카테고리별 레시피</span>
<span><img src="images/tema.png" align="middle"><small></small></span><strong></strong></span>
</a>
  <div class="container_12">
    <div class="grid_12">
      <h3>오늘의 Hot 레시피</h3>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/box_img1.jpg" alt="">
        <div class="title">고메 콥 샐러드</div>
       셰프가 주방에 남은야채로 만들어 시작되었다는 콥 샐러드는 화려한색감으로 인기가많다. 아보카도와 병아리콩 그리고 구운호두와 아몬드까지 넣어 콥 샐러드 특유의 컬러풀 감에 슈퍼푸드의 영양을 더했다.상큼한 요거트드레싱을 곁들이니 산뜻하게 즐기는 브런치 메뉴로 제격이다.<br>
        <a href="#">더 보기</a>
      </div>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/box_img2.jpg" alt="">
        <div class="title">홍샤오 새우</div>
  	     마셰코2 3회에서 특유의 점보소스가 새우와 토마토를 감싸 풍부한 맛을 낸 레시피로 심사위원의 큰 관심을 받았다. 토마토를 데쳐 껍질을 벗겨내 사용해 입안에서 더욱 부드럽게 느낄 수 있다. 바삭하게 새우를 튀겨내 프라이팬에서 빠르게 휙 볶아내 뜨거울때 한입 가득 먹어보자<br>
        <a href="#">더 보기</a>
      </div>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/box_img3.jpg" alt="">
        <div class="title">태국식 팟타이</div>
       이국적인향신료가 있어야 만들수있었던 팟타이를 간편하고쉽게 요리할수있는날이왔다.‘세계에서 가장맛있는음식’설문조사(CNN Go)에 팟타이가 5위를 차지할만큼 세계인의사랑을 받는음식이다. 새콤하면서도 달콤하고, 적당한 짠맛을 지닌 태국음식은, 우리입맛에도 잘 맞는다. 면 또는 밥으로 팟타이 소스를 넣어 집에서도 태국의 맛을 즐겨보자. <br>
        <a href="#">더 보기</a>
      </div>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/box_img4.jpg" alt="">
        <div class="title">부채살 직화구이</div>
       육우의 부드러움과 인절미의 쫄깃함을 더해 새로운 식감의 음식을 한번 만들어 보고 싶었기에 '인절미를 속에 품은 육우'라는 요리가 완성되었습니다 <br>
        <a href="#">더 보기</a>
      </div>
    </div>
  </div>
</div>


<!--==============================footer=================================-->

<footer>    
  <div class="container_12">
    <div class="grid_6 prefix_3">
      <a id="logo" href="mainboard.jsp" class="f_logo"><img src="images/logo.png" alt=""></a>
      <div class="copy">
      &copy; 2019 | <a href="#">YOLIJOLI_Recipe</a> <br> Website  by <a href="http://www.templatemonster.com/" rel="nofollow">KH_yolijoli</a>
      </div>
    </div>
  </div>
</footer>
     <script>
      $(document).ready(function(){ 
         $(".bt-menu-trigger").toggle( 
          function(){
            $('.bt-menu').addClass('bt-menu-open'); 
          }, 
          function(){
            $('.bt-menu').removeClass('bt-menu-open'); 
          } 
        ); 
      }) 
    </script>
</body>
</html>