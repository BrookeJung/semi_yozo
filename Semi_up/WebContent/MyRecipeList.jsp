<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
     <head>
     <title>insert</title>
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
  <div class="container_12">
   <div class="grid_12"> 
    <div class="socials">
       <a id="log" href="login.html"><img alt="login" src="images/login.png"></a> 
    </div>
    <h1><a id="logo" href="index.html"><img src="images/logo.png" alt="Boo House"></a> </h1>
    <div class="menu_block">


   <nav id="bt-menu" class="bt-menu">
        <a href="#" class="bt-menu-trigger"><span>Menu</span></a>
        <ul>
          <li class="current bt-icon "><a href="index.html">Home</a></li>
         <li class="bt-icon"><a href="index-1.html">재료등록</a></li>
         <li class="bt-icon"><a href="index-2.html">레시피</a></li>
         <li class="bt-icon"><a href="index-3.html">레시피등록</a></li>
         <li class="bt-icon"><a href="index-4.html">게시판</a></li>
         <li class="bt-icon"><a href="index-5.html">나의페이지</a></li>   
        </ul>
      </nav>
    
 <div class="clear"></div>
</div>
<div class="clear"></div>
          </div>
      </div>
</header>

<!--==============================Content=================================-->


	<p style="font-size: 40px; "><b>내가 쓴 레시피</b></p>
	<br/><br/><br/><br/><br/>
	
	<div style=' float:left;width:33%;'>
		<a id="list" href="#"><img alt="" src="">
		<div style='display:inline; border: 1px solid ;'>
		</div><br/>
		<p style="font-size: 20px; "><b>글 제목</b></p>
		<p>글 내용</p>
		</a> 
	</div>
	
	<div style=' float:left;width:33%;'>
		<a id="list" href="#"><img alt="" src="">
		<div style='display:inline; border: 1px solid ;'>
		</div><br/>
		<p style="font-size: 20px; "><b>글 제목</b></p>
		<p>글 내용</p>
		</a> 
	</div>
	
	<div style=' float:left;width:33%;'>
		<a id="list" href="#"><img alt="" src="">
		<div style='display:inline; border: 1px solid ;'>
		</div><br/>
		<p style="font-size: 20px; "><b>글 제목</b></p>
		<p>글 내용</p>
		</a> 
	</div>


<!--==============================footer=================================-->

<footer>    
  <div class="container_12">
    <div class="grid_6 prefix_3">
      <a id="logo" href="index.html" class="f_logo"><img src="images/logo.png" alt=""></a>
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