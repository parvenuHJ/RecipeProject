package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.IngreSelectDAO;
import com.smhrd.model.IngreSelectVO;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.RecipeVO;

public class RecipeIngreSelect implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		
		String input1 = request.getParameter("input1");
		String input2 = request.getParameter("input2");
		String input3 = request.getParameter("input3");
		String input4 = request.getParameter("input4");
		String input5 = request.getParameter("input5");
		String input6 = request.getParameter("input6");
		
		System.out.println(input1 + input2 + input3 + input4 + input5 + input6);
		
		
		IngreSelectDAO dao = new IngreSelectDAO();
		
		IngreSelectVO vo = new IngreSelectVO(input1, input2, input3, input4, input5, input6);
		
		 List<RecipeVO> IngreSelectList = dao.IngreSelect(vo);
		  
		  System.out.println("사이즈 " +IngreSelectList.size());
		  
		  ActionForward forward = null;
		  
		  if(IngreSelectList != null) {
			  
			  forward = new ActionForward();
			  forward.setPath("IngreSelectRecipe.jsp");
			  forward.setRedirect(false);
			  
			  
		  } else {
			  
			  	forward = new ActionForward();
				forward.setPath("Main.jsp");
				forward.setRedirect(true);
				
			}

		  return forward;
	}

}
