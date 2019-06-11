<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.user_login.dto.LoginDto" %> 

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %> 
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<meta data-react-helmet="true" charset="utf-8" />
<meta data-react-helmet="true" name="keywords"
	content="구름IDE, goormIDE, goorm ide, 코드, 에디터, IDE, 워크스페이스, 도커, docker, integrated development environment, cloud ide, cloud development environment, cloud editor, web based ide, aws" />
<meta data-react-helmet="true" name="description"
	content="구름은 클라우드 기술을 이용하여 누구나 코딩을 배우고, 실력을 평가하고, 소프트웨어를 개발할 수 있는 클라우드 소프트웨어 생태계입니다." />

<meta data-react-helmet="true" name="msapplication-TileColor"
	content="#da532c" />
<meta data-react-helmet="true" name="theme-color" content="#ffffff" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link data-react-helmet="true" rel="canonical"
	href="https://accounts.goorm.io" />
<link data-react-helmet="true" rel="apple-touch-icon" sizes="180x180"
	href="/apple-touch-icon.png" />
<link data-react-helmet="true" rel="icon" type="image/png" sizes="32x32"
	href="/favicon-32x32.png" />
<link data-react-helmet="true" rel="icon" type="image/png" sizes="16x16"
	href="/favicon-16x16.png" />
<link data-react-helmet="true" rel="manifest" href="/site.webmanifest" />
<title data-react-helmet="true">아이디 찾기</title>
<link rel="stylesheet" href="css/loginform.css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
</head>
<body class="page1">
	<!--==============================header=================================-->
 <header> 
  <div class="container_12">
   <div class="grid_12"> 
    <div class="grid_12" style="margin-top: 5%">
      
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
</header>
	<!--==============================Content=================================-->
	<div class="content">

		<form id="idfindfind" name="idfindfind">
			<div class="wrapper">
				<div class="header">
					<!--  <h1><img src="images/logo.png" width="300" height="100" alt="로그인"></h1> -->
				</div>
				<div id="contents">

					<div class="loginSec" id="loginSec">
						<div class="idPass">
							<fieldset>
								<legend>
									<span>yorijori 아이디 찾기 </span>
								</legend>
								<span>${dto.id }</span>
								<div class="searchId">
									<button type="button" onclick="location.href='login.jsp'">로그인 하러가기</button>
									<button onclick="pwfind.jsp">비밀번호 찾기</button>
								</div>
							</fieldset>
						</div>

					</div>


				</div>

			</div>

		</form>
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
</body>
</html>