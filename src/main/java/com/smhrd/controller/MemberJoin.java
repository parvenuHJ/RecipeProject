package com.smhrd.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class MemberJoin implements Command {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      String mem_id = request.getParameter("mem_id");
      String mem_pw = request.getParameter("mem_pw");
      String mem_pw2 = request.getParameter("mem_pw2");
      
      if(mem_pw.equals(mem_pw2)) {
      String mem_nick = request.getParameter("mem_nick");
      String mem_address = request.getParameter("mem_address");
      String mem_tel = request.getParameter("mem_tel");
      String rate_name = request.getParameter("rate_name");

      
      
      MemberVO vo = new MemberVO(mem_id, mem_pw, mem_nick, mem_address, mem_tel, rate_name);
      MemberDAO dao = new MemberDAO();
      int cnt = dao.join(vo);
      ActionForward forward = null;
      if (cnt > 0) {
         System.out.println("회원가입 성공!!!!");
         
         forward = new ActionForward();         
         forward.setPath("Main.jsp?mem_id=" + mem_id);
         forward.setRedirect(true);
         
         return forward;
         
      } else {
          System.out.println("회원가입 실패");
          // 회원 가입 실패 시 에러 메시지를 request 객체에 저장
          request.setAttribute("joinError", "회원 가입에 실패했습니다.");

          forward = new ActionForward();
          forward.setPath("Error.jsp"); // 에러 페이지로 이동
          forward.setRedirect(false);

          return forward;
      }
      }else {
         try {
            System.out.println("응 비밀번호 틀렸어~");
            response.sendRedirect("MemberLogin.jsp");
         } catch (IOException e) {
            e.printStackTrace();
         }
         return null;
      }


   }

}