<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 주소 입력받을 수 있는 daum api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	
	
	function idChk(){
		var doc = document.getElementsByName("id")[0];
		if(doc.value.trim()==""||doc.value==null){
			alert("아이드를 입력 해 주세요!");
		}else{
			open("logincontroller.do?command=idchk&id="+doc.value,"","width=200,height=200");
		
		}
	}
	
	function idChkConfirm(){//id중복체크가되지 않았을 때 중복 체크 해 달라고 alert띄우는 얘
		var chk = document.getElementsByName("id")[0].title; 
		if(chk === "n"){
			alert("아아디 중복체크를 확인 해 주세요.");
			document.getElementsByName("id")[0].focus();
		}
		
	}
	
	function isSame(){
		   var pw = document.getElementsByName("pw")[0].value;
		   var pw_chk = document.getElementsByName("pw_chk")[0].value;
		   if(pw.length<6 || pw.length>16){
		      alert("비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다");
		      return false;
		   }else if(pw_chk===""){
		      document.getElementById("same").innerHTML="";
		      return false;
		   }else if(pw !== pw_chk){
		      document.getElementById("same").innerHTML="비밀번호가 일치하지 않습니다";
		      document.getElementById("same").style.color="red";
		      return false;
		   }else if(pw === pw_chk){
		      document.getElementById("same").innerHTML="비밀번호가 일치합니다";
		      document.getElementById("same").style.color="blue";
		   }
		}
	
	function getParameterValues(){
		   var email = ($("#email").val());
		   return email;
		}
	
	$(function(){
		   $("#btn_chk").click(function(){ //버튼을 클릭하면 이function을 실행시키자
		      alert(getParameterValues());
		      $.ajax({
		         url:"mailController.do?command=mail&email="+encodeURIComponent(getParameterValues()),
		         type:'GET',
		         success:function(code){
		            alert(code+"인증메일이 발송되었습니다.");
		         },
		         error:function(){
		            alert("실패");
		         }
		      });
		   });
		});
	
</script>

</head>
<%

%>
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


					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</header>

	<!--==============================Content=================================-->
	<div style="border: 3px groove ; background-color: #e2d7d7; width: 700px; height: 600px; margin-left: auto; margin-right: auto;">
		<br /> <br />
		<p align="center" style="font-size: 25px; color: black;">회원가입</p>
		<form action="logincontroller.do" method="post" >
			<input type="hidden" name="command" value="joininsert"> <br />
			<div style=" width: 300px; height: 450px; margin:auto;"><!-- 회원가입 폼 -->
				
				<div style="width: 100%; height: 30px;">
					<input type="text" name="name" value="" placeholder="이름" required="required" style="width: 100%; height: 30px" >
				</div>
				<p>
				<div style="width: 100%; height: 30px;">
					<div>
						<input type="text" name="id" placeholder="ID" title="n" required="required"  style="width: 60%; height: 30px; float: left">
						<button type="button" onclick="idChk();" style="width: 35%; height: 37px; float: right; background-color: black; color: white;">중복확인</button>
					</div>
				</div>
				
				<p>
				<div >
					<input type="password" name="pw" placeholder="Password" required="required" onchange="isSame()"
						style="width: 100%; height: 30px;">
				</div>
				<p>
				<div>
					<input type="password" name="pw_chk" placeholder="Password 확인" required="required" onchange="isSame()"
						style="width: 100%; height: 30px;">
						<span id="same"></span>
				</div>
				<p>
				<div style="width: 100%; height: 30px;">
					<div>
						<input type="text" name="email" id="email" placeholder="이메일" required="required" style="width: 60%; height: 30px; float: left">
						<button type="button" id="btn_chk" style="width: 35%; height: 37px; float: right; background-color: black; color: white;">인증번호 발송</button>
					</div>
				</div>
				<p>
				<div align="center">
					<input type="text" name="email_chk" required="required" placeholder="인증번호 입력(유효시간 5분)"
						style="width:100%; height: 30px;">
				</div>
				<p>
				<div style="width: 100%; height: 70px;">
					
					<input type="text" name="addr" id="addr" placeholder="주소" style="width: 60%; height: 30px; float:left;"readonly="readonly" >
					<input type="button" id="set_addr" style="width: 35%; height: 37px; float: right; background-color: black; color: white;" onclick="setAddr()" value="주소입력">
               <!-- <input type="text" name="addr_detail" placeholder="도로명주소" style="width: 40%; height: 30px; float: left" readonly="readonly"> -->		
					<input type="text" id="detail_addr" name="detail_addr" placeholder="상세주소" style="width: 100%; height: 30px; float: left" >
				</div>
				<p></p>
				<div align="center">
					<input type="submit"
						style="width: 100%; height: 35px; background-color: black; color: white;"
						value="회원가입">
				</div>

			</div>
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
	
   <script>
   /* 주소창 */
   function setAddr(){
      new daum.Postcode({
           oncomplete: function(data) {
              var fullAddr = ""; //최종 주소 변수
              var extraAddr = ""; //조합형 주소 변수
              if(data.userSelectedType === 'R'){
                 //사용자가 도로명 주소를 선택했을 경우
                 fullAddr = data.roadAddress;
              }else {//사용자가 지번 주소를 선택했을 경우
                 fullAddr = data.jibunAddress;
              }
              
              //사용자가 선택한 주소가 도로명 타입일 때 조합한다.
              if(data.userSelectedType === 'R'){
                 //법정 동명이 있을 경우 추가한다.
                 if(data.bname !== ""){
                    extraAddr += data.bname
                 }//건물명이 있을 경우
                 if(data.buildingName !== ""){
                    extraAddr += (extraAddr !== '' ? ', ' +data.buildingName : data.buildingName);
                 }//조합형 주소의 유무에 따라 양쪽에 괄호를 추가해 최종 주소를 만든다.
                 fullAddr += (extraAddr !== '' ? ' ('+extraAddr+')':'');
              }
              
              document.getElementById("addr").value=fullAddr;
              document.getElementById("detail_addr").focus();
            
           }
       }).open();
   }
   </script>
</body>
</html>