package com.zzim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.recipe_info.dao.RecipeInfoDao;
import com.recipe_info.dto.RecipeInfoDto;
import com.recipe_material.dao.RecipeMaterialDao;
import com.recipe_material.dto.RecipeMaterialDto;
import com.recipe_process.dao.RecipeProcessDao;
import com.recipe_process.dto.RecipeProcessDto;
import com.user_login.dto.LoginDto;
import com.zzim.biz.ZzimBiz;
import com.zzim.dto.ZzimDto;


@WebServlet("/zzimController.do")
public class ZzimController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ZzimController() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    String command = request.getParameter("command");
	    System.out.println("<" + command + ">");
	    ZzimBiz biz = new ZzimBiz();
	   if(command.equals("zzimInsert")) {
		   
		   LoginDto ldto = (LoginDto) request.getSession().getAttribute("ldto");
		   
		   String id = request.getParameter("id");
		   int recipe_id = Integer.parseInt(request.getParameter("recipe_id"));
		   String recipe_nm_ko = request.getParameter("recipe_nm_ko");
		   
		   ZzimDto dto = new ZzimDto();
		   dto.setId(id);
		   dto.setRecipe_id(recipe_id);
		   dto.setRecipe_nm_ko(recipe_nm_ko);
		   int res = biz.zzimInsert(dto);
		   if(ldto!=null) {
			   if(res>0) {
		             jsResponse("찜목록에 추가되었습니다.", "index.jsp", response);
		             
		          }else {
		             jsResponse("이미 담긴 레시피입니다.", "index.jsp", response);
		          }
			   
		   }else {
			   jsResponse("로그인 해야 이용할수 있습니다.", "login.jsp", response);
		   }
	    	
	   }
	   else if(command.equals("zzimDelete")) {
		   String id = request.getParameter("id");
		   int seq = Integer.parseInt(request.getParameter("seq"));
		   int res = biz.zzimDelete(seq);
	    	if(res>0) {
	    		jsResponse("삭제되었습니다.", "zzimController.do?command=zzimList&id="+id, response);
	    	}else {
	    		jsResponse("삭제실패.", "javascript:history.back()", response);
	    	}
	   }
	   else if(command.equals("zzimList")) {
		   LoginDto ldto = (LoginDto)request.getSession().getAttribute("ldto");
		   String id = ldto.getId();
		  // String id = request.getParameter("id");
		   System.out.println("컨트롤러의 아이딩"+id);
		   List<ZzimDto> list = biz.zzimList(id);
		   request.setAttribute("list", list);
		   dispatch(request, response, "mypicklist.jsp");
	   }
	   else if(command.equals("zzimDetail")) {
		   
		 	int recipe_id=Integer.parseInt(request.getParameter("id"));//해당recipe_id의 정보, 재료, 과정을 보기위해서 받아와서 던져줌 
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
	    	
		   
		   
	   }else if(command.equals("zzimmuldel")) {
		   		int res = 0;
      		    String id = request.getParameter("id");
				String [] seqArr = request.getParameterValues("cb");
				
				res = biz.zzimmuldel(seqArr);
	
		    	if(res>0) {
		    		jsResponse("삭제되었습니다.", "zzimController.do?command=zzimList&id="+id, response);
		    	}else {
		    		jsResponse("삭제실패.", "javascript:history.back()", response);
		    	}
			
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
