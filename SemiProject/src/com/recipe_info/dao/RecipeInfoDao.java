package com.recipe_info.dao;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;	
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.recipe_info.dto.RecipeInfoDto;
import com.recipe_material.dto.RecipeMaterialDto;

import common.JDBCTemplate;

public class RecipeInfoDao extends JDBCTemplate {
	//재료db저장용
	public int insert(List<RecipeInfoDto> dtos) {
		int res=0;
		Connection con=getConnection();
		PreparedStatement pstm=null;
		RecipeInfoDao dao=new RecipeInfoDao();
		dao.delete();
		String sql="INSERT INTO RECIPE_INFO VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,'N',0)";
		try {
			pstm=con.prepareStatement(sql);
			for(int i=0;i<dtos.size();i++) {
			RecipeInfoDto dto=dtos.get(i);
			pstm.setInt(1, dto.getRecipe_id());
			pstm.setString(2, dto.getRecipe_nm_ko());
			pstm.setString(3, dto.getSumry());
			pstm.setInt(4, dto.getNation_code());
			pstm.setString(5, dto.getNation_nm());
			pstm.setInt(6, dto.getTy_code());
			pstm.setString(7, dto.getTy_nm());
			pstm.setString(8, dto.getCooking_time());
			pstm.setString(9, dto.getCalorie());
			pstm.setString(10, dto.getQnt());
			pstm.setString(11, dto.getLevel_nm());
			pstm.setString(12, dto.getIrdnt_code());
			pstm.setString(13, dto.getImg_url());
			pstm.setString(14, dto.getDet_url());

			pstm.addBatch();
			
			}
			int[] result=pstm.executeBatch();
			for(int i=0;i<result.length;i++) {
				if(result[i]==-2) {
					res++;
				}
			}
			System.out.println(res);
			
			if(res==dtos.size()) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}
	//재료db초기화용
	public int delete() {
		int res=0;
		Connection con=getConnection();
		PreparedStatement pstm=null;
		String sql="DELETE FROM RECIPE_INFO";
		try {
			pstm=con.prepareStatement(sql);
		
			res=pstm.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstm);
			close(con);
		}
		return res;
	}public List<RecipeInfoDto> selectRecommend(String id) {//id받고 해당사용자의 냉장고db에 접근해야되기떄문에
		String resource = "com/recipe/db/recipe-config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		List<RecipeInfoDto> recommendrecip=session.selectList("recipe.mapper.selectrecommend",id);
		//mapper에서 실행하면 냉장고 재료가 가장많이 포함된 recipeid 3개를 찾아서   그 해당 recipe_id의  select* 결과가 3줄쫙옴 그것을 리스트에 담는다.

		return recommendrecip;
	}
	
	
	public RecipeInfoDto selectrecipeview(int recipe_id) {
		String resource = "com/recipe/db/recipe-config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		RecipeInfoDto infodto=session.selectOne("recipe.mapper.selectrecipeview",recipe_id);//결과가 한줄이기떄문에 .selectOne
				
	

		return infodto;
	}
	
	
}
