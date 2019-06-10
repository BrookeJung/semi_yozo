package com.user_login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user_login.biz.LoginBiz;
import com.user_login.dto.LoginDto;

@WebServlet("/logincontroller.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command= request.getParameter("command");
		System.out.println("<" + command + ">");
		LoginBiz biz = new LoginBiz();
		//회원가입 창으로 가기
		if(command.equals("idchk")){
			String id=request.getParameter("id");
			
			LoginDto dto = biz.idChk(id);
			boolean idnotused = true;
			if(dto.getId() != null){
				idnotused = false;
			}
			response.sendRedirect("idchk.jsp?idnotused="+idnotused);
		}else if(command.equals("joininsertform")){
			response.sendRedirect("JoinUp.jsp");
		}else if(command.equals("joininsert")) {
		
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String addr = request.getParameter("addr");
			LoginDto dto = new LoginDto(0,name,id,pw,email,addr);
			System.out.println(id+pw+name+addr+email+"");
	         int res = biz.user_insert(dto);
	         
	         if(res>0) {
	            jsResponse("회원가입 완료!", "Login.jsp", response);
	         }else {
	            jsResponse("회원가입 실패!", "Login.jsp", response);
	         }
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}
	
	   public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		      RequestDispatcher dispatch = request.getRequestDispatcher(url);
		      dispatch.forward(request, response);
		   }
		   
		   public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		      String res = "<script type='text/javascript'>"
		               + " alert('"+msg+"');"
		               + " location.href='"+url+"';"
		               + "</script>";
		      
		      PrintWriter out = response.getWriter();
		      out.println(res);
		            
		   }

}
