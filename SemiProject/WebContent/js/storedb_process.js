$(function() {
	getJson();
});

function getJson() {

//	json 폴더 bike.jsom 파일을 함수로 호출
//	$.getJSON(url,callback) , 로드된 데이터를 처리한다. 콜백함수는 로드된 데이터를 인자로 넘겨받는다.(JSON 데이터를 참조하기 위해 data 변수를 사용하고 있다)
	$.getJSON("json/recipe_process.json", function(data) {

// table border = "1"
		$("table").attr("border", "1");

// data변수명에서 key값 value 값을 가져온다.		
		$.each(data, function(key, val) {
//					key 값이  DESCRIPTION
							if (key == "title") {

//					thead넣어줘서 생성
								$("thead").append(
										"<tr>" 	+ "<th>" + val.RECIPE_ID + "</th>" + "<th>"
												+ val.COOKING_NO + "</th>" + "<th>"
												+ val.COOKING_DC + "</th>" + "<th>"
												+ val.STRE_STEP_IMAGE_URL + "</th>" + "<th>"
												+ val.STEP_TIP + "</th>" + 
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
												"<td>"+str.COOKING_NO+"</td>"+
												"<td>"+str.COOKING_DC+"</td>"+
												"<td>"+str.STRE_STEP_IMAGE_URL+"</td>"+
												"<td>"+str.STEP_TIP+"</td>"+
												"<input type='hidden' name='recipe_process' value='"+
												str.RECIPE_ID+"※"+str.COOKING_NO+"※"+str.COOKING_DC+"※"+
												str.STRE_STEP_IMAGE_URL+"※"+str.STEP_TIP+"'>"+
												"</tr>"
												
									);
									
								}
								
								
							}

						});

					});

				}