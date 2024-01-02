package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.RecipeDAO;
import com.smhrd.model.RecipeVO;

public class RecipeSelect implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 선택된 값을 받아옵니다.
		  String food_name = request.getParameter("food_name");
		  System.out.println("food_name"+food_name);

		 
		// MemberVO객체 생성
		 System.out.println(food_name);
		  RecipeDAO dao = new RecipeDAO();
		  List<RecipeVO> recipeList = dao.RecipeSelect(food_name);
		  
		  System.out.println("사이즈 " +recipeList.size());
		  
		  ActionForward forward = null;
		  
		  if(recipeList != null) {
			  
			  forward = new ActionForward();
			  forward.setPath("RecipeMenu.jsp");
			  forward.setRedirect(false);
			  
			  
		  } else {
			  
			  	forward = new ActionForward();
				forward.setPath("Main.jsp");
				forward.setRedirect(true);
				
			}

		  return forward;
	}

}
