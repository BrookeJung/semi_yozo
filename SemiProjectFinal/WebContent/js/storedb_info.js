$(function(){
	getJson();
})

function getJson(){
	
	$.getJSON("json/recipe_info.json",function(data){
		
		$("table").attr("border","1");
		
		$.each(data,function(key,val){
			



			
			if(key=="title"){
				//alert(Object.keys(val));
				$("thead").append(
					"<tr>"+
					"<th>"+val.RECIPE_ID+"</th>"+
					"<th>"+val.RECIPE_NM_KO+"</th>"+
					"<th>"+val.SUMRY+"</th>"+
					"<th>"+val.NATION_CODE+"</th>"+
					"<th>"+val.NATION_NM+"</th>"+
					"<th>"+val.TY_CODE+"</th>"+
					"<th>"+val.TY_NM+"</th>"+
					"<th>"+val.COOKING_TIME+"</th>"+
					"<th>"+val.CALORIE+"</th>"+
					"<th>"+val.QNT+"</th>"+
					"<th>"+val.LEVEL_NM+"</th>"+
					"<th>"+val.IRDNT_CODE+"</th>"+
					"<th>"+val.IMG_URL+"</th>"+
					"<th>"+val.DET_URL+"</th>"+
					
					"</tr>"
				);
				
				
				
			}else if(key=="data"){
				var list=val;
				for(var i=0;i<list.length;i++){
					
					var str=list[i];
					$("tbody").append(
							"<tr>"+
							"<th>"+str.RECIPE_ID+"</th>"+
							"<th>"+str.RECIPE_NM_KO+"</th>"+
							"<th>"+str.SUMRY+"</th>"+
							"<th>"+str.NATION_CODE+"</th>"+
							"<th>"+str.NATION_NM+"</th>"+
							"<th>"+str.TY_CODE+"</th>"+
							"<th>"+str.TY_NM+"</th>"+
							"<th>"+str.COOKING_TIME+"</th>"+
							"<th>"+str.CALORIE+"</th>"+
							"<th>"+str.QNT+"</th>"+
							"<th>"+str.LEVEL_NM+"</th>"+
							"<th>"+str.IRDNT_CODE+"</th>"+
							"<th>"+str.IMG_URL+"</th>"+
							"<th>"+str.DET_URL+"</th>"+
							"<input type='hidden' name='recipe' value='"+str.RECIPE_ID+"※"+str.RECIPE_NM_KO+"※"+str.SUMRY+"※"+str.NATION_CODE+"※"+str.NATION_NM+"※"+
							str.TY_CODE+"※"+str.TY_NM+"※"+str.COOKING_TIME+"※"+str.CALORIE+"※"+str.QNT+"※"+str.LEVEL_NM+"※"+str.IRDNT_CODE+"※"+str.IMG_URL+"※"+str.DET_URL+"'>"+
							
							"</tr>"
							
					);
					
				}
				
				
			}
			
		});

	});

	
}