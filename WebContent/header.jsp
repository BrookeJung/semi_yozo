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

</script>
<style type="text/css">
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
   <header style="background-color: #ffe3d5;">
      <div style="height: 100%;">

         <div class="container_12">
            <div class="grid_12">
               <div class="socials">
              <%
                        LoginDto ldto  = (LoginDto)session.getAttribute("ldto");
            
                        if(ldto == null){
                        %>
                           <a id="log" href="login.jsp"><img alt="login"
                              src="image/LOGIN.png" onclick="login()" width="100px;"></a>
                        <%
                        }else{
                        %>
                        <a id="log" href="javascript:void(0);" onclick="logout()"><img alt="logout"
                              src="image/LOGOUT.png" width="100px;"></a>
                        <%
                        }   
                        %>
               </div>
               <h1>
                  <a id="logo" href="index.jsp"><img
                     src="image/LOGO.png" alt="Boo House"></a>
               </h1>
               <div class="menu_block">


                  <nav id="bt-menu" class="bt-menu" >
                     <a href="#" class="bt-menu-trigger"><span>Menu</span></a>
                     <ul>
                        <li class="current bt-icon "><a href="#">Home</a></li>
                        
                        <li class="bt-icon">
                        <%
               
                        if(ldto == null){
                        %>
                        <a
                           href="logincontroller.do?command=getout">재료등록</a>
                        <%
                        }else{
                        %>
                              <a
                           href="RecipeController.do?command=myrefrigerator">재료등록</a>
                           
                        <%
                        }   
                        %>
                           </li>
                        <li class="bt-icon">
                        <%
               
                        if(ldto == null){
                        %>
                        <a
                           href="logincontroller.do?command=getout"
                           class="block1">레시피</a>
                        <%
                        }else{
                        %>
                        <a
                           href="RecipeController.do?command=allrecipe&pagenum=1&contentnum=9"
                           class="block1">레시피</a>
                        <%
                        }   
                        %>
                        
                           </li>
                        <li class="bt-icon">
                        <%
               
                        if(ldto == null){
                        %>
                        <a href="logincontroller.do?command=getout">레시피등록</a>
                        <%
                        }else{
                        %>
                        <a href="RecipeController.do?command=recipeupload">레시피등록</a>
                        <%
                        }   
                        %>
                        </li>
                        <li class="bt-icon">
                        
                        <%
               
                        if(ldto == null){
                        %>
                        <a
                           href="logincontroller.do?command=getout">Q&A</a>
                        <%
                        }else{
                        %>
                        <a
                           href="recipeController.do?command=queboardlist&pagenum=1&contentnum=10&opt=5&condition=0">Q&A</a>
                        <%
                        }   
                        %>
                        </li>
                        <li class="bt-icon">
                        <%
               
                        if(ldto == null){
                        %>
                        <a href="logincontroller.do?command=getout">마이페이지</a>
                        <%
                        }else{
                        %>
                        <a href="mypage.jsp">마이페이지</a>
                         <%
                        }   
                        %>
                        
                        
                        </li>
                     </ul>
                  </nav>

                  <div class="clear"></div>
               </div>
               <div class="clear"></div>
            </div>
         </div>
      </div>
   </header>
</body>
<script type="text/javascript">
   function logout() {
      if (confirm("로그아웃 하시겠습니까?")) {
         location.href = "logincontroller.do?command=logout";
      } else {
      }
   }
</script>
</html>