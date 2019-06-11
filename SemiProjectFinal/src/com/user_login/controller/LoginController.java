package com.user_login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user_login.biz.LoginBiz;
import com.user_login.dto.LoginDto;

@WebServlet("/logincontroller.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	boolean idnotused;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command= request.getParameter("command");
		System.out.println("<" + command + ">");
		LoginBiz biz = new LoginBiz();
		//회원가입 창으로 가기
		if (command.equals("snsjoinform")){
			response.sendRedirect("snssignup.jsp");
		}else if(command.equals("idchk")){
			String id=request.getParameter("id");
			idnotused = biz.idChk(id);
			response.sendRedirect("idchk.jsp?idnotused="+idnotused);
		}else if(command.equals("joininsertform")){
			response.sendRedirect("joinup.jsp");
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
	            jsResponse("회원가입 완료!", "login.jsp", response);
	         }else {
	            jsResponse("회원가입 실패!", "joinup.jsp", response);
	         }
		}else if (command.equals("login")) {
			
		
	         String id = request.getParameter("id");
	         String pw = request.getParameter("pw");
	         
	         HttpSession session = request.getSession(true);
	         LoginDto dto = biz.login(id, pw);	         
        	 
	         if(dto == null) {
	        	 jsResponse("아이디 혹은 비밀번호를 확인 해 주세요", "login.jsp", response);
	         }
        	 if(dto != null) {
        		 session.setAttribute("dto", dto);
	        	 session.setMaxInactiveInterval(-1);
	        	 dispatch(request, response, "mainloginboard.jsp");
	         }
	         
		}else if(command.equals("logout")) {
	         HttpSession session = request.getSession(true);
	         session.invalidate();
	         response.sendRedirect("mainboard.jsp");
	      }else if(command.equals("idfind")) {
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				System.out.println(name);
				System.out.println(email);
				
				LoginDto dto = biz.idSearch(name, email);

				System.out.println(dto.getId());
				
				if(dto.getId() != null) {
					request.setAttribute("dto", dto);
					//response.sendRedirect("idfindfind.jsp");
					dispatch(request, response, "idfindfind.jsp");
				}else {
					jsResponse("잘못된 이름이거나, 잘못된 이메일을 입력하셨습니다.", "idfind.jsp", response);
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
