<%@page import="com.user_login.dto.LoginDto"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.user_login.biz.LoginBiz" %>    
<%@ page import="com.user_login.dto.LoginDto" %>     

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>   
<!DOCTYPE html>
<html lang="utf-8">
<head> 
<title>글 작성</title>
<meta charset="utf-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css" >
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
   rel="stylesheet">
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
   src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>


<link
   href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
   rel="stylesheet">
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="dist/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
   jQuery.noConflict();
  
   jQuery(document).ready(function() {
      $('#summernote').summernote({
            height : 200

         });
      
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
 
   function captureReturnKey(e) {

       if (e.keyCode == 13 && e.srcElement.type != 'textarea')
          return false;
    }
   $(function() {
    //재료추가 버튼 누르면 div에 재료 출력됨 출력되면서 db에 저장할 값을 넘겨주기위해  값들이 모두 input hidden으로 name은같고 각각value생성됨 
          $('#addMaterial')
          .click(
                  function() {
                     var material = $('#datalist').val();
                     var nothingtext = document.getElementById("datalist").value;
                     if (nothingtext == null || nothingtext == "") {
                        alert("재료를 넣어주세요!!");
                        
                        
                        return false;
                     }
                         $('#result')
                               .append(
                                     "<div id='insertmaterials' name='fornull'><input type='checkbox' name='chk' checked='checked' onclick='allcancel();'/>"
                                           + material
                                           + "<input type='hidden' name='material' value ='"+material+"'/></div>");

                      });

       });

      
    //  과정추가  클릭시 체크박스랑 텍스트창이 나온다
       $(function() {
          $('#uploadplus')
               .click(
                  function() {
                     var cooking_no = $('#cooking_no').val();
                     var nothingtext = document.getElementById("cooking_no").value;
                     if (nothingtext == null || nothingtext == "") {
                        alert("과정을 입력해주세요!!");
                        
                        
                        return false;
                     }
                     $('#result2')
                     .append(
                           "<div><input type='checkbox' name='chk2' checked='checked' onclick='allcancel2();'/>"
                           +"<input type='text' name='cooking_no' id='cooking_no' style='width: 350px;'/></div>");

                      });

       });

       //첵박   재료 부분에 삭제 체크박스 chk , all , allcancel()
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
          $("input[name=chk]:checked").parent().remove();

       }
       
       //첵박   과정 부분에 삭제 체크박스 chk2 , all2 , allcancel2()
       function allChk2(bool) {
          $("input[name=chk2]").each(function() {
             $(this).prop("checked", bool);
          });
       }
       
       function allcancel2() {

          if ($("input[name=chk2]").length == $("input[name=chk2]:checked").length) { //기존 chk와 체크된 chk의 길이가 같은 경우
             // 전부 다 체크되어 있을 경우
                
             $("input[name=all2]").prop("checked", true);
          
          } else {

             $("input[name=all2]").prop("checked", false);
          }
       }
       
       function chkdelete2() {
          $("input[name=chk2]:checked").parent().remove();

       }
          
       function nullcheck() {
          
               var nullcheck =  $("input[type=text]").val();
            
             if (nullcheck == null || nullcheck == "") {
                alert("내용을 모두 입력해주세요.");

                return false;
             }
             return true;

          }
</script>

<style type="text/css">
#c1 {
   width: 100%;
   height: 100%;
}

table {
   word-break: break-all;
   table-layout: fixed;
   width: 100%;
   border-top: 1px solid #444444;
   border-collapse: collapse;
   height: 100%;
   padding: 5%;
}

tr {
   height: 100%;
   width: 100%;
   border-width: 100%; /* --border의 width 값을 지정 */
   border-style: solid; /* border의 style 값을 지정 */
   border-color: black; /* border의 color 값을 지정 */
   border: initial;
   vertical-align: initial;
   border-bottom: 1px solid #444444;
   
}

th {
   width: 100%;
   height: 100%;
   display: block;
   background-color: #ffe3d5;
   padding: 2%;
   color: #db5e49; 
   font-family: 야놀자 야체;
   
}

td {
   width: 100%;
   vertical-align: baseline;
   padding-left: 20px;
}
input[type=button], input[type=submit], input[type=reset] {
   background-color: #db5e49;
  border: none;
  color: #ffe3d5;
  padding: 1%;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
font-family: 야놀자 야체;
}
</style>

<%@ include file="./header.jsp" %>
</head>
<body class="page1" style="font-family: 야놀자 야체;">



   <div style="background-color: white; height: 100%; padding: 5%;">
   <h1 style="color: #db5e49; font-family: 야놀자 야체; font-size: 30pt; text-align: center;">레시피등록</h1>
       
      <form action="AddRecipeController.do" method="post" enctype="multipart/form-data" onsubmit="return nullcheck();">
         <input type="hidden" name="command" value="adduserrecipe" />
         <div id="c1" >  
         <table style="height: 200px; width: 600px; border: 1 soild balck; margin: auto;">

            <col width="20%">

            <tr>
               <th>요리 이름</th>
               <td><input type="text" name="recipe_nm_ko" style="width: 100%;" /></td>
            </tr>
   
            <tr>
               <th>간략 소개</th>
               <td><input type="text" name="sumry" style="width: 100%;" /></td>
            </tr>

            <tr>
               <th>유형 분류</th>
               <td><select name="nation_nm" style="width: 20%">
                     <option value="retry" selected="selected">음식유형</option>
                     <option value="서양">서양</option>
                     <option value=중국>중국</option>
                     <option value="한식">한식</option>
                     <option value="이탈리아">이탈리아</option>
                     <option value="동남아시아">동남아시아</option>
                     <option value="일본">일본</option>
                     <option value="퓨전">퓨전</option>
               </select></td>
            </tr>

            <tr>
               <th>음식분류</th>
               <td><select name="ty_nm" style="width: 20%">
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
               </select></td>
            </tr>

            <tr>
               <th>조리 시간</th>
               <td><select name="cooking_time" style="width: 20%">
                     <option value="retry" selected="selected">조리시간</option>
                     <option value="0~30분">0~30분</option>
                     <option value="30분~60분">30분~60분</option>
                     <option value="60분~120분">60분~120분</option>
                     <option value="120분~200분">120분~200분</option>
               </select></td>
            </tr>

            <tr>
               <th>재료</th>
               <td>
               <br/>
                  <div style="width: 100%;">
                    <input type="text" list="materiallist" id="datalist" name="datalist" onkeydown="return captureReturnKey(event)"
                          style="width: 60%;">
                     <input type="button" id="searchMaterial" value="재료검색" style="width: 18%;"> 
                     <input type="button" id="addMaterial" value="재료추가" onclick="return nothingtext();" style="width: 18%;">
                  </div> 
                  
                  <datalist id="materiallist">
                     <c:forEach items="${list }" var="dto">
                        <option value="${dto.irdnt_nm }">재료</option>
                     </c:forEach>
                  </datalist> 
                     <input type="button" name="delete" onclick="chkdelete();" id="" value="항목에서 빼기">
                  <div id="result">
                     <input type="checkbox" name="all" onclick="allChk(this.checked)" checked='checked' id="">전체선택 <br>
                  </div>





               </td>
            </tr>

            <tr>
               <th>과정</th>
               <td>
               <br/>
                 <div>
                     <input type="checkbox" name="all2" onclick="allChk2(this.checked)" checked='checked' id=""> 
                     <input type="text" name="cooking_no" id="cooking_no" style="width: 67%;"  onkeydown="return captureReturnKey(event)"/> 
                     <input type="button" id="uploadplus" value="과정 추가" style="width: 27%; height: 27px;" onclick="return nothingtext();"> 
                     <input type="button" id="uploadsubtract" onclick="chkdelete2();" value="과정 삭제">
                  </div>
                  
                  <div id="result2" style="width: 1500px;">
                      
                  </div>
                  
               </td>
            </tr>
            <tr>
            <th>내 용</th>
            <td><textarea rows="10" cols="30" id="summernote" name="content"></textarea></td>
            </tr>
            <tr>
               <th></th>
               <td colspan="4">
                  <input type="submit" value="작성" style="float: right;" /> 
                  <input type="reset" value="취소" onclick="history.back();" style="float: right; " />
               </td>
            </tr>
         </table>
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

</body>
<script type="text/javascript">
function logout() {
    alert("로그아웃 하시겠습니까?");
    location.href = "logincontroller.do?command=logout";
}
</script>
</html>
