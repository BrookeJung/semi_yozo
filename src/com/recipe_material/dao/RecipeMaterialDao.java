package com.recipe_material.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import com.recipe_material.dto.RecipeMaterialDto;

import common.JDBCTemplate;

public class RecipeMaterialDao extends JDBCTemplate {
	//json db저장용
	public int insert(List<RecipeMaterialDto> dtos) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		RecipeMaterialDao dao = new RecipeMaterialDao();
		dao.delete();
		String sql = " INSERT INTO RECIPE_MATERIAL VALUES(?,?,?,?,?,?,0) ";
		try {
			pstm = con.prepareStatement(sql);
			for (int i = 0; i < dtos.size(); i++) {
				RecipeMaterialDto dto = dtos.get(i);

				pstm.setInt(1, dto.getRecipe_id());
				pstm.setInt(2, dto.getIrdnt_sn());
				pstm.setString(3, dto.getIrdnt_nm());
				pstm.setString(4, dto.getIrdnt_cpcty());
				pstm.setString(5, dto.getIrdnt_ty_code());
				pstm.setString(6, dto.getIrdnt_ty_nm());
				pstm.addBatch();
			}

			int[] result=pstm.executeBatch();

	         for(int i=0;i<result.length;i++) {
	            if(result[i] == -2) {
	               res++;
	            }
	         }

	         if(res==dtos.size()) {
	            commit(con);
	         }else {
	            rollback(con);
	         }

		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}

		return res;
	}
	//재료 db저장할떄 리셋용
	public int delete() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " DELETE FROM RECIPE_MATERIAL";
		
		try {
			pstm = con.prepareStatement(sql);
			
			
			res = pstm.executeUpdate();
			
			if(res > 0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			
		}
		
		return res;
	}

	
	//mybatis datalist 재료 넣기
	public List<RecipeMaterialDto> selectList() {
		String resource = "com/recipe/db/recipe-config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeMaterialDto> list=session.selectList("recipe.mapper.selectList");//session.(자동완성)하면 인수를 받는 메소드가 잇고 없는 메소드가 잇음 메소드가 필요하면 위에서 parameter추가하고
																					//selectList("",요기다가 파라미터써주면 mapper로 가져감) 값이 여러줄 나오면 무조건 .selectList 한줄만 나오면 .selectOne
		//중복을 제거하기 위해서 다시 set에 담고 다시 list로 보내 리턴한다
		Set<RecipeMaterialDto> set=new HashSet<RecipeMaterialDto>(list);
		List<RecipeMaterialDto> list2=new ArrayList<RecipeMaterialDto>(set);

		return list2;
	}//레ㅔ시피등록때 나의 레시피의 재료들 저장됨
	public int insertMaterial(RecipeMaterialDto dto) {
	      int res=0;
	      String resource = "com/recipe/db/recipe-config.xml";
	      InputStream inputStream = null;
	      try {
	         inputStream = Resources.getResourceAsStream(resource);
	      } catch (IOException e) {
	         
	         e.printStackTrace();
	      }
	      SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	      SqlSession session = sqlSessionFactory.openSession();
	      res = session.insert("recipe.mapper.insertMaterial", dto);//요기
	      if(res>0) {
	         session.commit();
	      }
	      session.close();
	      return res;
	            

	   }
	//자세히보기용
	public List<RecipeMaterialDto> selectmaterialview(int recipe_id) {//여러줄이니 List
		String resource = "com/recipe/db/recipe-config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeMaterialDto> materiallist=session.selectList("recipe.mapper.selectmaterialview",recipe_id);
		
		

		return materiallist;
	}//내가등록한 레시피(재료)조회
	public List<RecipeMaterialDto> userrecipematerialview() {
		String resource = "com/recipe/db/recipe-config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeMaterialDto> userrecipemateriallist = session.selectList("recipe.mapper.userrecipematerialview");
		
		

		return userrecipemateriallist;
	}
	public List<RecipeMaterialDto> selectorderlist(int recipe_id, String id) {//추천 레시피(recipe_id) 내(id) 냉장고
		String resource = "com/recipe/db/recipe-config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> selectorderlist = new HashMap<String, Object>();
		selectorderlist.put("recipe_id", recipe_id);
		selectorderlist.put("id", id);
		
		List<RecipeMaterialDto> ordermaterial = session.selectList("recipe.mapper.selectorderlist",selectorderlist);
		
		return ordermaterial;
	}
	
}
