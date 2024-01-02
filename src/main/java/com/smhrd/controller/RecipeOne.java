package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.RecipeDAO;
import com.smhrd.model.RecipeVO;

public class RecipeOne implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		 String food_name = request.getParameter("food_name");
		  System.out.println("food_name : "+food_name);

		 
		// MemberVO객체 생성
		  RecipeDAO dao = new RecipeDAO();
		  List<RecipeVO> vo = dao.RecipeOne(food_name);
		  
		  
		  ActionForward forward = null;
		  
		  if(vo != null) {
			  
			  forward = new ActionForward();
			  forward.setPath("RecipeDetail2.jsp");
			  forward.setRedirect(false);
			  
			  
		  } else {
			  
			  	forward = new ActionForward();
				forward.setPath("Main.jsp");
				forward.setRedirect(true);
				
			}

		  return forward;

		

	}

}
