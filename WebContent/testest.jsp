<%@page import="com.user_login.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <link href="css/font-awesome.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">
  
<style type="text/css">
footer{
background-color: #db5e49;
text-align: center;
padding-top: 30px;
padding-bottom: 30px;
margin-top: 50px;
}
.copy,.copy a{
margin-top: 10px;
color: #fd8479;
}
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
         border:1px solid gray;
         border-width: 1px 0;
         border-collapse: collapse;
         padding:8px;
}


.que-tbl th{
         background-color: #db5e49;
         font-size: 1.1em;
         color: #f0f0f0;
         border-width:2px 0;
}

.que-tbl td{
         border-style:dotted;
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
background-color: #db5e49; width: 40px; border: 1px; z-index: 99px; position: relative; color:white;
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
}
</style>
<title>::list</title>
</head>
<script type="text/javascript">
function cantsee(){
   alert("비공개글은 작성자만 확인할 수있습니다.");
}

</script>
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

<body>
   <div style="height: 58px; background-color:#db5e49; padding: 0;">
      <div class="socials">
              <%  LoginDto ldto  = (LoginDto)session.getAttribute("ldto");  if(ldto == null){ %>
                        <a id="log" href="login.jsp" style="color: white; float: right; padding-right: 60px; padding-top: 15px;">Login</a>
                        <% }else{ %>
                        <a id="log" href="javascript:void(0);" onclick="logout()"style="color: white; float: right; padding-right: 15%; padding-top: 15px; font-size: 18px; font-weight:450; ">Logout</a>
                        <% } %>
           </div>
         </div>
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
            <li class="menu-search">
              <button id="button" onclick="toggling()"><i class="fa fa-search search-btn"></i></button>
              <div class="search-box" id="boxbox">
               <form name="search" style="margin-left: 70px;" method="post" action="RecipeController.do" onsubmit="return keyword_check();">
                  <div class="input-group">
                    <input type="text" name="recipe_nm_ko_search" class="search_bar" placeholder="음식명/재료" >
                     <span class="input-group-btn">
                      <button class="search" type="submit">찾기</button>
                  <input type="hidden" name="command" value="reciperesearch">
                  <input type="hidden" name="pagenum" value="1">
                  <input type="hidden" name="contentnum" value="9">                
                    </span>
                  </div>
                </form>
              </div> 
            </li>
            <!-- END TOP SEARCH -->
          </ul>
        </div>
        <!-- END NAVIGATION -->
      </div>
    </div>
   <table class="que-tbl" border="1">
      <col width="100">
      <col width="300">
      <col width="100">
      <col width="100">
      <tr>
         <th>글번호</th>
         <th>제   목</th>
         <th>작성자</th>
         <th>작성일</th>
      </tr>
      <c:choose>
         <c:when test="${empty list }">
            <tr>
               <td colspan="4" style="text-align: center;">※ 해당하는 글이 존재하지 않습니다 ※</td>
            </tr>
         </c:when>
         <c:otherwise>
         <c:forEach items="${list }" var="dto">
               <tr>
                  <c:choose>
                     <c:when test="${dto.secflag eq 'Y' }">
                         <td class="tdcenter">${dto.boardno }</td>
                        <c:choose>
                           <c:when test="${ldto.id==dto.writer || ldto.role=='ADMIN'}">
                            <td><i class="icon"></i><a href="recipeController.do?command=queDetail&boardno=${dto.boardno }&groupno=${dto.groupno}">${dto.title }[${dto.replyno }]</a></td>
                           </c:when>
                           <c:otherwise>
                           <td><i class="icon"></i><a onclick="cantsee()">${dto.title }</a><i class="icon"></i></td>
                           </c:otherwise>
                        </c:choose>
                        <td class="tdcenter">${dto.writer }</td>
                        <td class="tdcenter">${dto.regdate }</td>
                        
                     </c:when>
                     <c:otherwise>
                        <td class="tdcenter">${dto.boardno }</td>
                        <td>
                           <a href="recipeController.do?command=queDetail&boardno=${dto.boardno }&groupno=${dto.groupno}">${dto.title }[${dto.replyno }]</a>
                        </td>
                        <td class="tdcenter">${dto.writer }</td>
                        <td class="tdcenter">${dto.regdate }</td>
                     </c:otherwise>
                  </c:choose>
               </tr>
            </c:forEach>
         </c:otherwise>
      </c:choose>
      <tr>
         <td colspan="4" style="text-align: right; padding-right: 10px;" >
            <input type="button" value="글 작성" onclick="location.href='recipeController.do?command=queWrite'">
         </td>
      </tr>
   </table>
<div class="paging">
         <c:if test="${pm.prev }">
            <a href="recipeController.do?command=queboardlist&contentnum=10&pagenum=${pm.pagenum-1}&opt=${opt}&condition=${con}">
            <span>◀</span>
            </a>      
         </c:if>
         <c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
            <a href="recipeController.do?command=queboardlist&contentnum=10&pagenum=${idx}&opt=${opt}&condition=${con}">
               <span>
               <b><c:out value="[${idx }]"></c:out></b>
               </span>
            </a>
         </c:forEach>
         <c:if test="${pm.next }">
            <a href="recipeController.do?command=queboardlist&contentnum=10&pagenum=${pm.pagenum+1}&opt=${opt}&condition=${con}">
            <span>▶</span>
            </a>      
         </c:if>
      </div>
      <br>
   <div id="searchForm">

      <form action="recipeController.do" method="post" style="margin-bottom: 50px" >
      <input type="hidden" name="command" value="queboardlist">
      <input type="hidden" name="contentnum" value="10">
      <input type="hidden" name="pagenum" value="1">
      
         <select name="opt" style="height: 23px">
            <option value="0">제목</option>
            <option value="1">내용</option>
            <option value="2">제목+내용</option>
            <option value="3">글쓴이</option>
         </select>
         <input type="text" size="20" name="condition"/>&nbsp;
         <input type="submit" value="검색"/>
      </form>   
   </div>
   <footer style="background-color: #ffe3d5;">
         <div class="grid_6 prefix_3">
            <a id="logo" href="#" class="f_logo" style="width: 100%;height: 100%;"><img
               src="image/LOGO.png" alt="" width="300px" height="80px"></a>
            <div class="copy">
               &copy; 2019 | <a href="#">YOLIJOLI_Recipe</a> <br> Website by
               <a href="https://www.iei.or.kr/main/main.kh" rel="nofollow">KH_yolijoli</a>
            </div>
         </div>
   </footer>
</body>
<script>
   
   function nullcheck(){
       var nullcheck = document.forms[0].realvalue;
       if(nullcheck == null || nullcheck == ""){
          alert("값을 입력해 주세요.");
          
          return false;
       }
       return true;
      
    }
   
   function keyword_check(){
      var nullcheck=document.forms[0].recipe_nm_ko_search.value;
      if(nullcheck == "" || nullcheck == null){
          alert("값을 입력해 주세요.");
          
          return false;
       }
       return true;
   }
</script>
<script type="text/javascript">
   function logout() {
      if (confirm("로그아웃 하시겠습니까?")) {
         location.href = "logincontroller.do?command=logout";
      } else {
      }
   }
</script>
</html>