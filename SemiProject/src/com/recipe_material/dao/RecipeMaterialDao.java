package com.recipe_material.dao;

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


import com.recipe_material.dto.RecipeMaterialDto;

import common.JDBCTemplate;

public class RecipeMaterialDao extends JDBCTemplate {

	public int insert(List<RecipeMaterialDto> dtos) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		RecipeMaterialDao dao = new RecipeMaterialDao();
		dao.delete();
		String sql = " INSERT INTO RECIPE_MATERIAL VALUES(?,?,?,?,?,?) ";
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
		List<RecipeMaterialDto> list=session.selectList("recipe.mapper.selectList");
		Set<RecipeMaterialDto> set=new HashSet<RecipeMaterialDto>(list);
		List<RecipeMaterialDto> list2=new ArrayList<RecipeMaterialDto>(set);

		return list2;
	}
	
}