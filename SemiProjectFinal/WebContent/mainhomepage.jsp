<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 메뉴 뜨길 원하는창은 모두 recommendrefrirecipe 로보내면 알아서 자세히보기 submit 버튼생기고 눌러도 알아서 과정 재료 출력됨 
setattribute 모두 recommendrecipe  이걸로 var=dto-->
<a href="RecipeController.do?command=start_info">레시피정보 DB저장방법</a>

<a href="RecipeController.do?command=start_material">레시피재료 DB저장방법</a>

<a href="RecipeController.do?command=start_process">레시피과정 DB저장방법</a>

<a href="RecipeController.do?command=allrecipe">모든레시피보기</a>







<form action="RecipeController.do"> <!-- 처음부터 id를 들고감(냉장고쪽은 아이디가 필요) -->
<input type="hidden" name="command" value="myrefrigerator">
<input type="hidden" name="fakeid" value="fake">
<input type="submit" value="냉장고에 재료 넣으로 가기">
</form>






<form action="RecipeController.do" method="POST">
<input type="hidden" name="command" value="categoryrecipe">

<div>


<select name="cookcountry" >

<option value="retry" selected="selected">음식유형</option>
    <option value="서양">서양</option>
    <option value=중국>중국</option>
    <option value="한식">한식</option>
    <option value="이탈리아">이탈리아</option>
    <option value="동남아시아">동남아시아</option>
    <option value="일본">일본</option>
    <option value="퓨전">퓨전</option>
</select>

<select name="cooktype">
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

</select>
<select name="cooktime">
	<option value="retry" selected="selected">조리시간</option>
	<option value="0~30분">0~30분</option>
	<option value="30분~60분">30분~60분</option>
	<option value="60분~120">60분~120분</option>
	<option value="120분~200">120분~200분</option>
</select>
<input type="submit" value="추천받기">

	
</div>	
</form>













</body>
</html>