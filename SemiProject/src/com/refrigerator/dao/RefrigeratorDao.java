package com.refrigerator.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.recipe.db.SqlMapConfig;
import com.refrigerator.dto.RefrigeratorDto;

public class RefrigeratorDao extends SqlMapConfig {
	
	public int insertRefrigerator(RefrigeratorDto dto) {
		int res=0;
		System.out.println("끅");
		String resource = "com/recipe/db/recipe-config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		res=session.insert("recipe.mapper.insertRefrigerator", dto);
		if(res>0) {
			session.commit();
		}
		session.close();
		return res;
		
		
		
		
		
	}

}
