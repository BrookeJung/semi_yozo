<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">


<meta data-react-helmet="true" charset="utf-8" />
<meta data-react-helmet="true" name="keywords"
   content="����IDE, goormIDE, goorm ide, �ڵ�, ������, IDE, ��ũ�����̽�, ��Ŀ, docker, integrated development environment, cloud ide, cloud development environment, cloud editor, web based ide, aws" />
<meta data-react-helmet="true" name="description"
   content="������ Ŭ���� ����� �̿��Ͽ� ������ �ڵ��� ����, �Ƿ��� ���ϰ�, ����Ʈ��� ������ �� �ִ� Ŭ���� ����Ʈ���� ���°��Դϴ�." />

<meta data-react-helmet="true" name="msapplication-TileColor"
   content="#da532c" />
<meta data-react-helmet="true" name="theme-color" content="#ffffff" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link data-react-helmet="true" rel="canonical"
   href="https://accounts.goorm.io" />
<link data-react-helmet="true" rel="apple-touch-icon" sizes="180x180"
   href="/apple-touch-icon.png" />
<link data-react-helmet="true" rel="icon" type="image/png" sizes="32x32"
   href="/favicon-32x32.png" />
<link data-react-helmet="true" rel="icon" type="image/png" sizes="16x16"
   href="/favicon-16x16.png" />
<link data-react-helmet="true" rel="manifest" href="/site.webmanifest" />
<link data-react-helmet="true" rel="mask-icon"
   href="/safari-pinned-tab.svg" color="#5bbad5" />
<title data-react-helmet="true">Mypage</title>


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
<style type="text/css">
   input[type=button]{
   width:50px;
     background-color: #db5e49;
  border: none;
  color: #ffe3d5;
  padding: 5%;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
font-family: '�߳��� ��ü','YanoljaYacheR' ;
font-size: 15pt;
   }
   
   table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  tr {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  th{
     background-color: #ffe3d5;
     color: #db5e49; 
     font-family: '�߳��� ��ü','YanoljaYacheR' ;
     padding: 5px;
  }

</style>
<title>����������</title>
<%@ include file="./header.jsp" %>  
</head>
<body class="page1">

<div style="background-color: white; width: 100%; height: 100%; padding: 3%;"></div>

   <div class="content">
      <br />
      <div>
         <h1 id="mypage" style="color: #db5e49; font-family: '�߳��� ��ü','YanoljaYacheR' ; font-size: 30pt; text-align: center;" >���� ������</h1>
      </div>

      <table id="list" style="margin: auto;">

         <tr >
            <th>�� ��� ����</th>
            <td><input type="button" value="Ȯ��" onclick="location.href='zzimController.do?command=zzimList'" /></td>
         </tr>
         <tr>
            <th>�� ���� ����</th>
            <td><input type="button" value="Ȯ��" onclick="location.href='logincontroller.do?command=userupdateform'" /></td>
         </tr>
         <tr>
            <th>���� ���</th>
            <td><input type="button" value="Ȯ��" onclick="location.href='paycontroller.do?command=payList'" /></td>
         </tr>
         <tr>
            <th>���� �� ������</th>
            <td><input type="button" value="Ȯ��" onclick="location.href='RecipeController.do?command=myrecipelist&contentnum=3&pagenum=1'" /></td>
         </tr>
         <tr>
            <th>ȸ�� Ż��</th>
            <td><input type="button" value="Ȯ��" onclick="location.href='logincontroller.do?command=delete'" /></td>

         </tr>
      </table>
      
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

<%@ include file="./footer.jsp" %>

</body>
</html>