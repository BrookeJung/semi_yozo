package com.zzim.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.zzim.db.SqlMapConfig;
import com.zzim.dto.ZzimDto;

public class ZzimDao extends SqlMapConfig {
	
	String namespace = "zzim.mapper.";
	SqlMapConfig sqlmapconfig = new SqlMapConfig();
	
	public int zzimInsert(ZzimDto dto) {
		int res =0;
		SqlSession session =null;
		Map<String,Object> map = new HashMap<>();
		map.put("id",dto.getId());
		map.put("recipe_id", dto.getRecipe_id());
		map.put("recipe_nm_ko", dto.getRecipe_nm_ko());
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"zzimInsert",map);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}
	
	public List<ZzimDto> zzimList(String id){
		
		SqlSession session = null;
		List<ZzimDto> list = new ArrayList<ZzimDto>();
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"zzimList",id);
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public int zzimDelete(int seq) {
		int res =0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"zzimDelete",seq);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}
	
	public String getreciName(int recipe_id) {
		String RECIPE_NM="";
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession();
			RECIPE_NM = session.selectOne(namespace+"getName",recipe_id);
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			session.close();			
		}
		
		return RECIPE_NM;
	}
	
	public int zzimmuldel(String[] seqArr) {
		int res = 0;
		SqlSession session = null;

		Map<String,Object> map = new HashMap<>();
		map.put("seqArr", seqArr);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"muldel", map);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}
	
	
}
