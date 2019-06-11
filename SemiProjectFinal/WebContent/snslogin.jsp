<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta data-react-helmet="true" charset="utf-8"/><meta data-react-helmet="true" name="keywords" content="구름IDE, goormIDE, goorm ide, 코드, 에디터, IDE, 워크스페이스, 도커, docker, integrated development environment, cloud ide, cloud development environment, cloud editor, web based ide, aws"/><meta data-react-helmet="true" name="description" content="구름은 클라우드 기술을 이용하여 누구나 코딩을 배우고, 실력을 평가하고, 소프트웨어를 개발할 수 있는 클라우드 소프트웨어 생태계입니다."/><meta data-react-helmet="true" property="og:type" content="website"/><meta data-react-helmet="true" property="og:title" content="구름 서비스 로그인"/><meta data-react-helmet="true" property="og:site_name" content="구름"/><meta data-react-helmet="true" property="og:description" content="구름은 클라우드 기술을 이용하여 누구나 코딩을 배우고, 실력을 평가하고, 소프트웨어를 개발할 수 있는 클라우드 소프트웨어 생태계입니다."/><meta data-react-helmet="true" property="og:url" content="https://accounts.goorm.io"/><meta data-react-helmet="true" property="al:web:url" content="https://accounts.goorm.io"/><meta data-react-helmet="true" property="og:image" content="https://statics.goorm.io/images/1200_628_goorm.png"/><meta data-react-helmet="true" name="msapplication-TileColor" content="#da532c"/><meta data-react-helmet="true" name="theme-color" content="#ffffff"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="/styles/bootstrap.min.css">
	<link rel="stylesheet" href="/app.036ccdd8.css">
	<link data-react-helmet="true" rel="canonical" href="https://accounts.goorm.io"/><link data-react-helmet="true" rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png"/><link data-react-helmet="true" rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png"/><link data-react-helmet="true" rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png"/><link data-react-helmet="true" rel="manifest" href="/site.webmanifest"/><link data-react-helmet="true" rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5"/>
	<title data-react-helmet="true">로그인하기</title>
	<link rel="stylesheet" href="css/loginform.css">
</head>
<body>
<form id="formLogin" name="formLogin" method="post" action="로그인컨트롤러로가자">
    <div class="wrapper">
	    <div class="header">
		    <h1><img src="image/logo1.png" width="300" height="100" alt="로그인"></h1>
	    </div>
	    <div id="contents">
		    
		    <div class="loginSec" id="loginSec">
			    <div class="idPass">
				    <fieldset>
					    <legend><span>yorijori 로그인 </span></legend>
					    <div class="id"><input type="text" id="txtNexonID" class="input01" placeholder="요리조리ID(아이디&nbsp;또는&nbsp;이메일)를&nbsp;입력해주세요."></div>
					    <div class="pass"><input type="password" id="txtPWD" class="input01" placeholder="비밀번호를 입력해주세요."></div>
                        <p class="loginMsg d_msgError"></p>
					    <div class="btLogin"><button type="button" class="button01" id="btnLogin" a2s="click" obj="P_LOGIN" opt="{&quot;Name&quot;:&quot;IDLogIn&quot;}"><span>YoriJori 로그인</span></button></div>
					</fieldset>
			    </div>	
			    <p class="loginMenu">
				    <a href="찾을경로" a2s="click" obj="P_LOGIN" opt="{&quot;Name&quot;:&quot;IDSearch&quot;}" onclick="NgbMember.SearchNexonID( 1 ); return false;" class="schId">YoriJori ID 찾기</a>
				    <span>|</span>
				    <a href="비번찾기" a2s="click" obj="P_LOGIN" opt="{&quot;Name&quot;:&quot;PWSearch&quot;}" onclick="NgbMember.SearchPassword( 1 ); return false;" class="schPass">비밀번호 찾기</a>
				    <span>|</span>
				    <a href="회원가입하로가기" a2s="click" obj="P_LOGIN" opt="{&quot;Name&quot;:&quot;Join&quot;}" onclick="$.movePage( 'https://member.nexon.com/join/join.aspx' ); return false;" class="join">YoriJori 회원가입</a>
				   
			    </p>
                <div class="tpa">
                    <p><img src="https://ssl.nx.com/S2/p3/login/2016/img_tpa.gif" width="440" height="12" alt="또는"></p>
			        <a href="페북" id="btnLogin3" class="btLoginFacebook" a2s="click" obj="P_LOGIN" opt="{&quot;Name&quot;:&quot;TPALoginfacebook&quot;}"><img src="https://ssl.nx.com/S2/p3/login/2016/bt_facebook1.gif" width="440" height="52" alt="Facebook 로그인"></a>
				    <a href="구글(우린카카오)" id="btnLogin4" class="btLoginGoogle" a2s="click" obj="P_LOGIN" opt="{&quot;Name&quot;:&quot;TPALogingoogle&quot;}"><img src="image/kakaologin.png" width="440" height="52" alt="kakao 로그인"></a>
				    <a href="네이버" id="btnLogin5" class="btLoginNaver" a2s="click" obj="P_LOGIN" opt="{&quot;Name&quot;:&quot;TPALoginnaver&quot;}"><img src="https://ssl.nx.com/S2/p3/login/2016/bt_naver1.gif" width="440" height="52" alt="Naver 로그인"></a>
		    </div>
                </div>	

	    </div>	
	    
    </div>

</form>
</body>
</html>