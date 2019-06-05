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


@WebServlet("/RecipeController.do")
public class RecipeController extends HttpServlet {
	
      

	public RecipeController() {
    	
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    String command = request.getParameter("command");
	    System.out.println("<" + command + ">");
	    
	    
	    
	    
	    //레시피정보 테이블에 저장
	    if(command.equals("start_info")) {
	    	response.sendRedirect("recipe_info_store.jsp");
	    }//레시피 재료 테이블에 저장
	    else if(command.equals("start_material")) {
	    	response.sendRedirect("recipe_material_store.jsp");
	    }//본격저장(정보)
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
	    		dto.setCooking_time(recipe[7]);
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
	    }//본격저장(재료)
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
	    else if(command.equals("myrefrigerator")) {
	    	RecipeMaterialDao materialdao=new RecipeMaterialDao();
	    	List<RecipeMaterialDto> list=materialdao.selectList();
	    	request.setAttribute("list", list);
	    	dispatch(request, response,"myrefrigerator.jsp");
	    }else if(command.equals("insertrefrigerator")) {
	    	String[] material=request.getParameterValues("realvalue");
	    	for(int i=0;i<material.length;i++) {
	    		System.out.println(material[i]);
	    	}
	    	//선택된 값들 material에 들어가있음
	    	
	    	
	    	
	    }
	   
	    
	    
	    }
	    ///////////////////////////////////////////
	    	
	    	
	    
	

	
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
