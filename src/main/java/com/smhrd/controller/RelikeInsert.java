package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.RelikeDAO;
import com.smhrd.model.RelikeVO;



		public class RelikeInsert implements Command {

		   @Override
		   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		      String mem_id = request.getParameter("mem_id");
		      String re_code = request.getParameter("re_code");
		      System.out.println("mem_id:"+mem_id);
		      System.out.println("re_code:"+re_code);
		      
		      
		      RelikeVO vo = new RelikeVO(mem_id , re_code);
		      RelikeDAO dao = new  RelikeDAO(); 
		      int cnt   = dao.RelikeInsert(vo);
		      ActionForward forward = null;
		      
		      PrintWriter out;
				try {
					out = response.getWriter();
					out.print(cnt);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				

		      return null;
		      
		      
		}
		
	

}
