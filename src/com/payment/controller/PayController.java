package com.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.payment.biz.PaymentBiz;
import com.payment.dto.PaymentDto;
import com.recipe_material.dao.RecipeMaterialDao;
import com.recipe_material.dto.RecipeMaterialDto;
import com.user_login.dto.LoginDto;

/**
 * Servlet implementation class PayController
 */
@WebServlet("/paycontroller.do")
public class PayController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");

      String command = request.getParameter("command");
      System.out.println("<" + command + ">");

      PaymentBiz biz = new PaymentBiz();

      if (command.equals("order")) {

         String[] material = request.getParameterValues("ordermaterial");// 재료를 받아오고싶다...
         int recipe_id = Integer.parseInt(request.getParameter("recipe_id"));
         
         
         System.out.println(recipe_id);
         
         LoginDto ldto = (LoginDto) request.getSession().getAttribute("ldto");
         if(ldto==null) {
        	 jsResponse("로그인을해야 이용하실수 있습니다", "login.jsp", response);
         }else {
        	 System.out.println(ldto.getId());

             RecipeMaterialDao dao = new RecipeMaterialDao();
             List<RecipeMaterialDto> ordermaterial = dao.selectorderlist(recipe_id, ldto.getId());

             request.setAttribute("ordermaterial", ordermaterial);
             dispatch(request, response, "shopping.jsp");
         }
        

      } else if (command.equals("payment")) {
         String merchant_uid = request.getParameter("merchant_uid");
         String id = request.getParameter("id");
         int amount = Integer.parseInt(request.getParameter("amount"));
         String place = request.getParameter("place");

         PaymentDto dto = new PaymentDto(0, id, merchant_uid + " 주문!", amount, null, place);
         int res = biz.payInsert(dto);

      } else if (command.equals("paymuldel")) {
         int res = 0;
         String id = request.getParameter("id");
         String[] seqArr = request.getParameterValues("cb");

         res = biz.paymuldel(seqArr);

         if (res > 0) {
            jsResponse("삭제되었습니다.", "paycontroller.do?command=payList&id=" + id, response);
         } else {
            jsResponse("삭제실패.", "javascript:history.back()", response);
         }

      } else if (command.equals("payList")) {
         LoginDto ldto = (LoginDto) request.getSession().getAttribute("ldto");
         String id = ldto.getId();
         // String id = request.getParameter("id");
         System.out.println("컨트롤러의 아이디" + id);
         List<PaymentDto> list = biz.payList(id);
         request.setAttribute("list", list);
         dispatch(request, response, "purchaselist.jsp");
      }

      else if (command.equals("payDelete")) {
         String id = request.getParameter("id");
         int seq = Integer.parseInt(request.getParameter("seq"));
         int res = biz.payDelete(seq);
         if (res > 0) {
            jsResponse("삭제되었습니다.", "paycontroller.do?command=payList&id=" + id, response);
         } else {
            jsResponse("삭제실패.", "javascript:history.back()", response);
         }
      }
//      else if(command.equals("")) {
//         String imp_key = URLEncoder.encode("3152989888756429", "UTF-8");
//         String imp_secret = URLEncoder.encode("DDiDrq3KyzXxnToeL6PpB1mnlp8erF54jnIKOLvmltUImjX8pNx1OUpakypLduPwSyhHkM4FfYoChlKH", "UTF-8");
//         JSONObject json = new JSONObject();
//         json.put("imp_key", imp_key);
//         json.put("imp_secret", imp_secret);
//         String _token = ImportPay.getToken(request, response, json, requestURL); 
//      }

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