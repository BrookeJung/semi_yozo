<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>LOGIN</title>
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
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<link rel="stylesheet" href="/app.036ccdd8.css">
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
<title data-react-helmet="true">로그인하기</title>
<link rel="stylesheet" href="css/loginform.css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript" src="kakaofirstlogin.js"></script>

<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.3&appId=401990853990370&autoLogAppEvents=1"></script>
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
<script type="text/javascript">
	function login() {
		if (formLogin.id.value === "") {
			alert("아이디를 입력해주세요");
			formLogin.id.focus();
		} else {
			if (formLogin.pw.value === "") {
				alert("비밀번호를 입력해주세요");
				formLogin.pw.focus();

			}

			else {
				formLogin.action = "loginController.do?command=login";
				formLogin.method = "post";
				formLogin.submit();
			}
		}
	}

</script>
<style type="text/css">
img#kakao-login-btn {
	width: 240px;
	/* padding-left: 30px; */
	height: 40px;
}
</style>
<%@ include file="./header.jsp"%>
</head>
<body class="page1">

	<div class="content">

		<form id="formLogin" name="formLogin" method="post"
			action="logincontroller.do">
			<input type="hidden" name="command" value="login">
			<div class="wrapper">
				<div class="header"></div>
				<div id="contents">

					<div class="loginSec" id="loginSec">
						<div class="idPass">
							<fieldset>
								<legend>
									<span
										style="color: #db5e49; font-family: '야놀자 야체', 'YanoljaYacheR'; font-size: 20px;">yorijori
										로그인 </span>
								</legend>
								<div class="id">
									<input type="text" name="id" class="input01"
										placeholder="요리조리ID(아이디&nbsp;또는&nbsp;이메일)를&nbsp;입력해주세요.">
								</div>
								<div class="pass">
									<input type="password" name="pw" class="input01"
										placeholder="비밀번호를 입력해주세요.">
								</div>
								<p class="loginMsg d_msgError"></p>
								<div class="btLogin">
									<button type="submit" class="button01" id="btnLogin"
										a2s="click" obj="P_LOGIN"
										opt="{&quot;Name&quot;:&quot;IDLogIn&quot;}">
										<span
											style="color: #db5e49; font-family: '야놀자 야체', 'YanoljaYacheR';">YoriJori
											로그인</span>
									</button>
								</div>
							</fieldset>
						</div>
						<p class="loginMenu">
							<a href="idfind.jsp" a2s="click" obj="P_LOGIN"
								opt="{&quot;Name&quot;:&quot;IDSearch&quot;}"
								onclick="NgbMember.SearchNexonID( 1 ); return false;"
								class="schId">YoriJori ID 찾기</a> <span>|</span> <a
								href="pwfind.jsp" a2s="click" obj="P_LOGIN"
								opt="{&quot;Name&quot;:&quot;PWSearch&quot;}"
								onclick="NgbMember.SearchPassword( 1 ); return false;"
								class="schPass">비밀번호 찾기</a> <span>|</span> <a
								href="logincontroller.do?command=joininsertform" a2s="click"
								obj="P_LOGIN" opt="{&quot;Name&quot;:&quot;Join&quot;}"
								onclick="$.movePage( 'https://member.nexon.com/join/join.aspx' ); return false;"
								class="join">YoriJori 회원가입</a>

						</p>
						<div class="tpa">
							<p>
								<img src="https://ssl.nx.com/S2/p3/login/2016/img_tpa.gif"
									width="440" height="12" alt="또는">
							</p>
							<div style="text-align: left; padding-left: 90px;">
								<!-- <img alt="이메일회원가입" src="image/emailsignup.png" style="width: 252px;" > -->
								<div class="fb-login-button" data-width="" data-size="large"
									data-button-type="login_with" data-auto-logout-link="false"
									data-use-continue-as="false" scope="public_profile,email"
									onlogin="checkLoginState();" style="margin-bottom: 0.4em;"></div>
								<script src="js/facebooklogin.js"></script>
								
								<a id="kakao-login-btn"></a>
								<script src="js/kakaologin.js"></script>
							</div>
							<!-- <a href="네이버"
								id="btnLogin5" class="btLoginNaver" a2s="click" obj="P_LOGIN"
								opt="{&quot;Name&quot;:&quot;TPALoginnaver&quot;}"><img
								src="https://ssl.nx.com/S2/p3/login/2016/bt_naver1.gif"
								width="440" height="52" alt="Naver 로그인"></a> -->
						</div>
					</div>


				</div>

			</div>

		</form>
		<div id="kakao-logged-group"></div>
		<div id="kakao-profile"></div>
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