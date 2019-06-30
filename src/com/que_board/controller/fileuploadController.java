package com.que_board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.que_board.biz.QueBoardBiz;
import com.que_board.dto.QueBoardDto;
import com.user_login.dto.LoginDto;

@WebServlet("/fileuploadController.do")
public class fileuploadController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public fileuploadController() {

   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      
      // 로그인 속성
      LoginDto ldto = (LoginDto) request.getSession().getAttribute("ldto");

      // 경로확인용
      String path = request.getSession().getServletContext().getRealPath("/uploadimage");
      System.out.println(path);
         
      // 사진 경로, 크기 multi 설정
      MultipartRequest multi = new MultipartRequest(request, path, 100000000, "UTF-8");
      String command = multi.getParameter("command");
      System.out.println("<" + command + ">");

      QueBoardBiz biz = new QueBoardBiz();

      if (command.equals("queWriteForm")) {
         String flag = "";
         if (multi.getParameter("lock") != null) {
            flag = "Y";
         } else if (multi.getParameter("unlock") != null) {
            flag = "N";
         }
      // request -> multi
         String pass = multi.getParameter("password");
         System.out.println("여기번홈" + pass);
         System.out.println("여기프래그" + flag);
         String title = multi.getParameter("title");
         String content = multi.getParameter("content");
         System.out.println("내용쓰" + content);
         String writer = multi.getParameter("writer");
         QueBoardDto dto = new QueBoardDto();
         dto.setTitle(title);
         dto.setContent(content);
         dto.setWriter(writer);
         dto.setSecflag(flag);
         int res = biz.boardInsert(dto);
//         recipeController.do?command=queList&pagenum=1&contentnum=10
         if (res > 0) {
            jsResponse("문의글이 등록되었습니다.", "recipeController.do?command=queboardlist&pagenum=1&contentnum=10&opt=5&condition=0", response);
         } else {
            jsResponse("문의글 등록에 실패했습니다.", "javascript:history.back()", response);
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

}
