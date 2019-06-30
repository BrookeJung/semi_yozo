<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html;charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 레시피</title>
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
   $(document)
         .ready(function() {
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
.pic {
   opacity: 1.0;
   filter: alpha(opacity = 100);
}

.pic:hover {
   opacity: 0.5;
   opacity: 0.5;
   filter: alpha(opacity = 50);
}
</style>

<style>
input[type=button], input[type=submit], input[type=reset] {
   background-color: #db5e49;
   border: none;
   color: #ffe3d5;
   padding: 1%;
   text-decoration: none;
   margin: 4px 2px;
   cursor: pointer;
   font-family: '야놀자 야체','YanoljaYacheR' ;
}
</style>
<%@ include file="./header.jsp"%>

</head>
<body class="page1">
<body style="font-family: '야놀자 야체','YanoljaYacheR' ;">

   <!--==============================Content=================================-->


<div style="background: white; width: 100% ;height: 100%; text-align: center; padding: 1%;">


   <form action="RecipeController.do" method="POST">
      <input type="hidden" name="command" value="categoryrecipe"> <input
         type="hidden" name="pagenum" value="1"> <input type="hidden"
         name="contentnum" value="9">

      <div>


         <select name="cookcountry">

            <option value="retry" selected="selected">음식유형</option>
            <option value="서양">서양</option>
            <option value=중국>중국</option>
            <option value="한식">한식</option>
            <option value="이탈리아">이탈리아</option>
            <option value="동남아시아">동남아시아</option>
            <option value="일본">일본</option>
            <option value="퓨전">퓨전</option>
         </select> <select name="cooktype">
            <option value="retry" selected="selected">음식분류</option>
            <option value="찜">찜</option>
            <option value="만두/면류">만두/면류</option>
            <option value="빵/과자">빵/과자</option>
            <option value="양념장">양념장</option>
            <option value="피자">피자</option>
            <option value="그라탕/리조또">그라탕/리조또</option>
            <option value="튀김/커틀릿">튀김/커틀릿</option>
            <option value="찌개/전골/스튜">찌개/전골/스튜</option>
            <option value="구이">구이</option>
            <option value="밑반찬/김치">밑반찬/김치</option>
            <option value="조림">조림</option>
            <option value="밥">밥</option>
            <option value="음료">음료</option>
            <option value="나물/생채/샐러드">나물/생채/샐러드</option>
            <option value="양식">양식</option>
            <option value="도시락/간식">도시락/간식</option>
            <option value="부침">부침</option>
            <option value="떡/한과">떡/한과</option>
            <option value="국">국</option>
            <option value="샌드위치/햄버">샌드위치/햄버거</option>
            <option value="볶음">볶음</option>

         </select> <select name="cooktime">
            <option value="retry" selected="selected">조리시간</option>
            <option value="0~30분">0~30분</option>
            <option value="30분~60분">30분~60분</option>
            <option value="60분~120분">60분~120분</option>
            <option value="120분~200분">120분~200분</option>
         </select> <input type="submit" value="추천받기">


      </div>
   </form>
   <div id="content">
      <h1 class="">추천레시피!!</h1>
      <c:choose>
         <c:when test="${empty recommendrecipe }">
            <h4 style="font-family: '야놀자 야체','YanoljaYacheR' ; font-size: 15pt;">----조건에만족하는 레시피가 없습니다 .----</h4>
         </c:when>
         <c:otherwise>
            <c:forEach items="${recommendrecipe }" var="dto">
               <form action="RecipeController.do" method="post">
                  <!-- 3개선택된 select * from recipe_info   for문돌려서 각각 구역생성 form태그는 그 해당요리에 대한 '자세히보기'에 recipe_id넘겨주기위함-->
                  <input type="hidden" name="command" value="recommenddetail">
                  <input type="hidden" name="recommendrecipeid"
                     value="${dto.recipe_id }">
                  <div id="printView" style="width: 30%; padding-bottom 10%; float: left; padding-left: 3%; height: 500px;">
                     <div class="visualRecipe" >

                        <c:choose>
                  <c:when test="${dto.recipe_id gt 195453 }">
                  <div class="foruser" style="width: 60%; height: 20%">${dto.img_url}</div>
                  </c:when>
                  <c:otherwise>
                  <img src="${dto.img_url }" alt="" class="pic" title=""
                        width="60%" height="20%">
                  </c:otherwise>   
                  </c:choose>


                        <div class="cookInfo">
                           <strong id="viewTit" class="tit">${dto.recipe_nm_ko }</strong>
                           <p>${dto.sumry }</p>
                           <dl class="cookInfo">
                              <dt>음식분류: ${dto.nation_nm }&gt;${dto.ty_nm }</dt>
                              <dt>조리시간: ${dto.cooking_time } min</dt>
                              <dt>조회수: ${dto.views }</dt>

                           </dl>
                        </div>
                     </div>
                     <input type="submit" value="자세히보러가기"> <input
                        type="button" value="찜"
                        onclick="location.href='zzimController.do?command=zzimInsert&id=${ldto.id}&recipe_id=${dto.recipe_id}&recipe_nm_ko=${dto.recipe_nm_ko}'">

                  </div>
               </form>
            </c:forEach>


               <div class="paging" style="position:absolute; width: 99%; height: 30px; padding: 10px; bottom: 300px; text-align: center;">
                <c:if test="${pm.prev }">
                  <a
                     href="RecipeController.do?command=categoryrecipe&contentnum=9&pagenum=${pm.pagenum-1}&cookcountry=${pagingc}&cooktype=${pagingp}&cooktime=${pagingt}">
                     <span>◀</span>
                  </a>
               </c:if>
               <c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
                  <a
                     href="RecipeController.do?command=categoryrecipe&contentnum=9&pagenum=${idx}&cookcountry=${pagingc}&cooktype=${pagingp}&cooktime=${pagingt}">
                     <span> <b><c:out value="[${idx }]"></c:out></b>
                  </span>
                  </a>
               </c:forEach>
               <c:if test="${pm.next }">
                  <a
                     href="RecipeController.do?command=categoryrecipe&contentnum=9&pagenum=${pm.pagenum+1}&cookcountry=${pagingc}&cooktype=${pagingp}&cooktime=${pagingt}">
                     <span>▶</span>
                  </a>
               </c:if>
            </div>
         </c:otherwise>
      </c:choose>
   </div>
   </div>
   <%@ include file="./footer.jsp"%>
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