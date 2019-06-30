package com.payment.biz;

import java.util.List;

import com.payment.dao.PaymentDao;
import com.payment.dto.PaymentDto;

public class PaymentBiz {
   private PaymentDao dao = new PaymentDao();
   
   public int payInsert(PaymentDto dto) {
      return dao.payInsert(dto);
   }
   
   public List<PaymentDto> payList(String id){
      return dao.payList(id);
   }
   
   public int payDelete(int seq) {
      return dao.payDelete(seq);
   }
   
   public int paymuldel(String[] seqArr) {
      return dao.paymuldel(seqArr);
   }
}