<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
     <head>
     <title>구매 목록</title>
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
        $(document).ready(function(){
          $( ".block1" ).mouseover(function() {
            $(this).addClass( "blur" );
          });
          $( ".block1" ).mouseout(function() {
            $(this).removeClass( "blur" );
          });
          $().UItoTop({ easingType: 'easeOutQuart' });
        }) 
     </script>
  
     </head>
     <body class="page1">

<!--==============================header=================================-->
 <header> 
  <div class="container_12">
   <div class="grid_12"> 
    <div class="socials">
       <a id="log" href="login.html"><img alt="login" src="images/login.png"></a> 
    </div>
    <h1><a id="logo" href="mainboard.jsp"><img src="images/logo.png" alt="Boo House"></a> </h1>
    <div class="menu_block">


   <nav id="bt-menu" class="bt-menu">
        <a href="#" class="bt-menu-trigger"><span>Menu</span></a>
        <ul>
          <li class="current bt-icon "><a href="mainboard.jsp">Home</a></li>
         <li class="bt-icon"><a href="#">재료등록</a></li>
         <li class="bt-icon"><a href="recipelist.jsp">레시피</a></li>
         <li class="bt-icon"><a href="write.jsp">레시피등록</a></li>
         <li class="bt-icon"><a href="#">Q&A</a></li>
         <li class="bt-icon"><a href="mypage.jsp">마이페이지</a></li>	
        </ul>
      </nav>
    
 <div class="clear"></div>
</div>
<div class="clear"></div>
          </div>
      </div>
</header>

<!--==============================Content=================================-->
<div style="background-color: white; height: 700px;">
	<p style="color: black; font-size: 30pt; text-align: left; padding: 20px;">구매 목록</p>
	<form action="./muldel.jsp" method="post" id="muldelform">
		<table border="1">
			<col width="30px" />
			<col width="50px" />
			<col width="100px" />
			<col width="300px" />
			<col width="100px" />
			<tr>
				<th><input type="checkbox" name="all" onclick="allchk(this.checked)" /></th>
				<th>번호</th>
				<th>물품 이름</th>
				<th>가격</th>
				<th>구매일</th>
			</tr>
			<%
				/* if (list.size() == 0) { */
			%>
			<tr>
				<td colspan="5">----------글이 존재하지 않습니다.-----------------</td>
			</tr>
			<%
				/* } else {
					for (int i = 0; i < list.size(); i++) { */
			%>
			<tr>
				<td><input type="checkbox" name="chk"
					value="<%-- <%=list.get(i).getSeq()%> --%>" /></td>
				<td><%-- <%=list.get(i).getSeq()%> --%></td>
				<td><%-- <%=list.get(i).getWriter()%> --%></td>
				<td><a href="boarddetail.jsp?seq=<%-- <%=list.get(i).getSeq()%> --%>"><%-- <%=list.get(i).getTitle()%> --%></a></td>
				<td><%-- <%=list.get(i).getRegdate()%> --%></td>
			</tr>




			<%/* 
				}
				} */
			%>

			<tr>
				<td colspan="5">
					<input type="button" value="글쓰기" onclick="#"/>
					<input type="submit" value="선택삭제" />
				</td>
			</tr>


		</table>


	</form>

</div>






<!--==============================footer=================================-->

<footer>    
  <div class="container_12">
    <div class="grid_6 prefix_3">
      <a id="logo" href="mainboard.jsp" class="f_logo"><img src="images/logo.png" alt=""></a>
      <div class="copy">
      &copy; 2019 | <a href="#">YOLIJOLI_Recipe</a> <br> Website  by <a href="http://www.templatemonster.com/" rel="nofollow">KH_yolijoli</a>
      </div>
    </div>
  </div>
</footer>
     <script>
      $(document).ready(function(){ 
         $(".bt-menu-trigger").toggle( 
          function(){
            $('.bt-menu').addClass('bt-menu-open'); 
          }, 
          function(){
            $('.bt-menu').removeClass('bt-menu-open'); 
          } 
        ); 
      }) 
    </script>
</body>
</html>