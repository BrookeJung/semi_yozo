<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>YoriJori 회원가입</title>

<link rel="stylesheet" type="text/css" href="css/global.css">
<link rel="stylesheet" type="text/css" href="css/join2.css">



</head>





<body>

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
							src="image/yorijoriwelcome1.png"
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

<%@ include file="./footer.jsp" %>  
</body>
</html>
