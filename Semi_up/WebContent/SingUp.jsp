<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>write</title>
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


<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="./js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->

<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {

				}
			},
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["ir1"].exec("PASTE_HTML",
						[ "기존 DB에 저장된 내용을 에디터에 적용할 문구" ]);
			},
			fCreator : "createSEditor2"
		});

		//저장버튼 클릭시 form 전송
		$("#save").click(function() {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
	});
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

	<!--==============================Content=================================-->
<script type="text/javascript"
		src="https://ssl.nx.com/s1/global/ngb_bodyend.js" charset="euc-kr"></script>
	<form name="formLogin" method="post" id="formLogin"></form>

	<script type="text/javascript">
	// A2S Setup
	$(function () {
		if (a2sObject != null && a2sContentsOpt != null) {
			MemberA2S.Contents(a2sObject, a2sContentsOpt);
		}
	});
</script>
<form method="post" action="./join.aspx"
		onsubmit="javascript:return WebForm_OnSubmit();" id="m_form">
		<div class="aspNetHidden">
			<!-- 필수 -->
			<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
			<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT"
				value=""> <input type="hidden" name="__VIEWSTATE"
				id="__VIEWSTATE"
				value="BdqP+yA5zfBXA8/3bQgJ39Gf6EK+afGQIhYQ4J7gTr5WjvvGitk/VAEfAfzxqq5ba7jC9fTiSzmm0LGf3WggfCLH+6J73iKdSLQKQYNA3U+6byV1lMN4YkSzyPz/nsu5pTd6H1Clt2CCJKDhf0p/0gZp+g0fLL9v+vZvc5sv6qyVF5hUivc+gHUa/L8XNM34bAEdrTe9AdwxQpJNPH8Qcngt10OQ45rzZfnAvquRZfsfrpYiXqL68Aad2x6jZT4vNVep/l5zR8Pv6JPXoAmRNRooMii9SNn5BrrUiJ2gSJoqpsQd8qfCgxQ5u4JfoZP4P7hqnA==">
		</div>


		<div class="wrapper">
			<div class="header">
				<div class="headerDeco">
					<h1>
						<a href="#" a2soptgnb="GnbLogo"><img src="image/nobackground.png"
							width="157" height="19" alt="yorijori member"></a>
					</h1>
				</div>
			</div>


			<div class="join2Cnts">


				<div class="selectTpa">
					<p class="txt1">
						<img
							src="image/yorijoriwelcome.png"
							width="360" height="182" alt="넥슨에 오신 것을 환영합니다!">
					</p>
					<p class="txt2">
						<img
							src="image/selectsignup.png"
							width="272" height="19" alt="넥슨 회원가입 방식을 선택해주세요.">
					</p>
					<ul>
						<li><a href="#" id="ucSelectJoinType_btnJoinEmailID"
							name="ucSelectJoinType$btnJoinEmailID" memberbutton="true"
							a2sobject="MEMBERS_JOIN" a2sopt="SignupwithEmail"><img
								src="image/emailsignup.png" width="380" height="18"
								alt="이메일로 회원가입 - 이메일ID와 비밀번호로 YoriJori 회원가입"></a></li>
						<li><a href="#" a2sobject="MEMBERS_JOIN"
							a2sopt="SignupwithFacebook"
							onclick="NgbLogin.LoginFacebook(); return false;"><img
								src="image/facebooksignup.png" width="418" height="20"
								alt="Facebook으로 회원가입 - 페이스북으로 인증하여 YoriJori 회원가입"></a></li>
						<li><a href="#" a2sobject="MEMBERS_JOIN"
							a2sopt="SignupwithGoogle"
							onclick="NgbLogin.LoginGoogle(); return false;"><img
								src="image/kakaosignup.png" width="350" height="22"
								alt="Kakao로 회원가입 - 카카오로 인증하여 YoriJori 회원가입"></a></li>
						<li><a href="#" a2sobject="MEMBERS_JOIN"
							a2sopt="SignupwithNaver"
							onclick="NgbLogin.LoginNaver(); return false;"><img
								src="image/naversignup.png" width="362" height="20"
								alt="Naver로 회원가입 - 네이버로 인증하여 YoriJori 회원가입"></a></li>
					</ul>
				</div>



			</div>

		</div>



	</form>
	
	
	<!--==============================footer=================================-->

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