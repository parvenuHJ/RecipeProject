package com.smhrd.model;


import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class RelikeVO {
   
   private String mem_id;
   private String re_code;
   public RelikeVO(String mem_id, String re_code) {
      this.mem_id = mem_id;
      this.re_code = re_code;
   }
   
   
   

}