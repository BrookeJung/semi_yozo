package com.muldel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muldel.dto.MdBoardDto;
import static common.JDBCTemplate.*;

public class MdBoardDao{
	public List<MdBoardDto> selectList(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs  = null;
		
		List<MdBoardDto> list = new ArrayList<MdBoardDto>();
		
		String sql = "SELECT * FROM MDBOARD";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. 쿼리 준비"+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. 실행 준비 및 리턴");
			while(rs.next()) {
				MdBoardDto dto = new MdBoardDto();
				dto.setSeq(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegdate(rs.getDate(5));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. 디비 종료");
		}
		
		return list;
	}
	
	public MdBoardDto selectOne(int seq) {
		Connection con=getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		MdBoardDto dto = new MdBoardDto();
		
		String sql="SELECT * FROM MDBOARD WHERE SEQ=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				dto.setSeq(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegdate(rs.getDate(5));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return dto;
	}
	
	public int insert(MdBoardDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int rs =0;
		
		String sql="INSERT INTO MDBOARD VALUES(MDBOARDSEQ.NEXTVAL, ?,?,?,SYSDATE)";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1,dto.getWriter());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			
			rs = pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		return rs;
	}
	
	public int update(MdBoardDto dto) {
		Connection con=getConnection();
		PreparedStatement pstm = null;
		int rs =0;
		
		String sql=" UPDATE MDBOARD SET TITLE=?, CONTENT=? WHERE SEQ=? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getSeq());
			
			rs = pstm.executeUpdate();
			
			if(rs>0) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		return rs;
	}
	
	public int delete(int seq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int rs = 0;
		
		String sql="DELETE FROM MDBOARD WHERE SEQ=?";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			
			rs = pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		return rs;
	}
	
	public int multiDelete(String[] seq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql="DELETE FROM MDBOARD WHERE SEQ=?";
		
		//결과 값 받을 배열
		int[] cnt = null;
		
		try {
			pstm = con.prepareStatement(sql);
			for(int i=0;i<seq.length;i++) {
				pstm.setString(1, seq[i]);
				
				//메모리에 적재 후, executeBatch() 메소드가 호출 될 때 한꺼번에 실행!
				pstm.addBatch();
				System.out.println("삭제할 번호:"+seq[i]);
			}
			System.out.println("03. 쿼리 준비");
			
			//int[]로 리턴(delete된 갯수가 배열에 담겨서 return된다)
			cnt = pstm.executeBatch();
			System.out.println("04. query 실행 및 리턴");
			
			//-2는 성공, -3은 실패
			for(int i=0;i<cnt.length;i++) {
				if(cnt[i] == -2) {
					res++;
				}
			}
			
			//실패한게 없을 경우
			if(res==seq.length) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		
		return res;
	}
	
}
