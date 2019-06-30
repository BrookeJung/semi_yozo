//여기가 종착점
package com.recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.que_page.dto.PageMaker;
import com.recipe_info.dao.RecipeInfoDao;
import com.recipe_info.dto.RecipeInfoDto;
import com.recipe_material.dao.RecipeMaterialDao;
import com.recipe_material.dto.RecipeMaterialDto;
import com.recipe_process.dao.RecipeProcessDao;
import com.recipe_process.dto.RecipeProcessDto;
import com.refrigerator.dao.RefrigeratorDao;
import com.refrigerator.dto.RefrigeratorDto;
import com.user_login.dto.LoginDto;

@WebServlet("/RecipeController.do")
public class RecipeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public RecipeController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");

		// 커맨드 체크용 추후 삭제
		System.out.println("<" + command + ">");

		// 레시피정보 테이블에 저장+
		if (command.equals("start_info")) {
			response.sendRedirect("recipe_info_store.jsp");
		} // 레시피 재료 테이블에 저장
		else if (command.equals("start_material")) {
			response.sendRedirect("recipe_material_store.jsp");
		} // 본격저장(레시피정보)
		else if (command.equals("storedb_info")) {
			RecipeInfoDao dao = new RecipeInfoDao();
			String[] recipeList = request.getParameterValues("recipe");
			List<RecipeInfoDto> list = new ArrayList<RecipeInfoDto>();
			for (int i = 0; i < recipeList.length; i++) {
				System.out.println(recipeList[i]);
				String[] recipe = recipeList[i].split("※");
				RecipeInfoDto dto = new RecipeInfoDto();
				dto.setRecipe_id(Integer.parseInt(recipe[0]));
				dto.setRecipe_nm_ko(recipe[1]);
				dto.setSumry(recipe[2]);
				dto.setNation_code(Integer.parseInt(recipe[3]));
				dto.setNation_nm(recipe[4]);
				dto.setTy_code(Integer.parseInt(recipe[5]));
				dto.setTy_nm(recipe[6]);
				dto.setCooking_time(Integer.parseInt(recipe[7].substring(0, recipe[7].length() - 1)));////
				dto.setCalorie(recipe[8]);
				dto.setQnt(recipe[9]);
				dto.setLevel_nm(recipe[10]);
				dto.setIrdnt_code(recipe[11]);
				dto.setImg_url(recipe[12]);
				dto.setDet_url(recipe[13]);

				list.add(dto);
			}
			int res = dao.insert(list);
			if (res == list.size()) {
				System.out.println("저장성공");
			} else {
				System.out.println("저장실패");
			}

			response.sendRedirect("mainhomepage.jsp");
		}
		// 본격저장(재료)
		else if (command.equals("storedb_material")) {
			RecipeMaterialDao dao = new RecipeMaterialDao();
			String[] RecipeList = request.getParameterValues("recipe_material");
			List<RecipeMaterialDto> list = new ArrayList<RecipeMaterialDto>();
			for (int i = 0; i < RecipeList.length; i++) {
				System.out.println(RecipeList[i]);
				String[] recipeMaterial = RecipeList[i].split("//");
				RecipeMaterialDto dto = new RecipeMaterialDto(Integer.parseInt(recipeMaterial[0]),
						Integer.parseInt(recipeMaterial[1]), recipeMaterial[2], recipeMaterial[3], recipeMaterial[4],
						recipeMaterial[5]);
				list.add(dto);
			}

			int res = dao.insert(list);

			if (res == list.size()) {
				System.out.println("저장 성공");
			} else {
				System.out.println("저장 실패");
			}

			response.sendRedirect("mainhomepage.jsp");

		}
		// 레시피과정 저장
		else if (command.equals("start_process")) {
			response.sendRedirect("recipe_process_store.jsp");
		}
		// 본격저장(레시피과정)
		else if (command.equals("storedb_process")) {

			RecipeProcessDao dao = new RecipeProcessDao();

			String[] RecipePList = request.getParameterValues("recipe_process");
			List<RecipeProcessDto> list = new ArrayList<RecipeProcessDto>();

			for (int i = 0; i < RecipePList.length; i++) {
				System.out.println(RecipePList[i]);

				String[] recipeProcess = RecipePList[i].split("※");

				RecipeProcessDto dto = new RecipeProcessDto(Integer.parseInt(recipeProcess[0]),
						Integer.parseInt(recipeProcess[1]), recipeProcess[2], recipeProcess[3], recipeProcess[4]);

				list.add(dto);
			}

			int res = dao.insert(list);

			if (res == list.size()) {
				System.out.println("저장 성공");
			} else {
				System.out.println("저장 실패");
			}

			response.sendRedirect("mainhomepage.jsp");

		}

		// 냉장고에 재료넣기
		else if (command.equals("myrefrigerator")) {

			LoginDto ldto = (LoginDto) request.getSession().getAttribute("ldto");
			if(ldto==null) {
		
				dispatch(request, response, "login.jsp");
				
			}
			else {
			// myrefrigerator.jsp에 있는 데이터리스트 태그안에 들어갈 모든 재료를 생성하기 위함
			RecipeMaterialDao materialdao = new RecipeMaterialDao();
			// datalist에 재료넣기위함
			List<RecipeMaterialDto> list = materialdao.selectList();

			// dispatch로 보낼 myrefrigerator.jsp 이곳에서 ${요기안에다 쓰려고} setattribute
			request.setAttribute("list", list);

			dispatch(request, response, "myrefrigerator.jsp");
			}
		}

		// 냉장고테이블에 사용자가 선택한 재료들 추가
		else if (command.equals("insertmyrefrigeratordb")) {

			String[] material = request.getParameterValues("realvalue");// 히든으로 넘어온 realvalue 배열로 받음

			LoginDto ldto = (LoginDto) request.getSession().getAttribute("ldto");

			for (int i = 0; i < material.length; i++) {// sql문을 추가될 재료 갯수만큼 실행해야하기때문에 for문 이용
				RefrigeratorDto dto = new RefrigeratorDto(ldto.getId(), material[i]);// id-i번쨰 재료 이게 한줄
				RefrigeratorDao dao = new RefrigeratorDao();
				dao.insertRefrigerator(dto);
			}
			// db저장완료

			// 냉장고재료보여주기
			RefrigeratorDao myrefrigeratordao = new RefrigeratorDao();
			List<RefrigeratorDto> myrefrigerator = myrefrigeratordao.selectRefrigeratorList(ldto.getId());// 위에서 받아온 id
																											// 파라미터로 던짐
			request.setAttribute("myrefrigerator", myrefrigerator);

			dispatch(request, response, "myrefrigeratorlist.jsp");

			// 냉장고재료삭제
		} else if (command.equals("recommend_refri_recipe_delete")) {
			// location.href 통해서 값을 전달
			LoginDto ldto = (LoginDto) request.getSession().getAttribute("ldto");
		
			System.out.println("여기아이디!!!!!!!!"+ldto.getId());
			RefrigeratorDao dao = new RefrigeratorDao();
			dao.delete(ldto.getId());

			dispatch(request, response, "index.jsp");

			// 냉장고재료추천받기
		} else if (command.equals("recommend_refri_recipe")) {

			LoginDto ldto = (LoginDto) request.getSession().getAttribute("ldto");
			RecipeInfoDao infodao = new RecipeInfoDao();
			List<RecipeInfoDto> recommendrecipe = infodao.selectRecommend(ldto.getId());// 아이디보내주고,요리3가지 보여주기
			request.setAttribute("recommendrecipe", recommendrecipe);// 속성 set하고

			dispatch(request, response, "recommendrefrirecipe.jsp");// 레시피정보틀
			
			// 추천받고 자세히보기클릭 해당요리 재료,과정
		} else if (command.equals("recommenddetail")) {

			int recipe_id = Integer.parseInt(request.getParameter("recommendrecipeid"));// 해당recipe_id의 정보, 재료, 과정을
																						// 보기위해서 받아와서 던져줌
			RecipeProcessDao processdao = new RecipeProcessDao();
			List<RecipeProcessDto> processlist = processdao.selectprocessview(recipe_id);

			RecipeMaterialDao materialdao = new RecipeMaterialDao();
			List<RecipeMaterialDto> materiallist = materialdao.selectmaterialview(recipe_id);

			RecipeInfoDao infodao = new RecipeInfoDao();
			RecipeInfoDto infolist = infodao.selectrecipeview(recipe_id);// 한줄만 출력되기떄문에 List가 아니라 그냥 객체

			int cnt = 0;
			cnt = infodao.recireadCount(recipe_id);
			if (cnt > 0) {
				System.out.println("reci증가완료");
			}

			request.setAttribute("infolist", infolist);
			request.setAttribute("materiallist", materiallist);
			request.setAttribute("processlist", processlist);
			request.setAttribute("recipe_id", recipe_id);

			dispatch(request, response, "recommenddetail.jsp");

		} else if (command.equals("categoryrecipeinit")) {
			RecipeInfoDao infodao = new RecipeInfoDao();

			int pagenum = Integer.parseInt(request.getParameter("pagenum"));// 현재페이지
			int contentnum = Integer.parseInt(request.getParameter("contentnum"));// 한페이지에 보이는 게시글 갯수
			System.out.println("page,content" + pagenum + contentnum);
			int totalcount = infodao.getCount();
			PageMaker pm = new PageMaker();
			pm.setTotalcount(totalcount);
			pm.setContentnum(contentnum);
			pm.setPagenum(pagenum);
			pm.setCurrentblock(pagenum);
			pm.setLastblock(totalcount);
			pm.setStartPage(pm.getCurrentblock());
			pm.setEndPage(pm.getLastblock(), pm.getCurrentblock());

			if (pagenum > 0 && pagenum < 6) { // 페이지블록이 1일 때는 이전페이지로가는 화살표 안보임
				pm.setPrev(false);
				pm.setNext(true);
			} else if (pm.getLastblock() == pm.getCurrentblock()) { // 마지막 블록이 현재 블록일 때 다음블록 화살표는 안보임
				pm.setPrev(true);
				pm.setNext(false);
			} else {
				pm.setPrev(true);
				pm.setNext(true);
			}
			pm.setStartrow(pagenum, contentnum);
			pm.setEndrow(pagenum, contentnum);
			System.out.println("시작끝" + pm.getStartrow() + "/" + pm.getEndrow());
			List<RecipeInfoDto> recommendrecipe = infodao.allrecipeList(pm.getStartrow(), pm.getEndrow());

			request.setAttribute("recommendrecipe", recommendrecipe);
			request.setAttribute("pm", pm);

			dispatch(request, response, "categoryrecipe.jsp");

		}
		// 카테고리별 요리보기
		else if (command.equals("categoryrecipe")) {
			String nation_nm = request.getParameter("cookcountry");
			String ty_nm = request.getParameter("cooktype");
			String cooking_time = request.getParameter("cooktime");

			RecipeInfoDao infodao = new RecipeInfoDao();
			System.out.println("컨트롤런데요" + nation_nm + "/" + ty_nm + "/" + cooking_time);

			request.setAttribute("pagingc", nation_nm);
			request.setAttribute("pagingp", ty_nm);
			request.setAttribute("pagingt", cooking_time);

			int pagenum = Integer.parseInt(request.getParameter("pagenum"));// 현재페이지
			int contentnum = Integer.parseInt(request.getParameter("contentnum"));// 한페이지에 보이는 게시글 갯수
			System.out.println("page,content" + pagenum + contentnum);
			int totalcount = infodao.selectcategoryCount(nation_nm, ty_nm, cooking_time);
			PageMaker pm = new PageMaker();
			pm.setTotalcount(totalcount);
			pm.setContentnum(contentnum);
			pm.setPagenum(pagenum);
			pm.setCurrentblock(pagenum);
			pm.setLastblock(totalcount);
			pm.setStartPage(pm.getCurrentblock());
			pm.setEndPage(pm.getLastblock(), pm.getCurrentblock());

			if (pagenum > 0 && pagenum < 6) { // 페이지블록이 1일 때는 이전페이지로가는 화살표 안보임
				pm.setPrev(false);
				pm.setNext(true);
			} else if (pm.getLastblock() == pm.getCurrentblock()) { // 마지막 블록이 현재 블록일 때 다음블록 화살표는 안보임
				pm.setPrev(true);
				pm.setNext(false);
			} else {
				pm.setPrev(true);
				pm.setNext(true);
			}
			pm.setStartrow(pagenum, contentnum);
			pm.setEndrow(pagenum, contentnum);
			System.out.println("시작끝" + pm.getStartrow() + "/" + pm.getEndrow());
			List<RecipeInfoDto> recommendrecipe = infodao.selectcategoryList(pm.getStartrow(), pm.getEndrow(),
					nation_nm, ty_nm, cooking_time);

			request.setAttribute("recommendrecipe", recommendrecipe);
			request.setAttribute("pm", pm);

			dispatch(request, response, "categoryrecipe2.jsp");

		} // 요리검색
		else if (command.equals("reciperesearch")) {
			String recipe_nm_ko = request.getParameter("recipe_nm_ko_search");
			System.out.println(recipe_nm_ko);

			RecipeInfoDao infodao = new RecipeInfoDao();

			int pagenum = Integer.parseInt(request.getParameter("pagenum"));// 현재페이지
			int contentnum = Integer.parseInt(request.getParameter("contentnum"));// 한페이지에 보이는 게시글 갯수
			System.out.println("page,content" + pagenum + contentnum);
			int totalcount = infodao.selectLikeFoodCount(recipe_nm_ko);
			PageMaker pm = new PageMaker();
			pm.setTotalcount(totalcount);
			pm.setContentnum(contentnum);
			pm.setPagenum(pagenum);
			pm.setCurrentblock(pagenum);
			pm.setLastblock(totalcount);
			pm.setStartPage(pm.getCurrentblock());
			pm.setEndPage(pm.getLastblock(), pm.getCurrentblock());

			if (pagenum > 0 && pagenum < 6) { // 페이지블록이 1일 때는 이전페이지로가는 화살표 안보임
				pm.setPrev(false);
				pm.setNext(true);
			} else if (pm.getLastblock() == pm.getCurrentblock()) { // 마지막 블록이 현재 블록일 때 다음블록 화살표는 안보임
				pm.setPrev(true);
				pm.setNext(false);
			} else {
				pm.setPrev(true);
				pm.setNext(true);
			}
			pm.setStartrow(pagenum, contentnum);
			pm.setEndrow(pagenum, contentnum);
			System.out.println("시작끝" + pm.getStartrow() + "/" + pm.getEndrow());
			List<RecipeInfoDto> recommendrecipe = infodao.selectLikeFood(pm.getStartrow(), pm.getEndrow(),
					recipe_nm_ko);
			request.setAttribute("valforpaging", recipe_nm_ko);
			request.setAttribute("recommendrecipe", recommendrecipe);
			request.setAttribute("pm", pm);

			dispatch(request, response, "recipesearch.jsp");
		} // 모든레시피보기
		else if (command.equals("allrecipe")) {
			RecipeInfoDao infodao = new RecipeInfoDao();

			int pagenum = Integer.parseInt(request.getParameter("pagenum"));// 현재페이지
			int contentnum = Integer.parseInt(request.getParameter("contentnum"));// 한페이지에 보이는 게시글 갯수
			System.out.println("page,content" + pagenum + contentnum);
			int totalcount = infodao.getCount();
			PageMaker pm = new PageMaker();
			pm.setTotalcount(totalcount);
			pm.setContentnum(contentnum);
			pm.setPagenum(pagenum);
			pm.setCurrentblock(pagenum);
			pm.setLastblock(totalcount);
			pm.setStartPage(pm.getCurrentblock());
			pm.setEndPage(pm.getLastblock(), pm.getCurrentblock());

			if (pagenum > 0 && pagenum < 6) { // 페이지블록이 1일 때는 이전페이지로가는 화살표 안보임
				pm.setPrev(false);
				pm.setNext(true);
			} else if (pm.getLastblock() == pm.getCurrentblock()) { // 마지막 블록이 현재 블록일 때 다음블록 화살표는 안보임
				pm.setPrev(true);
				pm.setNext(false);
			} else {
				pm.setPrev(true);
				pm.setNext(true);
			}
			pm.setStartrow(pagenum, contentnum);
			pm.setEndrow(pagenum, contentnum);
			System.out.println("시작끝" + pm.getStartrow() + "/" + pm.getEndrow());
			List<RecipeInfoDto> recommendrecipe = infodao.allrecipeList(pm.getStartrow(), pm.getEndrow());

			request.setAttribute("recommendrecipe", recommendrecipe);
			request.setAttribute("pm", pm);

			dispatch(request, response, "allrecipelist.jsp");
		} // 레시피작성하기
		else if (command.equals("recipeupload")) {

			LoginDto ldto = (LoginDto) request.getSession().getAttribute("ldto");
			// myrefrigerator.jsp에 있는 데이터리스트 태그안에 들어갈 모든 재료를 생성하기 위함
			RecipeMaterialDao materialdao = new RecipeMaterialDao();
			List<RecipeMaterialDto> list = materialdao.selectList();
			request.setAttribute("list", list);
			// datalist 레시피작성때 쓰기위해서
			dispatch(request, response, "upload.jsp");
		} // 마이페이지에서 내가등록한레시피보기
		else if (command.equals("myrecipelist")) {

			int pagenum = Integer.parseInt(request.getParameter("pagenum"));//현재페이지
		    int contentnum = Integer.parseInt(request.getParameter("contentnum"));//한페이지에 보이는 게시글 갯수
		    System.out.println("나의레시피 page,content"+pagenum+contentnum);
		    
		    LoginDto ldto = (LoginDto)request.getSession().getAttribute("ldto");
		    System.out.println(ldto.getId());
		    RecipeInfoDao infodao = new RecipeInfoDao();
	     	
	        int totalcount = infodao.getMyrecipeCount(ldto.getId());
	        System.out.println("여기여기여기"+totalcount);
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
	        
	    	List <RecipeInfoDto> infolist = infodao.userrecipeview(ldto.getId(),pm.getStartrow(),pm.getEndrow());
	     	

	        System.out.println("시작끝"+pm.getStartrow()+"/"+pm.getEndrow());
	        
	   
	        request.setAttribute("pm", pm);
	   	   	
	   	   	request.setAttribute("infolist", infolist);
	   	   	dispatch(request, response, "userecipeupload.jsp");
	    		
		    	
	     }

// 	  mypage 나의 레시피  삭제
		else if (command.equals("deleterecipe")) {
			System.out.println("deleterecipe 들어왔니?");
			LoginDto ldto = (LoginDto) request.getSession().getAttribute("ldto");

			int recipe_id = Integer.parseInt(request.getParameter("recipe_id"));
			System.out.println(recipe_id + "값이 뭐야?");

			RecipeInfoDao deleteDao = new RecipeInfoDao();
			deleteDao.deleteRecipe(recipe_id);

			dispatch(request, response, "mainloginboard.jsp");

		} 
		
//		핫레시피
		else if(command.equals("hotrecipe")) {
	         
			  LoginDto ldto = (LoginDto)request.getSession().getAttribute("ldto");
	          RecipeInfoDao infodao=new RecipeInfoDao();
	          List<RecipeInfoDto> recommendrecipe=infodao.selectHotRecipe();//아이디보내주고,요리3가지 보여주기
	          
	          request.setAttribute("recommendrecipe", recommendrecipe);//속성 set하고
	          
	          dispatch(request, response,"mainboard.jsp");
	          
	      }

	}

//	   

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
