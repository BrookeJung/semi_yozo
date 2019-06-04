<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>회원가입</title>
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

</head>
<body class="page1">

	<!--==============================header=================================-->
	<header>
		<div class="container_12">
			<div class="grid_12">
				<div class="socials">
					<a id="log" href="login.html"><img alt="login"
						src="images/login.png"></a>
				</div>
				<h1>
					<a id="logo" href="MainBoard.jsp"><img src="images/logo.png"
						alt="Boo House"></a>
				</h1>
				<div class="menu_block">


					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</header>

	<!--==============================Content=================================-->
	<div style="border: 3px groove ; background-color: #e2d7d7; width: 700px; height: 560px; margin-left: auto; margin-right: auto;">
		<br /> <br />
		<p align="center" style="font-size: 25px; color: black;">회원가입</p>
		<form action="" method="post">
			<input type="hidden" name="joininsert"> <br />
			<div style=" width: 300px; height: 400px; margin:auto;"><!-- 회원가입 폼 -->
				
				<div style="width: 100%; height: 30px;">
					<input type="text" name="name" placeholder="이름" style="width: 100%; height: 30px" >
				</div>
				<p>
				<div style="width: 100%; height: 30px;">
					<div>
						<input type="text" name="id" placeholder="ID" style="width: 60%; height: 30px; float: left">
					</div>
					<div>
						<button type="button" id="id_chk" style="width: 35%; height: 37px; float: right; background-color: black; color: white;">중복확인</button>
					</div>
				</div>
				
				<p>
				<div>
					<input type="text" name="pw" placeholder="Password"
						style="width: 100%; height: 30px;">
				</div>
				<p>
				<div>
					<input type="text" name="pw_chk" placeholder="Password 확인"
						style="width: 100%; height: 30px;">
				</div>
				<p>
				<div style="width: 100%; height: 30px;">
					<div>
						<input type="text" name="email" placeholder="이메일" style="width: 60%; height: 30px; float: left">
					</div>
					<div>
						<button type="button" id="but_chk" style="width: 35%; height: 37px; float: right; background-color: black; color: white;">인증번호 발송</button>
					</div>
				</div>
				<p>
				<div align="center">
					<input type="text" name="email_chk" placeholder="인증번호 입력(유효시간 5분)"
						style="width:100%; height: 30px;">
				</div>
				<p>
				<div>
					<input type="text" name="addr" placeholder="주소"
						style="width: 100%; height: 30px;">
				</div>
				<p>
				<div align="center">
					<input type="submit"
						style="width: 310px; height: 35px; background-color: black; color: white;"
						value="회원가입">
				</div>

			</div>
		</form>
	</div>
	<!--==============================footer=================================-->

	<footer>
		<div class="container_12">
			<div class="grid_6 prefix_3">
				<a id="logo" href="MainBoard.jsp" class="f_logo"><img
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