$(function() {
	getJson();
});

function getJson() {

//	json 폴더 bike.jsom 파일을 함수로 호출
//	$.getJSON(url,callback) , 로드된 데이터를 처리한다. 콜백함수는 로드된 데이터를 인자로 넘겨받는다.(JSON 데이터를 참조하기 위해 data 변수를 사용하고 있다)
	$.getJSON("json/recipe_material.json", function(data) {

// table border = "1"
		$("table").attr("border", "1");

// data변수명에서 key값 value 값을 가져온다.		
		$.each(data, function(key, val) {
//					key 값이  DESCRIPTION
							if (key == "title") {

//					thead넣어줘서 생성
								$("thead").append(
										"<tr>" 	+ "<th>" + val.RECIPE_ID + "</th>" + "<th>"
												+ val.IRDNT_SN + "</th>" + "<th>"
												+ val.IRDNT_NM + "</th>" + "<th>"
												+ val.IRDNT_CPCTY + "</th>" + "<th>"
												+ val.IRDNT_TY_CODE + "</th>" + "<th>"
												+ val.IRDNT_TY_NM + "</th>" + 
										"</tr>"
											);

//					key값 데이터
							} else if(key == "data") {
							
								var list = val;
													
								for(var i = 0; i < list.length; i++){	
									var str = list[i];
									
									$("tbody").append(
											"<tr>"+
												"<td>"+str.RECIPE_ID+"</td>"+
												"<td>"+str.IRDNT_SN+"</td>"+
												"<td>"+str.IRDNT_NM+"</td>"+
												"<td>"+str.IRDNT_CPCTY+"</td>"+
												"<td>"+str.IRDNT_TY_CODE+"</td>"+
												"<td>"+str.IRDNT_TY_NM+"</td>"+
												"<input type='hidden' name='recipe_material' value='"+
												str.RECIPE_ID+"//"+str.IRDNT_SN+"//"+str.IRDNT_NM+"//"+
												str.IRDNT_CPCTY+"//"+str.IRDNT_TY_CODE+"//"+str.IRDNT_TY_NM+"'>"+
												"</tr>"
												
									);
									
								}
								
								
							}

						});

					});

				}