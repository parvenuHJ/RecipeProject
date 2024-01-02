package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class MemberLogin implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		
		
		// email, pw 값 받기
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");

		System.out.println(mem_id + mem_pw);

		// MemberVO객체 생성
		MemberVO vo = new MemberVO(mem_id, mem_pw);

		// dao.login()
		MemberDAO dao = new MemberDAO();
		MemberVO loginVO = dao.login(vo);
		ActionForward forward = null;

		if (loginVO != null) {
			// 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("loginVO", loginVO);
			forward = new ActionForward();
			forward.setPath("Main.jsp");
			forward.setRedirect(false);
		} else {
			// 로그인 실패
			forward = new ActionForward();
			forward.setPath("Login.jsp");
			forward.setRedirect(true);

		}

		return forward;
	}

}
