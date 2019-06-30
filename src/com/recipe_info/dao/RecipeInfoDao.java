package com.recipe_info.dao;


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

import com.recipe_info.dto.RecipeInfoDto;
import com.recipe_material.dto.RecipeMaterialDto;
import com.refrigerator.dto.RefrigeratorDto;

import common.JDBCTemplate;

public class RecipeInfoDao extends JDBCTemplate {
	//재료db저장용
	public int insert(List<RecipeInfoDto> dtos) {
		 int res=0;
	      Connection con=getConnection();
	      PreparedStatement pstm=null;
	      RecipeInfoDao dao=new RecipeInfoDao();
	      dao.delete();
	      String sql="INSERT INTO RECIPE_INFO VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,null)";
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
	         pstm.setInt(8, dto.getCooking_time());
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
		
	}//사용자 id받아서 냉장고재료를 가장많이 가지고있는 요리 출력
	public List<RecipeInfoDto> selectRecommend(String id) {//id받고 해당사용자의 냉장고db에 접근해야되기떄문에
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
	
	//자세히보기용 함수
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
	}public List <RecipeInfoDto> selectLikeFood(int begin,int end,String recipe_nm_ko) {
	      String resource = "com/recipe/db/recipe-config.xml";
	      InputStream inputStream = null;
	      Map<String,Object> map =new HashMap<>();
	  	  map.put("begin", begin);
	  	  map.put("end",end);
	      map.put("recipe_nm_ko", recipe_nm_ko);
	      try {
	         inputStream = Resources.getResourceAsStream(resource);
	      } catch (IOException e) {
	         
	         e.printStackTrace();
	      }
	      SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	      SqlSession session = sqlSessionFactory.openSession();
	      List <RecipeInfoDto> selectLikeFood = session.selectList("recipe.mapper.selectLikeFood",map);//결과가 한줄이기떄문에 .selectOne
	      
	      return selectLikeFood;
	   }

	public int selectLikeFoodCount(String recipe_nm_ko) {
		int cnt=0;
	      String resource = "com/recipe/db/recipe-config.xml";
	      InputStream inputStream = null;
	      
	      try {
	         inputStream = Resources.getResourceAsStream(resource);
	      } catch (IOException e) {
	         
	         e.printStackTrace();
	      }
	      SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	      SqlSession session = sqlSessionFactory.openSession();
	      cnt = session.selectOne("recipe.mapper.selectLikeFoodCount",recipe_nm_ko);//결과가 한줄이기떄문에 .selectOne
	      System.out.println("다오의 서치카운트 !"+cnt);
	      return cnt;
	   }
	
	//레시피등록시 내가 입력한 요리정보들 디비에 저장됨
	public int insertrecipe(RecipeInfoDto dto) {
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
			res=session.insert("recipe.mapper.insertrecipe", dto);//요기
			if(res>0) {
				session.commit();
			}
			session.close();
			return res;
			
			
			
			
			
		}

	public int getCount() {
			int cnt=0;
			String resource = "com/recipe/db/recipe-config.xml";
			InputStream inputStream =null;
			SqlSession session = null;
			try {
				inputStream = Resources.getResourceAsStream(resource);
				SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
				session = sqlSessionFactory.openSession();
				cnt = session.selectOne("recipe.mapper.selectCount",null);
				
			} catch (IOException e) {
				
				e.printStackTrace();
			}finally {
				session.close();
			}
		
			return cnt;
		}
		//카테고리 요리보고 페이징포함
		public int selectcategoryCount(String nation_nm,String ty_nm,String cooking_time) {
			int cnt=0;
			String resource = "com/recipe/db/recipe-config.xml";
			InputStream inputStream =null;
			SqlSession session = null;
			 Map<String, Object> map = new HashMap<String, Object>();
			 map.put("nation_nm", nation_nm);
			 map.put("ty_nm", ty_nm);
			 map.put("cooking_time", cooking_time);
			try {
				inputStream = Resources.getResourceAsStream(resource);
				SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
				session = sqlSessionFactory.openSession();
				cnt = session.selectOne("recipe.mapper.selectcategoryCount",map);
				System.out.println("셀렉카운트다오에선!"+cnt);
			} catch (IOException e) {
				
				e.printStackTrace();
			}finally {
				session.close();
			}
			return cnt;
		}
		
		
		//모든레시피누르면 페이징 하기위한것
		public List<RecipeInfoDto> allrecipeList(int begin,int end) {
			String resource = "com/recipe/db/recipe-config.xml";
			Map<String,Integer> map = new HashMap<String, Integer>();
			map.put("begin", begin);
			map.put("end", end);
			InputStream inputStream = null;
			try {
				inputStream = Resources.getResourceAsStream(resource);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sqlSessionFactory.openSession();
			List<RecipeInfoDto> recommendrecip=session.selectList("recipe.mapper.allrecipeList",map);
			//mapper에서 실행하면 냉장고 재료가 가장많이 포함된 recipeid 3개를 찾아서   그 해당 recipe_id의  select* 결과가 3줄쫙옴 그것을 리스트에 담는다.
			
			return recommendrecip;
		}
		
		public List<RecipeInfoDto> selectcategoryList(int begin,int end,String nation_nm,String ty_nm,String cooking_time ){ 
			String resource = "com/recipe/db/recipe-config.xml";
			InputStream inputStream = null;
			try {
				inputStream = Resources.getResourceAsStream(resource);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			System.out.println("다오단");
		
	    	
	    	
			 Map<String, Object> map = new HashMap<String, Object>();
			 map.put("nation_nm", nation_nm);
			 map.put("ty_nm", ty_nm);
			 map.put("cooking_time",cooking_time );
			 map.put("begin", begin);
			 map.put("end", end);
			 

			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sqlSessionFactory.openSession();
			List<RecipeInfoDto> infodto=session.selectList("recipe.mapper.selectcategoryList",map);
			
			System.out.println("다오에서받은갯수가 ?!"+infodto.size());
			//mapper에서 실행하면 냉장고 재료가 가장많이 포함된 recipeid 3개를 찾아서   그 해당 recipe_id의  select* 결과가 3줄쫙옴 그것을 리스트에 담는다.

			return infodto;//recommendrecip;
		}
		
		public int recireadCount (int recipe_id) {
			int res =0;
			String resource = "com/recipe/db/recipe-config.xml";
			InputStream inputStream = null;
			SqlSession session= null;
			try {
				inputStream = Resources.getResourceAsStream(resource);
				SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
				session = sqlSessionFactory.openSession(false);
				res=session.update("recipe.mapper.recireadCount",recipe_id);
				if(res>0) {
					System.out.println("카운트 ++ 돼었음 !! ");
					session.commit();
				}
			} catch (IOException e) {
				session.rollback();
				e.printStackTrace();
			} finally {
				session.close();
				
			}
			
			
			return res;
		}
//		//내가등록한 레시피(정보)
//		public List <RecipeInfoDto> userrecipeview(String id) {
//			String resource = "com/recipe/db/recipe-config.xml";
//			InputStream inputStream = null;
//		
//			try {
//				inputStream = Resources.getResourceAsStream(resource);
//			} catch (IOException e) {
//				
//				e.printStackTrace();
//			}
//			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//			System.out.println("dao에서유저아이디1"+id);
//			SqlSession session = sqlSessionFactory.openSession();
//			System.out.println("dao에서유저아이디2"+id);
//			List <RecipeInfoDto> infodtolist=session.selectList("recipe.mapper.userrecipeview",id);//결과가 한줄이기떄문에 .selectOne
//			System.out.println("dao에서유저아이디3"+id);		
//		
//
//			return infodtolist;
//		}
		
		//내가등록한 레시피(정보)
				public List <RecipeInfoDto> userrecipeview(String idz,int begin,int end) {
					String resource = "com/recipe/db/recipe-config.xml";
					InputStream inputStream = null;
					Map<String,Object> map = new HashMap<>();
					List<RecipeInfoDto> infodtolist = new ArrayList<RecipeInfoDto>();
					SqlSession session  = null;
					map.put("id", idz);
					map.put("begin", begin);
					map.put("end", end);
					System.out.println("다오에서???"+idz+begin+end);
					try {
						inputStream = Resources.getResourceAsStream(resource);
						SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
						session = sqlSessionFactory.openSession();
						infodtolist=session.selectList("recipe.mapper.userrecipeview",map);//결과가 한줄이기떄문에 .selectOne
						
					} catch (IOException e) {
						
						e.printStackTrace();
					} finally {
						session.close();
					}

					return infodtolist;
				}
		
//		마이페이지 레시피 삭제 
		public int deleteRecipe(int recipe_id){	
		int res = 0;
		String resource = "com/recipe/db/recipe-config.xml";
		InputStream inputStream = null;
		System.out.println("들어왔니?");
	
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
		SqlSession session = sqlSessionFactory.openSession();
		res=session.delete("recipe.mapper.deleteRecipe",recipe_id);//결과가 한줄이기떄문에 .selectOne
		System.out.println("끝났니?");
		if(res>0) {
			session.commit();
		}
		session.close();
		
		return res;
	}
		
//		페이징
		public int getMyrecipeCount(String id) {
			int cnt=0;
			String resource = "com/recipe/db/recipe-config.xml";
			InputStream inputStream = null;
			SqlSession session = null;
			Map<String,String> map = new HashMap<>();
			map.put("id", id);
			try {
				inputStream = Resources.getResourceAsStream(resource);
				SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
				session = sqlSessionFactory.openSession();
				cnt = session.selectOne("recipe.mapper.selectmyreciCount",map);
				System.out.println("셀렉마이레씨카운트 다오에서!"+cnt);
			} catch (IOException e) {
				
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			
			return cnt;
		}
//      핫 레시피
      public List <RecipeInfoDto> selectHotRecipe() {
            String resource = "com/recipe/db/recipe-config.xml";
            InputStream inputStream = null;
         
            try {
               inputStream = Resources.getResourceAsStream(resource);
            } catch (IOException e) {
               
               e.printStackTrace();
            }
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
         
            SqlSession session = sqlSessionFactory.openSession();
            
            List <RecipeInfoDto> infodtolist=session.selectList("recipe.mapper.selectHotRecipe");//결과가 한줄이기떄문에 .selectOne
            
         

            return infodtolist;
         }
		
	   
	
}
