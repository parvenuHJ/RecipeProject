package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.RelikeDAO;
import com.smhrd.model.RelikeVO;

public class RelikeDelete implements Command {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
       
      
        String mem_id = request.getParameter("mem_id");
         String re_code = request.getParameter("re_code");
         System.out.println("mem_id:"+mem_id);
         System.out.println("re_code:"+re_code);
         
         
         RelikeVO vo = new RelikeVO(mem_id , re_code);
         RelikeDAO dao = new RelikeDAO(); 
         int cnt = dao.RelikeDelete(vo);
         
         ActionForward forward = null;
         
      if (cnt > 0) {
         System.out.println("삭제 성공!");
               
            forward = new ActionForward();
            forward.setPath("Relike.jsp");
            forward.setRedirect(false);
         
         
         return forward;
      
      } else {
         System.out.println("삭제 실패...");
         forward = new ActionForward();
         forward.setRedirect(false);

         return forward;
      }
      
      
      
      
   }

} 