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

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/loginController.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		LoginBiz biz = new LoginBiz();

		String command = request.getParameter("command");
		System.out.println("<" + command + ">");

		if (command.equals("joininsert")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String addr = request.getParameter("addr");
			String email = request.getParameter("email");
			LoginDto dto = new LoginDto(0,name,id,pw,addr,email);
			int res = biz.user_insert(dto);
			
			if(res>0) {
				jsResponse("회원가입 완료!", "Login.jsp", response);
			}else {
				jsResponse("회원가입 실패!", "Login.jsp", response);
			}
		}
//		else if(command.equals("idchk")){
//			 String id = request.getParameter("id");
//			 
//			 LoginDto dto = biz.idChk(id);
//			 boolean idnotused = true;
//			 
//			 if(dto.getId() !=null){
//				 idnotused = false;
//			 }
//			 
//			 request.setAttribute(idnotused+"",idnotused);
//			 dispatch(request, response, "idchk.jsp");
//		 }
		else if (command.equals("login")) {
			System.out.println("===============");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			LoginDto dto = biz.login(id, pw);
			if (dto.getId() != null) {
				HttpSession session = request.getSession();
				session.setAttribute("dto", dto);

				response.sendRedirect("mainloginboard.jsp");

			}
		}else if(command.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("MainBoard.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		doGet(request, response);
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String res = "<script type='text/javascript'>" + " alert('" + msg + "');" + " location.href='" + url + "';"
				+ "</script>";

		PrintWriter out = response.getWriter();
		out.println(res);

	}
}
