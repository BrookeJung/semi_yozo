<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/join2.css">


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
<script>
   $(document)
         .ready(
               function() {
                  Kakao.init("33252633bc0ae68bd46f408c05f09f42");
                  function getKakaotalkUserProfile() {
                     Kakao.API
                           .request({
                              url : '/v1/user/me',
                              success : function(res) {
                                 $("#kakao-profile").append(
                                       res.properties.nickname);
                                 $("#kakao-profile")
                                       .append(
                                             $(
                                                   "<img/>",
                                                   {
                                                      "src" : res.properties.profile_image,
                                                      "alt" : res.properties.nickname
                                                            + "님의 프로필 사진"
                                                   }));
                              },
                              fail : function(error) {
                                 console.log(error);
                              }
                           });
                  }
                  function createKakaotalkLogin() {
                     $(
                           "#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn")
                           .remove();
                     var loginBtn = $("<a/>", {
                        "class" : "kakao-login-btn",
                        "text" : "로그인"
                     });
                     loginBtn.click(function() {
                        Kakao.Auth.login({
                           persistAccessToken : true,
                           persistRefreshToken : true,
                           success : function(authObj) {
                              getKakaotalkUserProfile();
                              createKakaotalkLogout();
                           },
                           fail : function(err) {
                              console.log(err);
                           }
                        });
                     });
                     $("#kakao-logged-group").prepend(loginBtn)
                  }
                  function createKakaotalkLogout() {
                     $(
                           "#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn")
                           .remove();
                     var logoutBtn = $("<a/>", {
                        "class" : "kakao-logout-btn",
                        "text" : "로그인"
                     });
                     logoutBtn.click(function() {
                        Kakao.Auth.logout();
                        createKakaotalkLogin();
                        $("#kakao-profile").text("");
                     });
                     $("#kakao-logged-group").prepend(logoutBtn);
                  }
                  if (Kakao.Auth.getRefreshToken() != undefined
                        && Kakao.Auth.getRefreshToken().replace(/ /gi,
                              "") != "") {
                     createKakaotalkLogout();
                     getKakaotalkUserProfile();
                  } else {
                     createKakaotalkLogin();
                  }
               });
</script>
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
            formLogin.action = "logincontroller.do?command=login";
            formLogin.method = "post";
            formLogin.submit();
         }
      }
   }
</script>

</head>
<body class="page1">

   <!--==============================header=================================-->
   <header>
      <div class="container_12">
         <div class="grid_12" style="margin-top: 5%">

            <h1>
               <a id="logo" href="mainboard.jsp"><img src="images/logo.png"
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
   <div class="content">

      <form id="formLogin" name="formLogin" method="post"
         action="logincontroller.do">
         <input type="hidden" name="command" value="login">
         <div class="wrapper">
            <div>
            <!--      <h1><img src="images/logo.png" width="300" height="100" alt="로그인"></h1>-->
            </div>
            <div id="contents">

               <div class="loginSec" id="loginSec">
                  <div class="idPass">
                     <fieldset>
                        <legend>
                           <span>yorijori 로그인 </span>
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
                              <span>YoriJori 로그인</span>
                           </button>
                        </div>
                     </fieldset>
                  </div>
                  <p class="loginMenu">
                     <a href="idfind.jsp" a2s="click" obj="P_LOGIN"
                        opt="{&quot;Name&quot;:&quot;IDSearch&quot;}" class="schId">YoriJori
                        ID 찾기</a> <span>|</span> <a href="pwfind.jsp" a2s="click"
                        obj="P_LOGIN" opt="{&quot;Name&quot;:&quot;PWSearch&quot;}"
                        class="schPass">비밀번호 찾기</a> 

                  </p>
                  <div class="tpa">
                     <p>
                        <img src="https://ssl.nx.com/S2/p3/login/2016/img_tpa.gif"
                           width="440" height="12" alt="또는">
                     </p>
                     <div class="join2Cnts">


            <div class="join2Cnts">


            <div class="selectTpa">
               
               <ul>
                  <li><a href="logincontroller.do?command=joininsertform" id="ucSelectJoinType_btnJoinEmailID"
                     name="ucSelectJoinType$btnJoinEmailID" memberbutton="true"
                     a2sobject="MEMBERS_JOIN" a2sopt="SignupwithEmail" style="width: 405px;">
                     <img src="image/emailsignup.png" width="380" height="18"
                        alt="이메일로 회원가입 - 이메일ID와 비밀번호로 YoriJori 회원가입"></a></li>
                  <li><a href="http://developers.kakao.com/logout" a2sobject="MEMBERS_JOIN"
                     a2sopt="SignupwithGoogle" style="width: 405px;">
                     <img src="image/kakaosignup.png" width="350" height="22"
                        alt="Kakao로 회원가입 - 카카오로 인증하여 YoriJori 회원가입"></a></li>
                  <li><a href="#" a2sobject="MEMBERS_JOIN"
                     a2sopt="SignupwithNaver"style="width: 405px;">
                     <img src="image/naversignup.png" width="362" height="20"
                        alt="Naver로 회원가입 - 네이버로 인증하여 YoriJori 회원가입"></a></li>
               </ul>
            </div>



         </div>



         </div>
                  </div>
               </div>


            </div>

         </div>

      </form>
      <div id="kakao-logged-group"></div>
      <div id="kakao-profile"></div>
   </div>
   <!--==============================footer=================================-->

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
<script type='text/javascript'>
   Kakao.init('97eb7d02c879e76c46e49f5c9af2b2be');

   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
      container : '#kakao-login-btn',
      success : function(authObj) {
         Kakao.API.request({
            url : '/v1/user/me',
            success : function(info) {
               /*alert(JSON.stringify(info));*/
               alert(info.properties.nickname + '님 로그인되었습니다.');
               location.href = "mainloginboard.jsp";
            },
            fail : function(error) {
               alert(JSON.stringify(err));
            }
         });
      },
      fail : function(err) {
         alert(JSON.stringify(err));
      }
   });
</script>
</html>
S