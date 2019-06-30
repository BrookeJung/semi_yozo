<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Yolijoli</title>
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
.search {
   border-radius: 4px;
   background-color: #db5e49;
   width: 40px;
   border: 1px;
   z-index: 99px;
   position: relative;
   color: white;
   opacity: 80;
}

#searchForm {
   text-align: center;
}
.search:hover,input[type=button]:hover, input[type=submit]:hover {
border-radius: 4px;
background-color: white; width: auto; border: 1.5px solid; z-index: 99px; position: relative; color:#db5e49;
border-color: #db5e49;
}

</style>

<%@ include file="./header.jsp"%>
</head>
<body class="page1">

   <div id="searchForm">

      <form name="search" action="RecipeController.do" method="post"
         style="margin-bottom: 50px" onsubmit="return keyword_check();">
         <input type="hidden" name="command" value="reciperesearch">
            <input type="hidden" name="pagenum" value="1"> <input
               type="hidden" name="contentnum" value="9">
            <input type="text" size="20" name="recipe_nm_ko_search" class="search_bar" placeholder="음식명/재료"/>&nbsp; <input
            type="submit" value="검색" class="search"/>
      </form>
   </div>

   <div class="content" style="font-family: '야놀자 야체','YanoljaYacheR' ;">
       <c:choose>
         <c:when test="${ldto.id == null}">
         <a href="logincontroller.do?command=getout" class="block1">
         <img src="images/blur_img1.jpg" alt=""> <span class="price"><span>냉장고별 레시피</span> 
         <span><img src="images/nagjang.png" align="middle"><small></small></span><strong></strong></span></a>        
         </c:when>
         <c:otherwise>
            <a href="RecipeController.do?command=myrefrigerator" class="block1">
         <img src="images/blur_img1.jpg" alt=""> <span class="price"><span>냉장고별 레시피</span> 
         <span><img src="images/nagjang.png" align="middle"><small></small></span><strong></strong></span></a>
          </c:otherwise>
   </c:choose>
       <a href="RecipeController.do?command=allrecipe&pagenum=1&contentnum=9" class="block1" class="block1"> <img src="images/blur_img2.jpg"
         alt=""> <span class="price"><span>모든 레시피</span> <span><img src="images/chken.png" align="middle"><small></small></span><strong></strong></span></a> 
      <a href="categoryrecipe.jsp" class="block1"> <img
         src="images/blur_img3.jpg" alt=""> <span class="price"><span>카테고리별레시피</span>
            <span><img src="images/tema.png" align="middle"><small></small></span><strong></strong></span>
      </a>
      <div class="container_12">
         <div class="grid_12">
            <h3 style="font-family: '야놀자 야체','YanoljaYacheR' ;">오늘의 Hot 레시피</h3>
            <!-- 조회수로 하던가 그냥 랜덤띄우던가 -->
         </div>

         <c:forEach items="${recommendrecipe }" var="dto">
            <div class="grid_3">
               <div class="box maxheight">
                  <c:choose>
                     <c:when test="${dto.recipe_id gt 195453 }">
                       ${dto.img_url}
                     </c:when>
                     <c:otherwise>
                        <img src="${dto.img_url }" alt="" class="pic" title=""
                           width="60%" height="20%">
                     </c:otherwise>
                  </c:choose>
                  <div class="title" style="font-family: '야놀자 야체','YanoljaYacheR' ;">${dto.recipe_nm_ko }</div>
                  ${dto.sumry }
               </div>
            </div>


         </c:forEach>

      </div>
   </div>
  
   



   <%@ include file="./footer.jsp"%>
</body>
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