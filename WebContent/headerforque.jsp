<%@page import="com.user_login.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <link href="css/font-awesome.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">
  
<style type="text/css">
.icon{
   display: inline-block;
   background : url("image/lock.png") no-repeat top left; 
   background-position: 0,0;
   width: 20px;
   height: 20px;
   margin-left: 5px; 
}

.que-tbl{
   margin:0px auto 0px auto;
}

.que-tbl, .que-tbl th , .que-tbl td{
         border:0.5px dotted silver;
         border-width: 1px 0;
         border-collapse: collapse;
         padding:8px;
}


.que-tbl th{
         background-color: #db5e49;
         color: #f0f0f0;
}

.tdcenter{
text-align: center;
}


.que-tbl tr:hover td{

         background-color: #fbf4ea;

         cursor : pointer;

}
.search{
border-radius: 4px;
background-color: #db5e49; width: 40px; border: 1px; z-index: 100px; position: relative; color:white;
opacity: 80;
}
#searchForm{
 text-align: center;
}

.paging{
text-align: center;
}

 a:link { color: #272727; text-decoration: none;}
 a:visited { color: #272727; text-decoration: none;}
 a:hover { color: gray; text-decoration: blink;}

body{
margin: 0;
}
ul {
    list-style:none;
    margin:40;
    padding:40;
}

li {
 display: inline;
 padding:0 35px 0 0;
 color: #db5e49;
 font-size: 18px;
}
.header-navigation{
    display: block;
    position: relative;
    z-index: 15;
    margin: 0;
    height: 98px;
   margin-bottom: -20px;
}
.container{
text-align: center;
padding:50px;
padding-block-end: 0;
}
.header-navigation{
}
.logomarging{
margin-bottom: 40px;
}
#boxbox{
display: none;
margin-top: 12px;
text-align: right;
padding-right: 25%; 

}

#button{
border: 0;
background-color: #ffffff;
color: #db5e49;
outline: 0;
font-size: 20px;
padding-bottom: 2px;

}

</style>

<style> 
input[type=button], input[type=submit] {
border-radius: 4px;
background-color: #db5e49; width: auto; border: 1px; z-index: 99px; position: relative; color:white;
}
.search:hover,input[type=button]:hover, input[type=submit]:hover {
border-radius: 4px;
background-color: white; width: auto; border: 1.5px solid; z-index: 99px; position: relative; color:#db5e49;
border-color: #db5e49;
margin-bottom: 10;
}
</style>
<title>Insert title here</title>
</head>
<body>
   <div style="height: 58px; background-color:#db5e49; padding: 0;">      <div class="socials">
              <%  LoginDto ldto  = (LoginDto)session.getAttribute("ldto");  if(ldto == null){ %>
                        <a id="log" href="login.jsp" style="color: white; float: right; padding-right: 60px; padding-top: 15px;">Login</a>
                        <% }else{ %>
                        <a id="log" href="javascript:void(0);" onclick="logout()"style="color: white; float: right; padding-right: 15%; padding-top: 15px; font-size: 18px; font-weight:450; ">Logout</a>
                        <% } %>
           </div></div>
    <div class="header">
      <div class="container">
      <div class="logomarging">
        <a class="site-logo" href="index.jsp"><img src="image/LOGO.png" alt="로고" style="width: 30%; height: auto;"></a>
        </div>
        <!-- BEGIN NAVIGATION -->
        <div class="header-navigation">
          <ul>
          <li><a href="javascript:;" style="color: #db5e49;">Home</a></li>
            <li><a href="RecipeController.do?command=myrefrigerator"style="color: #db5e49; font: bold;">재료등록</a> </li>
            <li><a href="RecipeController.do?command=allrecipe&pagenum=1&contentnum=9" style="color: #db5e49; font: bold;">레시피</a></li>
            <li><a href="upload.jsp" style="color: #db5e49; font: bold;">레시피등록</a></li>
            <li><a href="recipeController.do?command=queboardlist&pagenum=1&contentnum=10&opt=5&condition=0" style="color: #db5e49; font: bold;">문의게시판 </a></li>
            <li><a href="mypage.jsp" style="color: #db5e49; font: bold;">마이페이지 </a></li>       
            <!-- BEGIN TOP SEARCH -->
            <!-- END TOP SEARCH -->
          </ul>
        </div>
        <!-- END NAVIGATION -->
      </div>
    </div>
</body>
<script type="text/javascript">

 function toggling() {
    var div = document.getElementById('boxbox');
    if (div.style.display !== 'none') {
        div.style.display = 'none';
    }
    else {
        div.style.display = 'block';
    }
};


</script>
</html>