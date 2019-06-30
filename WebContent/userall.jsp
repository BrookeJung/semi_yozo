<%@page import="com.user_login.dto.LoginDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>
<style type="text/css">

</style>
<%@ include file="./header.jsp"%>
</head>
<body class="page1">

<div class="content" style="padding-left: 5%; padding-right: 30%; width: 100%;">
   <br/><br/>
   <span style="font-size: 2.7em; float:left; font-family: '야놀자 야체','YanoljaYacheR'">회원정보 전체조회</span>
   <p></p><br/><br/>
      <input type="hidden" name="command" value="userall" />
   <table border="1" style="font-family: '야놀자 야체','YanoljaYacheR'">
      <col width="50" />
      <col width="100" />
      <col width="100" />
      <col width="100" />
      <col width="150" />
      <col width="200" />
      <col width="400" />
      <col width="100" />
      <col width="50" />
      <tr align="center" style="background-color: #ffe3d5; color:#db5e49;">
         <th>번호</th>
         <th>이름</th>
         <th>아이디</th>
         <th>비밀번호</th>
         <th>전화번호</th>
         <th>이메일</th>
         <th>주소</th>
         <th>가입여부</th>
         <th>등급</th>
      </tr>

   <c:forEach items="${list }" var="dto">
         <tr align="center">
            <td>${dto.userseq }</td> 
            <td>${dto.name }</td>
            <td>${dto.id }</td>
            <td>${dto.pw}</td>
            <td>${dto.phone }</td>
            <td>${dto.email }</td>
            <td>${dto.addr }</td>
            <td>${dto.enabled }</td>
            <td>${dto.role }</td>
         </tr>   
   </c:forEach>


   <tr>
      <td colspan="9">
      <p></p>
         <input type="button" value="메인" style="font-family: '야놀자 야체','YanoljaYacheR'"; onclick="location.href='adminmain.jsp'"/>
      </td>
   </tr>
</table>
</div>
<%@ include file="./footer.jsp" %> 
</body>
</html>