
package com.recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.recipe_info.dao.RecipeInfoDao;
import com.recipe_info.dto.RecipeInfoDto;
import com.recipe_material.dao.RecipeMaterialDao;
import com.recipe_material.dto.RecipeMaterialDto;
import com.recipe_process.dao.RecipeProcessDao;
import com.recipe_process.dto.RecipeProcessDto;
import com.user_login.dto.LoginDto;


@WebServlet("/AddRecipeController.do")

public class AddRecipeController extends HttpServlet {
	
       
    
    public AddRecipeController() {
        super();
       
    }

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    LoginDto ldto = (LoginDto)request.getSession().getAttribute("ldto"); 
	
	    //경로확인용
		String path = request.getSession().getServletContext().getRealPath("/uploadimage");
		
    	
  	  	MultipartRequest multi = new MultipartRequest(request, path,300000000,"UTF-8");
		String command=multi.getParameter("command");
		System.out.println("<" + command + ">");
		
		if(command.equals("adduserrecipe")) {
	 
	    	String recipe_nm_ko=multi.getParameter("recipe_nm_ko");
	  	    String sumry = multi.getParameter("sumry");
	  	    String nation_nm = multi.getParameter("nation_nm");
	  	    String ty_nm = multi.getParameter("ty_nm");
	  	    String cooking_time = multi.getParameter("cooking_time");
	  	    String[] material=multi.getParameterValues("material");
	  	    String[] cooking_no=multi.getParameterValues("cooking_no");//과정
	  	   
	  	    String content = multi.getParameter("content");
	  	  
	  	    

	  	    
	  	    
	  	    int cooking_time_select =0;
	  	   
	  	    if(cooking_time.equals("0~30분")) {
	  	    	cooking_time_select=30;
	  	    }else if(cooking_time.equals("30분~60분")){
	  	    	cooking_time_select=60;
	  	    }else if(cooking_time.equals("60분~120분")){
	  	    	cooking_time_select=120;
	  	    }else if(cooking_time.equals("120분~200분")){
	  	    	cooking_time_select=195;
	  	    }
	  	   
	  	    
	  	    //재료가 저장됨
	  	   RecipeInfoDto dto=new RecipeInfoDto(0,recipe_nm_ko,sumry,0,nation_nm,0,ty_nm,cooking_time_select,null,null,null,null,content,null,0,ldto.getId());
	  	   RecipeInfoDao dao=new RecipeInfoDao();
	  	   dao.insertrecipe(dto);
	  	  
	  	    
	  	    
	  	    
	  	  for(int i=0; i < material.length; i++) {
	  		
	           RecipeMaterialDto Mdto= new RecipeMaterialDto(0, 0, material[i], null, null, null,0);
	          
	           RecipeMaterialDao Mdao = new RecipeMaterialDao();
	           Mdao.insertMaterial(Mdto);
	          
	           
	           }
	  	   for(int i=0;i<cooking_no.length;i++) {
	  		 RecipeProcessDto pdto=new RecipeProcessDto(0, i+1, cooking_no[i], null, null,ldto.getId());
	  		
	  		 	RecipeProcessDao pdao=new RecipeProcessDao();
	  		 	pdao.insertProcess(pdto);
	  		 	
	  	   }

	  	   System.out.println("왔니?");
	  	   
	  	   dispatch(request, response, "index.jsp");//걸로가자
		    		
	       }
		
	}

	
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
