<%@page import="com.user_login.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>insert</title>
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
   width: 100%;
   height: 37px;
   float: right;
   color: #ffe3d5;;
   font-family: 야놀자 야체;
   background-color: #db5e49;
   border: none;
}

.e1:hover{
   background-color: #F5AD99;
}
.e2 {
   width: 35%;
   height: 35px;
   float: right;
   color: #ffe3d5;;
   font-family: 야놀자 야체;
   background-color: #db5e49;
   border: none;
}

.e2:hover{
   background-color: #F5AD99;
}
input[type=submit],input[type=button] {
	 background-color: #ffe3d5;
  border: none;
  color: #db5e49;
  padding: 1%;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
	
}

</style>
<%@ include file="./header.jsp"%>
</head>
<body class="page1" style="font-family: '야놀자 야체','YanoljaYacheR' ;">



   <!--==============================Content=================================-->

   <div
      style="border: 3px groove; background-color: #ffe3d5; width: 700px; height: 570px; margin-left: auto; margin-right: auto;">
      <br /> <br />
      <p align="center" style="font-size: 25px; color: black;">내 정보 수정하기</p>
      <form action="logincontroller.do" method="post">
         <input type="hidden" name="command" value="userupdate">
         <input type="hidden" name="userseq" value="${ldto.userseq }">

         <br />
         <div style="width: 300px; height: 400px; margin: auto;">
            <!-- 내 정보 수정 폼 -->

            <div style="width: 100%; height: 30px;">
               <input type="text" value="${ldto.name }" readonly="readonly"
                  style="width: 100%; height: 30px;">
            </div>
            <p>
            <div style="width: 100%; height: 30px;">
               <input type="text" value="${ldto.id }" readonly="readonly"
                  style="width: 100%; height: 30px;">
            </div>
            <p>
            <div>
               <input type="password" name="pw" id="pw" placeholder="Password"
                  required="required" onchange="isSame()"
                  style="width: 100%; height: 30px;">
            </div>
            <p>
            <div>
               <input type="password" name="pw_chk" id="pw_chk"
                  placeholder="Password 확인" required="required" onchange="isSame()"
                  style="width: 100%; height: 30px;">
               <span id="same"></span>
            </div>
            <p>
            <div onchange="checkPhone()" style="width: 100%; height: 30px;">
               <select name="phone1"
                  style="width: 18%; height: 35px; float: left;">
                  <option value="010">010</option>
                  <option value="011">011</option>
               </select> &nbsp;&nbsp;-&nbsp; <input type="text" name="phone2" maxlength="4"
                  style="width: 31%; height: 28px;"> &nbsp;-&nbsp; <input
                  type="text" name="phone3" maxlength="4"
                  style="width: 31%; height: 28px;">
            </div>
            <p>
            <div style="width: 100%; height: 30px;">
               <input type="text" value="${ldto.email }" readonly="readonly"
                  style="width: 100%; height: 30px;">
            </div>
            <p>
            <div style="width: 100%; height: 70px;">

               <input type="text" name="addr" id="addr" placeholder="주소"
                  style="width: 60%; height: 30px; float: left;" readonly="readonly">
               <input type="button" id="set_addr" class="e2"
                  onclick="setAddr()" value="주소입력">
               <!-- <input type="text" name="addr_detail" placeholder="도로명주소" style="width: 40%; height: 30px; float: left" readonly="readonly"> -->
               <input type="text" id="detail_addr" name="detail_addr"
                  placeholder="상세주소" style="width: 100%; height: 28px;"> <input
                  type="hidden" id="zonecode" name="zonecode" value="" />
            </div>
            <p>
            <div align="center">
               <input type="submit" class="e1" value="내 정보 수정">
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
   <%@ include file="./footer.jsp"%>
</body>
</html>