package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.CommentDAO;
import com.smhrd.model.MemberDAO;

public class CommentDelete implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String co_num = request.getParameter("co_num");
		System.out.println("댓글번호 : " + co_num);

		// 2. MemberDAO -> deleteMember();

		int cnt = new CommentDAO().CommentDelete(co_num);

		// 3. MemberMapper.xml -> delete 쿼리문 작성

		// 4. 리턴값에 따라서 콘솔창에 삭제성공 or 삭제실패
		ActionForward forward = null; 
		if (cnt > 0) {
			System.out.println("댓글삭제 성공!");
					
				forward = new ActionForward();
				forward.setPath("MemberComment.jsp");
				forward.setRedirect(false);
			
			
			return forward;
		
		} else {
			// 회원가입 실패
			System.out.println("댓글삭제 실패...");
			forward = new ActionForward();
			forward.setRedirect(false);

			return forward;
		}
		
		
		
		
	}

}
