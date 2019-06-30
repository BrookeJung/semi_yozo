package com.que_board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.que_board.biz.QueBoardBiz;
import com.que_board.dto.QueBoardDto;
import com.que_page.dto.PageMaker;


@WebServlet("/recipeController")
public class recipeController extends HttpServlet {
	
      

	public recipeController() {
    	
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    String command = request.getParameter("command");
	    System.out.println("<" + command + ">");
	    
	    QueBoardBiz biz = new QueBoardBiz();
	    
	    
	    if(command.equals("queboardlist")) {
	    	 int option = Integer.parseInt(request.getParameter("opt"));
	    	 String condition = request.getParameter("condition");
	    	 int pagenum = Integer.parseInt(request.getParameter("pagenum"));//현재페이지
	         int contentnum = Integer.parseInt(request.getParameter("contentnum"));//한페이지에 보이는 게시글 갯수
	         System.out.println("page,content/opt,condition: "+pagenum+contentnum+" / "+option+condition);
	         
	         int totalcount = biz.getTotalCount(option, condition);
	         PageMaker pm = new PageMaker();
	         pm.setTotalcount(totalcount);
	         pm.setContentnum(contentnum);
	         pm.setPagenum(pagenum);
	         pm.setCurrentblock(pagenum);
	         pm.setLastblock(totalcount);
	         pm.setStartPage(pm.getCurrentblock());
	         pm.setEndPage(pm.getLastblock(), pm.getCurrentblock());
	         
	         if(pagenum>0 && pagenum<6) { //페이지블록이 1일 때는 이전페이지로가는 화살표 안보임
	            pm.setPrev(false);
	            pm.setNext(true);
	         }else if(pm.getLastblock() == pm.getCurrentblock()) { //마지막 블록이 현재 블록일 때 다음블록 화살표는 안보임 
	            pm.setPrev(true);
	            pm.setNext(false);
	         }else {
	            pm.setPrev(true);
	            pm.setNext(true);
	         }
	         pm.setStartrow(pagenum, contentnum);
	         pm.setEndrow(pagenum, contentnum);
	         System.out.println("시작끝"+pm.getStartrow()+"/"+pm.getEndrow());
	       
	         List<QueBoardDto> list = biz.selectListOption(option,condition,pm.getStartrow(), pm.getEndrow());
	         
	         request.setAttribute("list", list);
	         request.setAttribute("pm", pm);
	         request.setAttribute("opt", option);
	         request.setAttribute("con", condition);
	         dispatch(request, response, "queboardlist.jsp");
	    }
	    else if(command.equals("queDetail")) {
	    	int groupno = Integer.parseInt(request.getParameter("groupno"));
	    	int boardno = Integer.parseInt(request.getParameter("boardno"));
	    	QueBoardDto dto = biz.selectOne(boardno);
	    	List<QueBoardDto> listReply = biz.selectListReply(groupno);
	    	request.setAttribute("dto", dto);
	    	request.setAttribute("listReply", listReply);
	    	dispatch(request, response, "queboarddetail.jsp");
	    }
	    else if(command.equals("queWrite")) {
	    	response.sendRedirect("queboardwrite.jsp");
	    }
	    else if(command.equals("queWriteForm")) {
	    	String flag="";
	    	if(request.getParameter("lock")!=null) {
	    		flag="Y";
	    	}else if(request.getParameter("unlock")!=null) {
	    		flag="N";
	    	}
	    	String pass = request.getParameter("password");
	    	System.out.println("여기번홈"+pass);
	    	System.out.println("여기프래그"+flag);
	    	String title = request.getParameter("title");
	    	String content = request.getParameter("content");
	    	System.out.println("내용쓰"+content);
	    	String writer = request.getParameter("writer");
	    	QueBoardDto dto = new QueBoardDto();
	    	dto.setTitle(title);
	    	dto.setContent(content);
	    	dto.setWriter(writer);
	    	dto.setSecflag(flag);
	    	int res = biz.boardInsert(dto);
	    	if(res>0) {
	    		jsResponse("문의글이 등록되었습니다.", "recipeController.do?command=queboardlist&pagenum=1&contentnum=10&opt=5&condition=0", response);
	    	}else {
	    		jsResponse("문의글 등록에 실패했습니다.", "javascript:history.back()", response);
	    	}
	    }
	    else if (command.equals("queUpdateForm")) {
	    	int boardno = Integer.parseInt(request.getParameter("boardno"));
	    	int groupno= Integer.parseInt(request.getParameter("groupno"));
	    	
	    	String title = request.getParameter("title");
	    	String content = request.getParameter("content");
	    	System.out.println("넘어온 content"+content);
	    	QueBoardDto dto = new QueBoardDto();
	    	dto.setBoardno(boardno);
	    	dto.setTitle(title);
	    	dto.setContent(content);
	    	int res = biz.boardUpdate(dto);
	    	if(res>0) {
	    		jsResponse("문의게시글수정완료","recipeController.do?command=queDetail&boardno="+boardno+"&groupno="+groupno, response);
	    	}else {
	    		jsResponse("게시글수정실패","javascript:history.back()", response);
	    	}
	    	
	    }
	    else if(command.equals("queDelete")) {
	    	int groupno = Integer.parseInt(request.getParameter("groupno"));
	    	int res = biz.boardDelete(groupno);
	    	if(res>0) {
	    		jsResponse("삭제성공", "recipeController.do?command=queboardlist&pagenum=1&contentnum=10&opt=5&condition=0", response);
	    	}else {
	    		jsResponse("삭제실패", "recipeController.do?command=queboardlist&pagenum=1&contentnum=10&opt=5&condition=0", response);
	    	}
	    }
	    else if(command.equals("queDeleteReply")) {
	    	int pboardno = Integer.parseInt(request.getParameter("pboardno"));
	    	int boardno = Integer.parseInt(request.getParameter("boardno"));
	    	int groupno = Integer.parseInt(request.getParameter("groupno"));
	    	int res = biz.boardDeleteReply(boardno);
	    	if(res>0) {
	    		jsResponse("삭제성공", "recipeController.do?command=queDetail&boardno="+pboardno+"&groupno="+groupno, response);
	    	}else {
	    		jsResponse("삭제실패", "javascript:history.back()", response);
	    	}
	    }
	    else if(command.equals("queReply")) {
	    	int parentno = Integer.parseInt(request.getParameter("parentno"));
	    	QueBoardDto pdto = new QueBoardDto();
	    	pdto.setBoardno(parentno);
	    	request.setAttribute("parentno", parentno);
	    	request.setAttribute("pdto",pdto);
	    	dispatch(request, response, "queboardreply.jsp");
	    }
	    else if(command.equals("queReplyForm")) {
	    	int parentno = Integer.parseInt(request.getParameter("parentno"));
	    	int cnt = biz.replyCntup(parentno);
	 
	    	System.out.println("여기엔오요"+parentno);
	    	String title = request.getParameter("titleReply");
	    	String content = request.getParameter("contentReply");
	    	String writer = request.getParameter("writerReply");
	    	int groupno = Integer.parseInt(request.getParameter("groupnoReply"));

	    	QueBoardDto dto = new QueBoardDto();
	    	dto.setBoardno(parentno);
	    	dto.setTitle(title);
	    	dto.setContent(content);
	    	dto.setWriter(writer);
	    	int res = biz.answProc(dto);
	    	System.out.println(res);
	    	if(res>0 && cnt>0) {
	    		jsResponse("댓글작성완료", "recipeController.do?command=queDetail&boardno="+parentno+"&groupno="+groupno, response);
	    	}else {
	    		jsResponse("댓글작성실패", "javascript:history.back()", response);
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
