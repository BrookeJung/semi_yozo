<%@page import="com.user_login.dto.LoginDto"%>
<%
   response.setHeader("Pragma", "no-cache");
   response.setHeader("Cache-control", "no-store");
   response.setHeader("Expires", "0");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.user_login.biz.LoginBiz"%>
<%@ page import="com.user_login.dto.LoginDto"%>

<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/menu.css">
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
   function nullcheck() {
      var nullcheck = document.forms[0].realvalue;
      if (nullcheck == null || nullcheck == "") {
         alert("값을 입력해 주세요.");

         return false;
      }
      return true;

   }

   function keyword_check() {
      var nullcheck = document.forms[0].recipe_nm_ko_search.value;
      if (nullcheck == "" || nullcheck == null) {
         alert("값을 입력해 주세요.");

         return false;
      }
      return true;
   }
</script>
<style type="text/css">
.search_img {
   z-index: 50px;
   position: relative;
   background-image: url("image/search.png");
   background-size: 100% 100%;
   background-repeat: no-repeat;
   width: 40px;
   height: 40px;
   padding: 0px;
   margin: 0px;
}

.search {
   background-color: transparent;
   width: 40px;
   border: none;
   z-index: 99px;
   position: relative;
}

.search_bar {
   float: left;
}

#form {
   align: left;
   margin-left: 70px;
   z-index: 1px;
   "
}
</style>
</head>
<body class="page1">


   <!--==============================header=================================-->
   <header>
      <div style="height: 100%;">
         <form name="search" align="left" style="margin-left: 70px;"
            method="post" action="RecipeController.do"
            onsubmit="return keyword_check();">
            <input type="hidden" name="command" value="reciperesearch">
            <input type="hidden" name="pagenum" value="1"> <input
               type="hidden" name="contentnum" value="9">


            <!-- align : 정렬 , style : 스타일 정보 포함 (margin : 여백 설정) , method : 전달 방식 ,  action : submit 시 이동 경로 ,onsubmit : submit 클릭시 호출 조건 (true 일 때 action으로 넘어감 )-->
         
         <!-- 
            <input type="text" name="recipe_nm_ko_search" class="search_bar">
            <span class="search_img"> <input type="submit" value=""
               class="search" /></span>
 -->

         </form>

         <div class="container_12">
            <div class="grid_12">
               <div class="socials">
                  <a id="log"><img alt="logout" src="image/LOGOUT.png"
                     onclick="logout()" width="100px"></a>
               </div>
               <h1>
                  <a id="logo" href="mainloginboard.jsp"><img
                     src="image/LOGO.png" alt="Boo House"></a>
               </h1>
               <div class="menu_block">


                  

                  <div class="clear"></div>
               </div>
               <div class="clear"></div>
            </div>
         </div>
      </div>
   </header>

<script type="text/javascript">
   function logout() {
      if (confirm("로그아웃 하시겠습니까?")) {
         location.href = "logincontroller.do?command=logout";
      } else {
      }
   }
</script>

<div align="center">
<a href="logincontroller.do?command=userall">회원정보 관리 </a><span>|</span>
<a href="recipeController.do?command=queboardlist&pagenum=1&contentnum=10&opt=5&condition=0"> Q&A게시판 관리</a>
</div>
<%@ include file="./footer.jsp" %> 
</body>
</html>