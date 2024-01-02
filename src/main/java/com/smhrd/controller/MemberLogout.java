package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;

public class MemberLogout implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(); 
		
		session.removeAttribute("loginVO");
			
		//	session.invalidate();
		ActionForward forward = null;
	
			forward = new ActionForward();
			forward.setPath("Main.jsp");
			forward.setRedirect(false);
		
		
		return forward;
		
	}

}
