package com.user_login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user_login.mail.SMTPMail;

@WebServlet("/mailController.do")
public class MailController extends HttpServlet {
   private static final long serialVersionUID = 1L;


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
       response.setContentType("text/html; charset=UTF-8");
       
       String command = request.getParameter("command");
       System.out.println("<" + command + ">");

       if(command.equals("mail")) {
         String email  = request.getParameter("email");
         String code = ((int)Math.floor((Math.random()*(99999-10000+1)))+10000)+"";
         SMTPMail.gmailSend(email,code);
         response.getWriter().write(code);
       }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
       response.setContentType("text/html; charset=UTF-8");
     
       doGet(request, response);
   }

}