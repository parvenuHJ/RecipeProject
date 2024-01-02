package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.MemberDAO;

public class MemberDelete implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		String mem_id = request.getParameter("mem_id");
		System.out.println("넘어온 아이디 : " + mem_id);
		HttpSession session = request.getSession(); 

		// 2. MemberDAO -> deleteMember();

		int cnt = new MemberDAO().MemberDelete(mem_id);

		// 3. MemberMapper.xml -> delete 쿼리문 작성

		// 4. 리턴값에 따라서 콘솔창에 삭제성공 or 삭제실패
		ActionForward forward = null; 
		if (cnt > 0) {
			// 회원가입 성공
			System.out.println("회원정보삭제 성공!");
			session.removeAttribute("loginVO");
					
				forward = new ActionForward();
				forward.setPath("Main.jsp");
				forward.setRedirect(true);
			
			
			return forward;
		
		} else {
			// 회원가입 실패
			System.out.println("회원정보삭제 실패...");
			forward = new ActionForward();
			forward.setRedirect(true);

			return forward;
		}

	
	}

}
