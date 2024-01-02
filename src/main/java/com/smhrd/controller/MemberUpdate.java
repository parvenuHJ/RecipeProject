package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class MemberUpdate implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	
		// email, pw 값 받기
					HttpSession session = request.getSession();
					MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
					String mem_id = loginVO.getMem_id();
					String mem_pw = request.getParameter("mem_pw");
					String mem_nick = request.getParameter("mem_nick");
					String mem_address = request.getParameter("mem_address");
					String mem_tel = request.getParameter("mem_tel");
					String rate_name = request.getParameter("rate_name");
					
					System.out.println(mem_id + mem_pw + mem_nick + mem_address+ mem_tel + rate_name);


					// MemberVO객체 생성
					MemberVO vo = new MemberVO(mem_id, mem_pw, mem_nick, mem_address, mem_tel, rate_name);

					// dao.login()
					MemberDAO dao = new MemberDAO();
					int cnt = dao.MemberUpdate(vo);
					ActionForward forward = null;

					if (cnt > 0) {
						// 업데이트 성공
						System.out.println();
						session.setAttribute("loginVO", vo);
						forward = new ActionForward();
						forward.setPath("MemberPage.jsp");
						forward.setRedirect(true);
						
					} else {
						// 업데이트 실패
						forward = new ActionForward();
						forward.setPath("Main.jsp");
						forward.setRedirect(false);


					}


					return forward;
					
					
				
		
	}

}
