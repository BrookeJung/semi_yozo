package com.payment.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.payment.db.SqlMapConfig;
import com.payment.dto.PaymentDto;

public class PaymentDao extends SqlMapConfig {
   String namespace = "payment.mapper.";
   SqlMapConfig sqlmapconfig = new SqlMapConfig();
   
   public int payInsert(PaymentDto dto) {
      int res =0;
      SqlSession session =null;
      Map<String,Object> map = new HashMap<>();
      map.put("payseq", dto.getPayseq());
      map.put("id", dto.getId());
      map.put("mater", dto.getMater());
      map.put("price", dto.getPrice());
      map.put("paydate", dto.getPaydate());
      map.put("place", dto.getPlace());
      
      try {
         session = getSqlSessionFactory().openSession(false);
         res = session.insert(namespace+"payInsert",map);
         if(res>0) {
            session.commit();
            System.out.println("확인");
         }
      } catch (Exception e) {
         session.rollback();
         e.printStackTrace();
         System.out.println("이건오류");
      } finally {
         session.close();
         System.out.println("된다");
      }
      
      return res;
   }
   
   public List<PaymentDto> payList(String id){
      
      SqlSession session = null;
      List<PaymentDto> list = new ArrayList<PaymentDto>();
      try {
         session = getSqlSessionFactory().openSession();
         list = session.selectList(namespace+"payList",id);
      } catch (Exception e) {
         
         e.printStackTrace();
      } finally {
         session.close();
      }
      return list;
   }
   
   public int payDelete(int seq) {
      int res =0;
      SqlSession session = null;
      
      try {
         session = getSqlSessionFactory().openSession(false);
         res = session.delete(namespace+"payDelete",seq);
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
   
   public int paymuldel(String[] seqArr) {
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