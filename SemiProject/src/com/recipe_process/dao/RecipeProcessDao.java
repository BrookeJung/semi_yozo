package com.recipe_process.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.recipe_process.dto.RecipeProcessDto;

import common.JDBCTemplate;

public class RecipeProcessDao extends JDBCTemplate {
	
	public int insert(List<RecipeProcessDto> dtos) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
//		실행할때마다 삭제후 추가
		RecipeProcessDao dao = new RecipeProcessDao();
		dao.delete();

		String sql = " INSERT INTO RECIPE_PROCESS VALUES(?,?,?,?,?) ";
		
//		결과 값 받을 배열
		int [] cnt = null;
		
		try {
			pstm = con.prepareStatement(sql);
			

			for (int i = 0; i < dtos.size(); i++) {
				RecipeProcessDto dto = dtos.get(i);

				pstm.setInt(1, dto.getRecipe_id());
				pstm.setInt(2, dto.getCooking_no());
				pstm.setString(3, dto.getCooking_dc());
				pstm.setString(4, dto.getStre_step_image_url());
				pstm.setString(5, dto.getSter_tip());

//				메모리에 적재후, executeBatch() 메소드가 호출 될때 한꺼번에 실행!
				pstm.addBatch();
				
			}
			System.out.println("3.query 준비" + sql);
//			res = pstm.executeUpdate();
//			int[]로 리턴
			cnt = pstm.executeBatch();
			
			System.out.println("4.query 실행 ");
			 //-2는 성공, -3은 실패
	         for(int i=0;i<cnt.length;i++) {
	            if(cnt[i] == -2) {
	               res++;
	            }
	         }
	         
	         //실패한게 없을 경우
	         if(res==dtos.size()) {
	            commit(con);
	         }else {
	            rollback(con);
	         }

		} catch (SQLException e) {
			System.out.println("4.query 에러");
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
		
		String sql = " DELETE FROM RECIPE_PROCESS ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("3.query 준비");
			
			res = pstm.executeUpdate();
			
			if(res > 0) {
				commit(con);
			}
			System.out.println("4.query 실행");
		} catch (SQLException e) {
			System.out.println("4.query 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db종료");
		}
		
		return res;
	}

}
