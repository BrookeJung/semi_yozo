<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>write</title>
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
</script>


<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="./js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->

<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {

				}
			},
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["ir1"].exec("PASTE_HTML",
						[ "기존 DB에 저장된 내용을 에디터에 적용할 문구" ]);
			},
			fCreator : "createSEditor2"
		});

		//저장버튼 클릭시 form 전송
		$("#save").click(function() {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
	});
</script>




</head>
<body class="page1">

	<!--==============================header=================================-->
	<header>
		<div class="container_12">
			<div class="grid_12">
				<div class="socials">
					<a id="log" href="login.html"><img alt="login"
						src="images/login.png"></a>
				</div>
				<h1>
					<a id="logo" href="mainboard.jsp"><img src="images/logo.png"
						alt="Boo House"></a>
				</h1>
				<div class="menu_block">


   <nav id="bt-menu" class="bt-menu">
        <a href="#" class="bt-menu-trigger"><span>Menu</span></a>
        <ul>
          <li class="current bt-icon "><a href="mainboard.jsp">Home</a></li>
         <li class="bt-icon"><a href="RecipeController.do?command=myrefrigerator&fakeid=fake">재료등록</a></li>
         <li class="bt-icon"><a href="RecipeController.do?command=allrecipe">레시피</a></li>
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
		<p
			style="color: black; font-size: 30pt; text-align: left; padding: 20px;">레시피
			작성</p>
		<form id="frm" action="insert.jsp" method="post">
			<table style="height: 300px; width: 20%;">
				
				<col width="20%">
	

				<tr>
					<th>제 목</th>
					<td><input type="text" id="title" name="title"
						style="width: 650px" /></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea rows="10" cols="30" id="ir1" name="content"
							style="width: 650px; height: 350px;"></textarea></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="4" >
						<input type="submit" value="작성" style="float: right;"/>
						<input type="button" value="취소" style="float: right;"/>
					</td>
				</tr>
				</table>
			
			
		</form>
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
</html>