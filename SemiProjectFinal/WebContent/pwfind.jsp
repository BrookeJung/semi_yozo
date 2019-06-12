<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="icon" href="images/favicon.ico">
     <link rel="shortcut icon" href="images/favicon.ico" />
     <link rel="stylesheet" href="css/style.css">
     
     
     <meta data-react-helmet="true" charset="utf-8"/><meta data-react-helmet="true" name="keywords" content="구름IDE, goormIDE, goorm ide, 코드, 에디터, IDE, 워크스페이스, 도커, docker, integrated development environment, cloud ide, cloud development environment, cloud editor, web based ide, aws"/><meta data-react-helmet="true" name="description" content="구름은 클라우드 기술을 이용하여 누구나 코딩을 배우고, 실력을 평가하고, 소프트웨어를 개발할 수 있는 클라우드 소프트웨어 생태계입니다."/><meta data-react-helmet="true" property="og:type" content="website"/><meta data-react-helmet="true" property="og:title" content="구름 서비스 로그인"/><meta data-react-helmet="true" property="og:site_name" content="구름"/><meta data-react-helmet="true" property="og:description" content="구름은 클라우드 기술을 이용하여 누구나 코딩을 배우고, 실력을 평가하고, 소프트웨어를 개발할 수 있는 클라우드 소프트웨어 생태계입니다."/><meta data-react-helmet="true" property="og:url" content="https://accounts.goorm.io"/><meta data-react-helmet="true" property="al:web:url" content="https://accounts.goorm.io"/><meta data-react-helmet="true" property="og:image" content="https://statics.goorm.io/images/1200_628_goorm.png"/><meta data-react-helmet="true" name="msapplication-TileColor" content="#da532c"/><meta data-react-helmet="true" name="theme-color" content="#ffffff"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="/styles/bootstrap.min.css">
	<link rel="stylesheet" href="/app.036ccdd8.css">
	<link data-react-helmet="true" rel="canonical" href="https://accounts.goorm.io"/><link data-react-helmet="true" rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png"/><link data-react-helmet="true" rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png"/><link data-react-helmet="true" rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png"/><link data-react-helmet="true" rel="manifest" href="/site.webmanifest"/><link data-react-helmet="true" rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5"/>
	<title data-react-helmet="true">로그인하기</title>
	<link rel="stylesheet" href="css/loginform.css">
     
     
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
     
     <script type="text/javascript">
     function checkEmail() {
   	  var frm = document.idfind;
   	  var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';
   	  if (!regExp.test(frm.email.value)) {
   	   alert('올바른 email을 입력해주세요.');
   	   frm.email.focus();
   	  }
   	 }

     </script>
<title>Id_find</title>
</head>
 <body class="page1">
 <header> 
  <div class="container_12">
   <div class="grid_12"> 
    <div class="socials">
       <a id="log" href="login.html"><img alt="login" src="images/login.png"></a> 
    </div>
    <h1><a id="logo" href="mainboard.jsp"><img src="images/logo.png" alt="Boo House"></a> </h1>
    <div class="menu_block">


   <nav id="bt-menu" class="bt-menu">
        <a href="#" class="bt-menu-trigger"><span>Menu</span></a>
        <ul>
          <li class="current bt-icon "><a href="mainboard.jsp">Home</a></li>
         <li class="bt-icon"><a href="#">재료등록</a></li>
         <li class="bt-icon"><a href="#">레시피</a></li>
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
	
	<!-- -------------------------------------------------------------------- -->
	<div class="content">

		<form id="formLogin" name="formLogin" method="post"
			action="mailController.do">
			<input type="hidden" name="command" value="pwchange">
			<div class="wrapper">
				<div class="header">
					<!--  <h1><img src="images/logo.png" width="300" height="100" alt="로그인"></h1> -->
				</div>
				<div id="contents">

					<div class="loginSec" id="loginSec">
						<div class="idPass">
							<fieldset>
								<legend>
									<span>PW찾기 </span>
								</legend>
								
								<div class="id">
									<input type="text" id="id" name="id" class="input01"
										placeholder="id을 입력해주세요.">
								</div>
								<div class="pass">
									<input type="email" id="email" name="email" class="input01"
										onblur="checkEmail()" placeholder="email를 입력해주세요.">
								</div>
								<p class="loginMsg d_msgError"></p>
								<div class="btLogin">
									<button type="submit" class="button01"
										a2s="click" obj="P_LOGIN"
										opt="{&quot;Name&quot;:&quot;IDLogIn&quot;}">
										<span>PW 찾기</span>
									</button>
								</div>
							</fieldset>
						</div>
						<p class="loginMenu">
							<a href="idfind.jsp" a2s="click" obj="P_LOGIN"
								opt="{&quot;Name&quot;:&quot;IDSearch&quot;}"
								onclick="NgbMember.SearchNexonID( 1 ); return false;"
								class="schId">YoriJori ID 찾기</a> <span>|</span> <a href="회원가입하로가기"
								a2s="click" obj="P_LOGIN"
								opt="{&quot;Name&quot;:&quot;Join&quot;}"
								onclick="$.movePage( 'https://member.nexon.com/join/join.aspx' ); return false;"
								class="join">YoriJori 회원가입</a>

						</p>
						
					</div>


				</div>

			</div>

		</form>
		</div>
	<!-- ------------------------------------------------------------------------------------ -->
	<footer>
		<div class="container_12">
			<div class="grid_6 prefix_3">
				<a id="logo" href="mainboard.jsp" class="f_logo"><img
					src="images/logo.png" alt=""></a>
				<div class="copy">
					&copy; 2019 | <a href="#">YOLIJOLI_Recipe</a> <br> Website by
					<a href="http://www.templatemonster.com/" rel="nofollow">KH_yolijoli</a>
				</div>
			</div>
		</div>
	</footer>
	<script>
		$(document).ready(function() {
			$(".bt-menu-trigger").toggle(function() {
				$('.bt-menu').addClass('bt-menu-open');
			}, function() {
				$('.bt-menu').removeClass('bt-menu-open');
			});
		})
	</script>
	
	

</body>
</html>