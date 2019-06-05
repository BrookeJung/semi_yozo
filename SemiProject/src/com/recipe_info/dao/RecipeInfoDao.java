package com.recipe_info.dao;


import java.sql.Connection;	
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.recipe_info.dto.RecipeInfoDto;

import common.JDBCTemplate;

public class RecipeInfoDao extends JDBCTemplate {
	
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
	}
	
}
