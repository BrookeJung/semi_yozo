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


<meta data-react-helmet="true" charset="utf-8" />
<meta data-react-helmet="true" name="keywords"
	content="구름IDE, goormIDE, goorm ide, 코드, 에디터, IDE, 워크스페이스, 도커, docker, integrated development environment, cloud ide, cloud development environment, cloud editor, web based ide, aws" />
<meta data-react-helmet="true" name="description"
	content="구름은 클라우드 기술을 이용하여 누구나 코딩을 배우고, 실력을 평가하고, 소프트웨어를 개발할 수 있는 클라우드 소프트웨어 생태계입니다." />
<meta data-react-helmet="true" property="og:type" content="website" />
<meta data-react-helmet="true" property="og:title" content="구름 서비스 로그인" />
<meta data-react-helmet="true" property="og:site_name" content="구름" />
<meta data-react-helmet="true" property="og:description"
	content="구름은 클라우드 기술을 이용하여 누구나 코딩을 배우고, 실력을 평가하고, 소프트웨어를 개발할 수 있는 클라우드 소프트웨어 생태계입니다." />
<meta data-react-helmet="true" property="og:url"
	content="https://accounts.goorm.io" />
<meta data-react-helmet="true" property="al:web:url"
	content="https://accounts.goorm.io" />
<meta data-react-helmet="true" property="og:image"
	content="https://statics.goorm.io/images/1200_628_goorm.png" />
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
<link data-react-helmet="true" rel="mask-icon"
	href="/safari-pinned-tab.svg" color="#5bbad5" />
<title data-react-helmet="true">Mypage</title>


<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script>
	$(document).ready(function() {
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
<title>Id_find</title>
</head>
<body class="page1">
	 <header> 
  <div class="container_12">
   <div class="grid_12"> 
    <div class="socials">
       <a id="log" href="login.html"><img alt="login" src="images/login.png"></a> 
    </div>
    <h1><a id="logo" href="MainBoard.jsp"><img src="images/logo.png" alt="Boo House"></a> </h1>
    <div class="menu_block">


   <nav id="bt-menu" class="bt-menu">
        <a href="#" class="bt-menu-trigger"><span>Menu</span></a>
        <ul>
          <li class="current bt-icon "><a href="MainBoard.jsp">Home</a></li>
         <li class="bt-icon"><a href="#">재료등록</a></li>
         <li class="bt-icon"><a href="#">레시피</a></li>
         <li class="bt-icon"><a href="write.jsp">레시피등록</a></li>
         <li class="bt-icon"><a href="PurchaseList.jsp">게시판</a></li>
         <li class="bt-icon"><a href="MyPage.jsp">나의페이지</a></li>	
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
		<br />
		<div>
			<h1 id="mypage">마이 페이지</h1>
		</div>

		<table id="list">
			<!-- <colgroup>
				<col width="20%" />
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
			</colgroup> -->
			<tr >
				<th>찜 목록 보기</th>
				<td><input type="button" value="확인" onclick="" /></td>
			</tr>
			<tr>
				<td>내 정보 수정</td>
				<td><input type="button" value="확인" onclick="" /></td>
			</tr>
			<tr>
				<td>구매 목록</td>
				<td><input type="button" value="확인" onclick="" /></td>
			</tr>
			<tr>
				<td>내가 쓴 레시피</td>
				<td><input type="button" value="확인" onclick="" /></td>
			</tr>
			<tr>
				<td>로그아웃</td>
				<td><input type="button" value="확인" onclick="" /></td>
			</tr>
			<tr>
				<td>회원 탈퇴</td>
				<td><input type="button" value="확인" onclick="" /></td>

			</tr>
		</table>
		<input id="mok" type="button" value="목록"
			onclick="location.href='index.html'" />
	</div>
	<!-- ------------------------------------------------------------------------------------ -->
	<footer>
		<div class="container_12">
			<div class="grid_6 prefix_3">
				<a id="logo" href="index.html" class="f_logo"><img
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