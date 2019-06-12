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
import com.user_login.mail.SMTPMail;

@WebServlet("/mailController.do")
public class MailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("<" + command + ">");

		LoginBiz biz = new LoginBiz();
		if (command.equals("mail")) {
			String email = request.getParameter("email");
			String code = ((int) Math.floor((Math.random() * (99999 - 10000 + 1))) + 10000) + "";
			SMTPMail.gmailSend(email, code + "번호를 이메일 인증란에 입력해주세요!", "yorizori 회원가입 인증 이메일 입니다!");
			response.getWriter().write(code);
		} else if (command.equals("pwchange")) {
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String code = ((int) Math.floor((Math.random() * (999999 - 100000 + 1))) + 100000) + "";

			System.out.println(id);
			System.out.println(email);

			LoginDto dto = biz.pwSearch(id, email);

//			System.out.println(dto.getId());

			if (dto != null) {
				int res = biz.pwUpdate(code, id);
				
				if (res>0) {
					SMTPMail.gmailSend(email, "변경된 비밀번호는 " + code + "입니다!", "yorizori 비밀번호 변경 이메일입니다!");
					response.getWriter().write(code);
					jsResponse("비밀번호가 성공적으로 변경되었습니다, 이메일로 전송된 비밀번호로 로그인해주세요!", "login.jsp", response);

				}else {
					jsResponse("비밀번호 db 등록 실패", "pwfind.jsp", response);
				}
			}else {
				jsResponse("잘못된 아이디이거나, 잘못된 이메일을 입력하셨습니다.", "pwfind.jsp", response);
			}

		}
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		doGet(request, response);
	}

}