package com.refrigerator.dao;

import java.io.IOException;	
import java.io.InputStream;
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

import com.recipe.db.SqlMapConfig;
import com.recipe_material.dto.RecipeMaterialDto;
import com.refrigerator.dto.RefrigeratorDto;



public class RefrigeratorDao extends SqlMapConfig {
	
	public int insertRefrigerator(RefrigeratorDto dto) {//for문 길이만큼 여기계속들어옴  저dto파라미터가 밑에 session.insert로 들감 !
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
		res=session.insert("recipe.mapper.insertRefrigerator", dto);//요기
		if(res>0) {
			session.commit();
		}
		session.close();
		return res;
		
		
		
		
		
	}public List<RefrigeratorDto> selectRefrigeratorList(String id) {//던진 id 다시받고
		
		
		String resource = "com/recipe/db/recipe-config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		List<RefrigeratorDto> myrefrigerator=session.selectList("recipe.mapper.selectmyrefrigeratorlist", id);//id받아서 보냄 mapper로 parametertype String
			

		return myrefrigerator;
	}
	

}
