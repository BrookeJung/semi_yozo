package com.payment.dto;

import java.util.Date;

public class PaymentDto {
   private int payseq;
   private String id;   //userid
   private String mater;
   private int price;
   private Date paydate;
   private String place;
   
   public PaymentDto() {
      
   }
   
   public PaymentDto(int payseq, String id, String mater, int price, Date paydate, String place) {
      super();
      this.payseq = payseq;
      this.id = id;
      this.mater = mater;
      this.price = price;
      this.paydate = paydate;
      this.place = place;
   }
   public int getPayseq() {
      return payseq;
   }
   public void setPayseq(int payseq) {
      this.payseq = payseq;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getMater() {
      return mater;
   }
   public void setMater(String mater) {
      this.mater = mater;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public Date getPaydate() {
      return paydate;
   }
   public void setPaydate(Date paydate) {
      this.paydate = paydate;
   }
   public String getPlace() {
      return place;
   }
   public void setPlace(String place) {
      this.place = place;
   }
   
   
}