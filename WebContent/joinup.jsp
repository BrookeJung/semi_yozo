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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 주소 입력받을 수 있는 daum api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	var iSecond; //초단위로 환산
	var timerchecker = null;

	function fncClearTime() {
		iSecond = 300;
	}

	Lpad = function(str, len) {
		str = str + "";
		while (str.length < len) {
			str = "0" + str;
		}
		return str;
	}

	initTimer = function() {
		var timer = document.getElementById("timer");
		rHour = parseInt(iSecond / 3600);
		rHour = rHour % 60;

		rMinute = parseInt(iSecond / 60);
		rMinute = rMinute % 60;

		rSecond = iSecond % 60;

		if (iSecond > 0) {
			timer.innerHTML = "&nbsp;" + Lpad(rMinute, 2) + "분 "
					+ Lpad(rSecond, 2) + "초 ";
			iSecond--;
			timerchecker = setTimeout("initTimer()", 1000); // 1초 간격으로 체크
		} else {
			logoutUser();
		}
	}

	function refreshTimer() {
		var xhr = initAjax();
		//xhr.open("POST", "/jsp_std/kor/util/window_reload2.jsp", false);
		//xhr.send();
		fncClearTime();
	}

	function logoutUser() {
		clearTimeout(timerchecker);
		var xhr = initAjax();
		alert("인증시간이 만료되었습니다!")
		//xhr.open("POST", "/mail/user.public.do?method=logout", false);
		//xhr.send();
		location.reload();
	}

	function initAjax() { // 브라우저에 따른 AjaxObject 인스턴스 분기 처리
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		return xmlhttp;
	}

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

	var emailCode = "";
	function idChk() {
		var doc = document.getElementsByName("id")[0];
		if (doc.value.trim() == "" || doc.value == null) {
			alert("아이디를 입력 해 주세요!");
		} else {
			open("logincontroller.do?command=idchk&id=" + doc.value, "",
					"width=200,height=200");

		}
	}

	function idChkConfirm() {//id중복체크가되지 않았을 때 중복 체크 해 달라고 alert띄우는 얘
		var chk = document.getElementsByName("id")[0].title;
		if (chk === "n") {
			alert("아아디 중복체크를 확인 해 주세요.");
			document.getElementsByName("id")[0].focus();
		}

	}

	function isSame() {
		var pw = document.getElementsByName("pw")[0].value;
		var pw_chk = document.getElementsByName("pw_chk")[0].value;
		if (pw.length<6 || pw.length>16) {
			alert("비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다");
			return false;
		} else if (pw_chk === "") {
			document.getElementById("same").innerHTML = "";
			return false;
		} else if (pw !== pw_chk) {
			document.getElementById("same").innerHTML = "비밀번호가 일치하지 않습니다";
			document.getElementById("same").style.color = "red";
			return false;
		} else if (pw === pw_chk) {
			document.getElementById("same").innerHTML = "비밀번호가 일치합니다";
			document.getElementById("same").style.color = "blue";
		}
	}

	function getParameterValues() {
		var email = ($("#email").val());
		return email;
	}

	$(function() {
		$("#btn_chk").click(
				function() { //버튼을 클릭하면 이function을 실행시키자
					//alert(getParameterValues());

					$.ajax({
						url : "mailController.do?command=mail&email="
								+ encodeURIComponent(getParameterValues()),
						type : 'GET',
						success : function(code) {
							alert("인증메일이 발송되었습니다.");
							emailCode = code;
							fncClearTime();
							initTimer();

						},
						error : function() {
							alert("실패");
						}
					});
				});
	});
	function codeChk() {
		var doc = document.getElementsByName("email_chk")[0];
		if (doc.value.trim() == "" || doc.value == null) {
			alert("인증번호를 입력해 주세요");
		} else if (doc.value === emailCode) {
			document.getElementById("samesame").innerHTML = "인증번호가 일치합니다";
			document.getElementById("samesame").style.color = "blue";
			document.getElementsByName("doc")[0].value = true;
		} else if (doc.value !== emailCode) {
			document.getElementById("samesame").innerHTML = "인증번호가 일치하지 않습니다";
			document.getElementById("samesame").style.color = "red";
			document.getElementsByName("doc")[0].value = false;
		}
	}

	function checkPhone() {
		var regExp = '/^[0-9]*$/';
		var phone2 = document.getElementsByName("phone2")[0].value;
		var phone3 = document.getElementsByName("phone3")[0].value;

		if (phone2.length == 0 || phone2 == null) {
			alert("핸드폰 번호를 입력하세요!");
			return false;
		}

		if (phone3.length == 0 || phone3 == null) {
			alert("핸드폰 번호를 입력하세요!");
			return false;
		}

		if (!regExp.test(phone2) || !regExp.test(phone3)) {
			alert("핸드폰 번호는 숫자만 입력하세요!");
			return false;
		}

	}
</script>
<style type="text/css">
.e1 {
	width: 35%;
	height: 37px;
	float: right;
	color: #ffe3d5;;
	font-family: '야놀자 야체','YanoljaYacheR' ;
	background-color: #db5e49;
	border: none;
}

.e1:hover{
	background-color: #F5AD99;
}

</style>

<%@ include file="./header.jsp"%>
</head>
<%
	
%>
<body class="page1">
<div style="background: white; width: 100% ;height: 100%; text-align: left; padding: 5%;">

	<div
		style="border: 3px groove; background-color: #ffe3d5; width: 700px; height: 700px; margin-left:320px; margin-right: auto;">
		<br /> <br />
		<p align="center" style="
color: #db5e49; font-family: '야놀자 야체','YanoljaYacheR' ; font-size: 30pt;"
			>회원가입</p>
		<form action="logincontroller.do" method="post">
			<input type="hidden" name="command" value="joininsert"> <br />
			<div style="width: 300px; height: 470px; margin: auto;">
				<!-- 회원가입 폼 -->

				<div style="width: 100%; height: 30px;">
					<input type="text" name="name" value="" placeholder="이름"
						required="required" style="width: 99%; height: 30px">
				</div>
				<p>
				<div style="width: 100%; height: 30px;">
					<div>
						<input type="text" name="id" placeholder="ID" title="n"
							required="required" style="width: 60%; height: 30px; float: left">
						<button type="button" onclick="idChk();" class="e1"
							>중복확인</button>
					</div>
				</div>

				<p>
				<div>
					<input type="password" name="pw" placeholder="Password"
						required="required" onchange="isSame()"
						style="width: 99%; height: 30px;">
				</div>
				<p>
				<div>
					<input type="password" name="pw_chk" placeholder="Password 확인"
						required="required" onchange="isSame()"
						style="width: 99%; height: 30px;"> <span id="same"></span>
				</div>
				<p>
				<div onchange="checkPhone()" style="width: 100%; height: 30px;">
					<select name="phone1"
						style="width: 19%; height: 37px; float: left;">
						<option value="010">010</option>
						<option value="011">011</option>
					</select> &nbsp;&nbsp;-&nbsp; <input type="text" name="phone2" maxlength="4"
						style="width: 32%; height: 30px;"> &nbsp;-&nbsp; <input
						type="text" name="phone3" maxlength="4"
						style="width: 32%; height: 30px;">
				</div>
				<p>
				<div style="width: 100%; height: 30px;">
					<div>
						<input type="text" name="email" id="email" placeholder="이메일"
							required="required" style="width: 60%; height: 30px; float: left">
						<button type="button" id="btn_chk" class="e1"
							>인증번호
							발송</button>
					</div>
				</div>
				<p>
				<div align="center">
					<input type="text" name="email_chk" required="required"
						placeholder="인증번호 입력(유효시간 5분)" style="width: 99%; height: 30px;"
						onchange="return codeChk()"> <span id="samesame"></span>
						<input type="hidden" name="doc" value="">
					<table border="1">
						<tr>
							<td class="btn_bgtd_timeout" align="right"><script
									type="text/javascript" charset="utf-8"
									src="/js_std/kor/util/timeoutchk.js"></script> <span id="timer"></span>
								&nbsp; <a href="javascript:refreshTimer();"
								style="font-family: '야놀자 야체','YanoljaYacheR' ;">인증시간 연장</a> &nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
				</div>
				<p>
				<div style="width: 100%; height: 70px;">

					<input type="text" name="addr" id="addr" placeholder="주소"
						style="width: 60%; height: 30px; float: left;" readonly="readonly">
					<input type="button" id="set_addr" class="e1"
						onclick="setAddr()" value="주소입력">
					<!-- <input type="text" name="addr_detail" placeholder="도로명주소" style="width: 40%; height: 30px; float: left" readonly="readonly"> -->
					<input type="text" id="detail_addr" name="detail_addr"
						placeholder="상세주소" style="width: 98%; height: 30px;"> <input
						type="hidden" id="zonecode" name="zonecode" value="" />
				</div>
				<p></p>
				<div align="center">
					<input type="submit" class="e1" style="width: 100%;"
						value="회원가입">
				</div>

			</div>
		</form>
	</div>

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
		function setAddr() {
			new daum.Postcode({
				oncomplete : function(data) {
					var fullAddr = ""; //최종 주소 변수
					var extraAddr = ""; //조합형 주소 변수
					if (data.userSelectedType === 'R') {
						//사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;
					} else {//사용자가 지번 주소를 선택했을 경우
						fullAddr = data.jibunAddress;
					}

					//사용자가 선택한 주소가 도로명 타입일 때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정 동명이 있을 경우 추가한다.
						if (data.bname !== "") {
							extraAddr += data.bname
						}//건물명이 있을 경우
						if (data.buildingName !== "") {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}//조합형 주소의 유무에 따라 양쪽에 괄호를 추가해 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
								: '');
					}

					document.getElementById("addr").value = fullAddr;
					document.getElementById("zonecode").value = data.zonecode;
					document.getElementById("detail_addr").focus();

				}
			}).open();
		}
	</script>
</div>
	<%@ include file="./footer.jsp"%>
</body>
</html>