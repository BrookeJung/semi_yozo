package com.user_login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user_login.biz.LoginBiz;
import com.user_login.dao.LoginDao;
import com.user_login.dto.LoginDto;

@WebServlet("/logincontroller.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	boolean idnotused;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("<" + command + ">");
		LoginBiz biz = new LoginBiz();
		LoginDao dao = new LoginDao();
		// 회원가입 창으로 가기
		if (command.equals("idchk")) {
			String id = request.getParameter("id");
			idnotused = biz.idChk(id);
			response.sendRedirect("idchk.jsp?idnotused=" + idnotused);
		} else if (command.equals("joininsertform")) {
			response.sendRedirect("joinup.jsp");
		} else if (command.equals("joininsert")) {

			String id = request.getParameter("id");
	         String pw = request.getParameter("pw");
	         String pw_chk = request.getParameter("pw_chk");
	         String name = request.getParameter("name");
	         String phone1 = request.getParameter("phone1");
	         String phone2 = request.getParameter("phone2");
	         String phone3 = request.getParameter("phone3");
	         String email = request.getParameter("email");
	         boolean doc = Boolean.parseBoolean(request.getParameter("doc"));
	         String addr = request.getParameter("addr");
	         String zonecode = request.getParameter("zonecode");	//우편번호
	         
	         LoginDto dto = new LoginDto();
	         dto.setId(id);
	         dto.setPw(pw);
	         dto.setName(name);
	         dto.setPhone(phone1+"-"+phone2+"-"+phone3);
	         dto.setEmail(email);
	         dto.setAddr(addr);
	         dto.setZonecode(zonecode);
	         
	         if (pw.equals(pw_chk)) {
				 if(doc == true) { 
	               int res = biz.user_insert(dto);
	               if (res > 0) {
	                  jsResponse("회원가입 완료!", "login.jsp", response);
	               } else {
	                  jsResponse("회원가입 실패!", "joinup.jsp", response);
	               }
	               System.out.println(doc);
				
				  }else { jsResponse("인증번호가 일치하지 않습니다.", "joinup.jsp", response); }
				 
	         }else {
	            jsResponse("비밀번호가 일치하지 않습니다.", "joinup.jsp", response);
	         }
		} else if (command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			HttpSession session = request.getSession(true);

			LoginDto ldto = biz.login(id, pw);

			if (ldto == null) {
				jsResponse("아이디 혹은 비밀번호를 확인해 주세요", "login.jsp", response);
			}
			if (ldto != null) {
				session.setAttribute("ldto", ldto);
				session.setMaxInactiveInterval(-1);
				
				if(ldto.getRole().equals("ADMIN")) {
		               response.sendRedirect("adminmain.jsp");
		            }else if(ldto.getRole().equals("USER")) {
		            	dispatch(request, response, "index.jsp");
		            }

			}
		}else if(command.equals("userall")) {
	         
	         List<LoginDto> list = biz.selectList();
	         request.setAttribute("list", list);
	         dispatch(request, response, "userall.jsp");
	      }
		
		
		
		
		else if (command.equals("logout")) {
			HttpSession session = request.getSession(true);
			session.invalidate();
			response.sendRedirect("index.jsp");
		} else if (command.equals("idfind")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			System.out.println(name);
			System.out.println(email);

			LoginDto dto = biz.idSearch(name, email);

			if (dto == null) {
				jsResponse("잘못된 이름이거나, 잘못된 이메일을 입력하셨습니다.", "idfind.jsp", response);
			}
			if (dto != null) {
				request.setAttribute("dto", dto);
				// response.sendRedirect("idfindfind.jsp");
				dispatch(request, response, "idfindfind.jsp");
			}

		} else if (command.equals("delete")) {
			LoginDto ldto = (LoginDto) request.getSession().getAttribute("ldto");
			int seq = ldto.getUserseq();
			int res = biz.user_delete(seq);
			if (res > 0) {
				alert("정말 회원탈퇴를 하시겠습니까?");
				HttpSession session = request.getSession(true);
				session.invalidate();
				jsResponse("탈퇴가 완료되었습니다.", "index.jsp", response);
			} else {
				alert("회원탈퇴가 실패하였습니다.");
				dispatch(request, response, "javascript:mypage.jsp");
			}
		} else if (command.equals("userupdateform")) {
			response.sendRedirect("userupdate.jsp");
		}  else if (command.equals("userupdate")) {
	         LoginDto ldto = (LoginDto) request.getSession().getAttribute("ldto");
	         
	            String pw = request.getParameter("pw");
	            String pw_chk = request.getParameter("pw_chk");
	            String phone1 = request.getParameter("phone1");
	            String phone2 = request.getParameter("phone2");
	            String phone3 = request.getParameter("phone3");
	            String addr = request.getParameter("addr");
	            String zonecode = request.getParameter("zonecode");   //우편번호
	            
	            LoginDto dto = new LoginDto();
	          
	            dto.setUserseq(ldto.getUserseq());
	            dto.setPw(pw);
	            dto.setPhone(phone1+"-"+phone2+"-"+phone3);
	            dto.setAddr(addr);
	            dto.setZonecode(zonecode);

	         if (pw.equals(pw_chk)) {
	            
	                  int res = biz.user_update(dto);
	                  if (res > 0) {
	                     jsResponse("회원정보 수정 완료!", "mypage.jsp", response);
	                  } else {
	                     jsResponse("회원정보 수정 실패!", "userupdate.jsp", response);
	                  }
	              
	            }else {
	               jsResponse("비밀번호가 일치하지 않습니다.", "joinup.jsp", response);
	            }
	         } else if (command.equals("getout")) {
	         jsResponse("로그인 혹은 회원가입을 해주세요!", "login.jsp", response);
	    }  else if (command.equals("kakao")) {
	         String id = request.getParameter("id");
	         String name = request.getParameter("name");
	         System.out.println("카카오 id는 " + id);
	         System.out.println("카카오 name은 " + name);

	         boolean regist_dto = biz.idChk(id);
	         
	         if(regist_dto == true) {
	            request.setAttribute("id", id);
	            request.setAttribute("name", name);
	            
	            alert("회원가입 되지 않은 회원입니다! 추가정보를 입력해주세요!",response);
	            System.out.println("회원추가정보 입력 페이지 이동!");
	            dispatch(request, response, "kakaojoin.jsp");
	         }
	         else {
	            System.out.println(name+"님 환영합니다");
	            alert(name+"님 환영합니다",response);
	            LoginDto ldto = biz.kakaologin(id);
	            request.getSession().setAttribute("ldto", ldto);
	            dispatch(request, response, "index.jsp");
	         }
	            
	      } else if (command.equals("facebook")) {
	         String id = request.getParameter("id");
	         String name = request.getParameter("name");
	         System.out.println("페이스북 id는 " + id);
	         System.out.println("페이스북 name는 " + name);

	         boolean regist_dto = biz.idChk(id);
	         
	         if(regist_dto == true) {
	            request.setAttribute("id", id);
	            request.setAttribute("name", name);
	            
	            alert("회원가입 되지 않은 회원입니다! 추가정보를 입력해주세요!",response);
	            System.out.println("회원추가정보 입력 페이지 이동!");
	            dispatch(request, response, "kakaojoin.jsp");
	         }
	         else {
	            System.out.println(name+"님 환영합니다");
	            alert(name+"님 환영합니다",response);
	            LoginDto ldto = biz.kakaologin(id);
	            request.getSession().setAttribute("ldto", ldto);
	            dispatch(request, response, "index.jsp");
	         }
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

	public void alert(String msg) {
		msg = "<script type='text/javascript'>" + " alert('" + msg + "');" + "</script>";
	}
	
	public void alert(String msg, HttpServletResponse response) throws IOException {
	      msg = "<script type='text/javascript'>" + " alert('" + msg + "');" + "</script>";
	      
	      PrintWriter out = response.getWriter();
	      out.println(msg);
	      
	   }

}
