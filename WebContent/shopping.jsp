<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html;charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.refrigerator.dto.RefrigeratorDto"%>
<%@page import="com.recipe_material.dto.RecipeMaterialDto"%>
<%
   RefrigeratorDto re_dto = new RefrigeratorDto();
%>
<%
   RecipeMaterialDto ma_dto = new RecipeMaterialDto();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
   //첵박 
   function allChk(bool) {
      $("input[name=chk]").each(function() {
         $(this).prop("checked", bool);
      });
   }
   function allcancel() {

      if ($("input[name=chk]").length == $("input[name=chk]:checked").length) { //기존 chk와 체크된 chk의 길이가 같은 경우
         // 전부 다 체크되어 있을 경우
         $("input[name=all]").prop("checked", true);
      } else {
         $("input[name=all]").prop("checked", false);
      }
   }
   function chkdelete() {
      $("input[name=chk]:checked").parent().parent().remove();
      
   }

   // 엔터금지
   function captureReturnKey(e) {

      if (e.keyCode == 13 && e.srcElement.type != 'textarea')
         return false;
   }
   
   function getParameterValues() {
      var payment = ($("#payment").val());
      return payment;
   }

</script>
<style type="text/css">
table {
   width: 100%;
   border-top: 1px solid #444444;
   border-collapse: collapse;
}

th, td {
   border-bottom: 1px solid #444444;
   padding: 10px;
}

tr {
   border-bottom: 1px solid #444444;
   padding: 10px;
}
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
<meta charset="utf-8">
<title>쇼핑</title>

<link href="css/kakaomap.css" rel="stylesheet" type="text/css">
<%@ include file="./header.jsp"%>
</head>
<body>
   <div
      style="background-color: white; width: 100%; height: 100%; padding: 3%; overflow: auto; min-height: 1000px; max-height: 2000px;">
      <br />
      <br />
      <br />
      <h1
         style="font-size: 30pt; color: black; text-align: left; padding-left: 3%; color: #db5e49; font-family: '야놀자 야체','YanoljaYacheR' ;">구매하기</h1>
      <div class="map_wrap">
         <div id="map"
            style="width: 60%; height: 500px; position: relative; overflow: hidden;"></div>

         <div id="menu_wrap" class="bg_white" style="margin-left: 60%;">
            <div class="option">
               <div>
                  <form onsubmit="searchPlaces(); return false;">
                     키워드 : <input type="text" value="${ldto.addr } 마트" id="keyword"
                        size="15">
                     <button type="submit">검색하기</button>
                  </form>
               </div>
            </div>
            <hr>
            <ul id="placesList"></ul>
            <div id="pagination"></div>
         </div>
      </div>
      <div style="width: 45%; float: left; padding: 3%;">
         <table border="1">
            <col width="100px;">
            <col width="300px;">
            <col width="100px;">
            <tr>
               <td style="background-color: #ffe3d5;"><input type="checkbox"
                  name="all" onclick="allChk(this.checked)" id="">전체선택</td>
               <td style="background-color: #ffe3d5;">구매 할 물품</td>
               <th style="background-color: #ffe3d5;">가격</th>

            </tr>

            <c:forEach items="${ordermaterial }" var="dto" varStatus="status">
               <!-- setattribute한거 -->

               <tr>
                  <td><input type='checkbox' name='chk' onclick='allcancel();' /></td>
                  <td id="bag" class="b">${dto.irdnt_nm }</td>
                  <th>${dto.price }</th>
                  <c:set var="count" value="${count + 1}" />
               </tr>
            </c:forEach>

         </table>
         <input type="button" name="delete" onclick="chkdelete();" id=""
            value="삭제"
            style="background-color: #ffe3d5; border: none; color: black; padding: 1%; text-decoration: none; margin: 4px 2px; cursor: pointer; border-radius: 30%;">
         <%-- <div>총 가격:${count }</div> --%>
         <img alt="" src="image/kakaopay_btn.png" id="pay"
            style="width: 50px; padding-left: 280px;">
      </div>
      <!--  <input type="button" id="pay" value="결제시스템입니다." > -->


      <input type="hidden" id="id" name="id" value="${ldto.id }" /> <input
         type="hidden" id="name" name="name" value="${ldto.name }" /> <input
         type="hidden" id="email" name="email" value="${ldto.email }" /> <input
         type="hidden" id="phone" name="phone" value="${ldto.phone }" /> <input
         type="hidden" id="addr" name="addr" value="${ldto.addr }" /> <input
         type="hidden" id="zonecode" name="zonecode" value="${ldto.zonecode }" />
      <br />
      <br />
      <br />

   </div>

   <script>
       var id = document.getElementById("id").value;
      var email = document.getElementById("email").value;
      var name = document.getElementById("name").value;
      var phone = document.getElementById("phone").value;
      var addr = document.getElementById("addr").value;
      var count = $("input:checkbox[name=chk]").length;
      var amount = (count * 1000);
      
      var IMP = window.IMP;
      IMP.init('imp73078058');
      
      
      $("#pay").click(function() {
        
               IMP.request_pay({
                     pg : 'kakaopay',
                     pay_method : 'card',
                     merchant_uid : new Date().getTime(),
                     name : '장바구니',
                     amount : amount,
                     buyer_email : email,
                     buyer_name : name,
                     buyer_tel : phone,
                     buyer_addr : addr,
                     buyer_postcode : zonecode
                     /*m_redirect_url : 'https://www.yourdomain.com/payments/complete'*/
                  }, function(rsp) {
                     if ( rsp.success ) {
                          //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                          jQuery.ajax({
                              url: "paycontroller.do?command=payment", //cross-domain error가 발생하지 않도록 주의해주세요
                              type: 'POST',
                              dataType: 'text',
                              data: {
                                  "merchant_uid" : rsp.merchant_uid,   //date값
                                  "id" : id,
                            "place" : addr,
                            "amount" : amount
                            
                                  //기타 필요한 데이터가 있으면 추가 전달
                              }
                          }).done(function(data) {
                              //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                              if ( everythings_fine ) {
                                  msg = '결제가 완료되었습니다.';
                                  msg += '\n고유ID : ' + rsp.imp_uid;
                                  msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                                  msg += '\결제 금액 : ' + rsp.paid_amount;
                                  msg += '카드 승인번호 : ' + rsp.apply_num;
                                  
                                  alert(msg);
                              } else {
                                  //[3] 아직 제대로 결제가 되지 않았습니다.
                                  //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                              }
                          });
                          //성공시 이동할 페이지
                          alert("결제에 성공하였습니다!");
                          location.href='http://localhost:8787/yolijoli/RecipeController.do?command=allrecipe&pagenum=1&contentnum=9';
                      } else {
                          msg = '결제에 실패하였습니다.';
                          msg += '에러내용 : ' + rsp.error_msg;
                          //실패시 이동할 페이지
                          location.href="javascript:history.back();";
                                       alert(msg);
                                    }
                                 });

                  });//
      /*       
         },
         error : function() {
            alert("실패");
         }
      }); */
   </script>

   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33252633bc0ae68bd46f408c05f09f42&libraries=services"></script>
   <script type="text/javascript" src="js/kakaomap.js"></script>
   <%@ include file="./footer.jsp"%>
</body>
</html>