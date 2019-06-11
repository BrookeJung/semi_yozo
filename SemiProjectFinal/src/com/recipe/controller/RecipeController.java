package com.recipe.controller;

import java.io.IOException;			
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.recipe_info.dao.RecipeInfoDao;
import com.recipe_info.dto.RecipeInfoDto;
import com.recipe_material.dao.RecipeMaterialDao;

import com.recipe_material.dto.RecipeMaterialDto;
import com.recipe_process.dao.RecipeProcessDao;
import com.recipe_process.dto.RecipeProcessDto;
import com.refrigerator.dao.RefrigeratorDao;
import com.refrigerator.dto.RefrigeratorDto;


@WebServlet("/RecipeController.do")
public class RecipeController extends HttpServlet {
	
      

	public RecipeController() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    String command = request.getParameter("command");
	    //커맨드 체크용 추후 삭제
	    System.out.println("<" + command + ">");

	    //레시피정보 테이블에 저장
	    if(command.equals("start_info")) {
	    	response.sendRedirect("recipe_info_store.jsp");
	    }//레시피 재료 테이블에 저장
	    else if(command.equals("start_material")) {
	    	response.sendRedirect("recipe_material_store.jsp");
	    }//본격저장(레시피정보)
	    else if(command.equals("storedb_info")){
	    	RecipeInfoDao dao=new RecipeInfoDao();
	    	String[] recipeList=request.getParameterValues("recipe");
	    	List<RecipeInfoDto> list=new ArrayList<RecipeInfoDto>();
	    	for(int i=0;i<recipeList.length;i++) {
	    		System.out.println(recipeList[i]);
	    		String[] recipe=recipeList[i].split("※");
	    		RecipeInfoDto dto=new RecipeInfoDto();
	    		dto.setRecipe_id(Integer.parseInt(recipe[0]));
	    		dto.setRecipe_nm_ko(recipe[1]);
	    		dto.setSumry(recipe[2]);
	    		dto.setNation_code(Integer.parseInt(recipe[3]));
	    		dto.setNation_nm(recipe[4]);
	    		dto.setTy_code(Integer.parseInt(recipe[5]));
	    		dto.setTy_nm(recipe[6]);
	    		dto.setCooking_time(Integer.parseInt(recipe[7].substring(0, recipe[7].length()-1)));////
	    		dto.setCalorie(recipe[8]);
	    		dto.setQnt(recipe[9]);
	    		dto.setLevel_nm(recipe[10]);
	    		dto.setIrdnt_code(recipe[11]);
	    		dto.setImg_url(recipe[12]);
	    		dto.setDet_url(recipe[13]);
	    		
	    		list.add(dto);
	    	}
	    	int res=dao.insert(list);
	    	if(res==list.size()) {
	    		System.out.println("저장성공");
	    	}
	    	else {
	    		System.out.println("저장실패");
	    	}
			
	    	response.sendRedirect("mainhomepage.jsp");
	    }
	    //본격저장(재료)
	    else if(command.equals("storedb_material")){
			RecipeMaterialDao dao = new RecipeMaterialDao();
			String [] RecipeList = request.getParameterValues("recipe_material");
			List<RecipeMaterialDto> list = new ArrayList<RecipeMaterialDto>();			
			for(int i = 0; i < RecipeList.length; i++) {
				System.out.println(RecipeList[i]);
				String [] recipeMaterial = RecipeList[i].split("//");
				RecipeMaterialDto dto = new RecipeMaterialDto(
							Integer.parseInt(recipeMaterial[0]),Integer.parseInt(recipeMaterial[1]), 
											 recipeMaterial[2],recipeMaterial[3], 
											 recipeMaterial[4],recipeMaterial[5]);
				list.add(dto);
			}
			
			int res = dao.insert(list);
			
			if (res == list.size()) {
				System.out.println("저장 성공");
			} else {
				System.out.println("저장 실패");
			}
			
			response.sendRedirect("mainhomepage.jsp");

	    }
	    //레시피과정 저장
	    else if (command.equals("start_process")) {
			response.sendRedirect("recipe_process_store.jsp");
		}
	    //본격저장(레시피과정)
		else if (command.equals("storedb_process")) {

			RecipeProcessDao dao = new RecipeProcessDao();

			String[] RecipePList = request.getParameterValues("recipe_process");
			List<RecipeProcessDto> list = new ArrayList<RecipeProcessDto>();

			for (int i = 0; i < RecipePList.length; i++) {
				System.out.println(RecipePList[i]);

				String[] recipeProcess = RecipePList[i].split("※");

				RecipeProcessDto dto = new RecipeProcessDto(Integer.parseInt(recipeProcess[0]), Integer.parseInt(recipeProcess[1]),
						recipeProcess[2], recipeProcess[3], recipeProcess[4]);

				list.add(dto);
			}

			int res = dao.insert(list);

			if (res == list.size()) {
				System.out.println("저장 성공");
			} else {
				System.out.println("저장 실패");
			}

			response.sendRedirect("mainhomepage.jsp");

		}
	    
	    //냉장고에 재료넣기 
	    else if(command.equals("myrefrigerator")) {
	    	//mainhomepage로부터 온 id
	    	String id=request.getParameter("fakeid");//
	    	//myrefrigerator.jsp에 있는 데이터리스트 태그안에 들어갈 모든 재료를 생성하기 위함
	    	RecipeMaterialDao materialdao=new RecipeMaterialDao();
	    	List<RecipeMaterialDto> list=materialdao.selectList();
	    	
	    	//dispatch로 보낼 myrefrigerator.jsp 이곳에서 ${요기안에다 쓰려고} setattribute  
	    	request.setAttribute("list", list);

	    	dispatch(request, response,"myrefrigerator.jsp");
	    }
	    
	    //냉장고테이블에 사용자가 선택한 재료들 추가
	    else if(command.equals("insertmyrefrigeratordb")) {
	    	String[] material=request.getParameterValues("realvalue");//히든으로 넘어온  realvalue 배열로 받음
	    	String id=request.getParameter("fakeid");//히든으로 넘어온 id

	    	for(int i=0;i<material.length;i++){//sql문을 추가될 재료 갯수만큼 실행해야하기때문에 for문 이용
	    		RefrigeratorDto dto=new RefrigeratorDto(id,material[i]);//id-i번쨰 재료 이게 한줄 
	    		RefrigeratorDao dao=new RefrigeratorDao();
	    		dao.insertRefrigerator(dto);
	    	}
	    	//db저장완료
	    	
	    	//냉장고재료보여주기
	    		RefrigeratorDao myrefrigeratordao=new RefrigeratorDao();
		    	List<RefrigeratorDto> myrefrigerator=myrefrigeratordao.selectRefrigeratorList(id);//위에서 받아온 id 파라미터로 던짐
		    	request.setAttribute("myrefrigerator", myrefrigerator);
	    
	    	
	    	dispatch(request, response,"myrefrigeratorlist.jsp");
	    	
	    	
	    }else if(command.equals("recommend_refri_recipe")) {
	    	String id=request.getParameter("fakeid");//히든아이디 또받고
	    	RecipeInfoDao infodao=new RecipeInfoDao();
	    	List<RecipeInfoDto> recommendrecipe=infodao.selectRecommend(id);//아이디보내주고,요리3가지 보여주기
	    	request.setAttribute("recommendrecipe", recommendrecipe);//속성 set하고
	    	
	    	dispatch(request, response,"recommendrefrirecipe.jsp");
	    	
	    }else if(command.equals("recommenddetail")) {
	    	
	    	int recipe_id=Integer.parseInt(request.getParameter("recommendrecipeid"));//해당recipe_id의 정보, 재료, 과정을 보기위해서 받아와서 던져줌 
	    	RecipeProcessDao processdao=new RecipeProcessDao();
	    	List<RecipeProcessDto> processlist=processdao.selectprocessview(recipe_id); 
	    	
	    	RecipeMaterialDao materialdao=new RecipeMaterialDao();
	    	List<RecipeMaterialDto> materiallist=materialdao.selectmaterialview(recipe_id);
	    	
	    	RecipeInfoDao infodao=new RecipeInfoDao();
	    	RecipeInfoDto infolist=infodao.selectrecipeview(recipe_id);//한줄만 출력되기떄문에 List가 아니라 그냥 객체
	    	
	    	request.setAttribute("infolist", infolist);
	    	request.setAttribute("materiallist", materiallist);
	    	request.setAttribute("processlist", processlist);
	    	
	    	dispatch(request, response, "recommenddetail.jsp");
	    	
	    	
	    }else if(command.equals("categoryrecipe")) {
	    	String[] nation_nm=request.getParameterValues("cookcountry");
	    	String[] ty_nm=request.getParameterValues("cooktype");
	    	String[] cooking_time=request.getParameterValues("cooktime");
	    	
	    	
	    	
	    	
	    	RecipeInfoDao infodao=new RecipeInfoDao();
	    	List<RecipeInfoDto> recommendrecipe=infodao.selectcategory(nation_nm,ty_nm,cooking_time);
	    	request.setAttribute("recommendrecipe",recommendrecipe );
	    	dispatch(request, response, "recommendrefrirecipe.jsp");
	    }else if(command.equals("allrecipe")) {
	    	
	    	RecipeInfoDao infodao=new RecipeInfoDao();
	    	List<RecipeInfoDto> recommendrecipe=infodao.allrecipe();//아이디보내주고,요리3가지 보여주기
	    	request.setAttribute("recommendrecipe", recommendrecipe);//속성 set하고
	    	
	    	dispatch(request, response,"recommendrefrirecipe.jsp");
	    } else if(command.equals("recommend_refri_recipe_delete")) {
            String id=request.getParameter("fakeid"); // location.href 통해서 값을 전달
         
            // fake값 삭제
            RefrigeratorDao dao=new RefrigeratorDao();
            dao.delete(id);
            
            dispatch(request, response, "myrefrigerator.jsp");
     }  else if(command.equals("reciperesearch")) {
         String recipe_nm_ko = request.getParameter("recipe_nm_ko_search");//히든아이디 또받
         System.out.println(recipe_nm_ko);
         RecipeInfoDao infodao=new RecipeInfoDao();
         
         List <RecipeInfoDto> recommendrecipe = infodao.selectLikeFood(recipe_nm_ko);
         request.setAttribute("recommendrecipe", recommendrecipe);
         
         dispatch(request, response, "recommendrefrirecipe.jsp");
      }
	}
	    
	    
	    
	    
	    
	    
	    
//	   
	    	
	    	
	    
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}
	public void dispatch(HttpServletRequest request,HttpServletResponse response,String url) throws ServletException, IOException {
		
		RequestDispatcher dispatch=request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	public void jsResponse(String msg,String url,HttpServletResponse response) throws IOException {
		String res = "<script type='text/javascript'>" + " alert('"+msg+"');" + " location.href='" + url + "';" + "</script>"; 
		PrintWriter out=response.getWriter();
		out.println(res);
		
	}

}
