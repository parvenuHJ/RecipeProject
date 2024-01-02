package com.smhrd.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.controller.CommentDelete;
import com.smhrd.controller.CommentInsert;
import com.smhrd.controller.CommentUpdate;
import com.smhrd.controller.RecipeIngreSelect;
import com.smhrd.controller.RecipeOne;
import com.smhrd.controller.RecipeSelect;
import com.smhrd.controller.RelikeDelete;
import com.smhrd.controller.RelikeInsert;
import com.smhrd.controller.MemberDelete;
import com.smhrd.controller.MemberIdCheck;
import com.smhrd.controller.MemberJoin;
import com.smhrd.controller.MemberLogin;
import com.smhrd.controller.MemberLogout;
import com.smhrd.controller.MemberUpdate;
import com.smhrd.model.ActionForward;
import com.smhrd.model.IngreSelectDAO;

//url mapping -> *.do / .do 확장자가 붙으면 전부 FrontController로 모임
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[FrontController]");

		// 어디서 요청이 들어왔는지 확인
		String uri = request.getRequestURI();
		System.out.println("들어온 요청 :" + uri);

		// 프로젝트 이름 확인
		String project = request.getContextPath();
		System.out.println("프로젝트 이름 : " + project);

		// 문자열 잘라내기 -> uri
		uri = uri.substring(project.length() + 1);
		System.out.println("요청 서블릿 : " + uri);

		request.setCharacterEncoding("UTF-8");
		ActionForward moveURL = null;
		Command service = null;

		if (uri.equals("MemberJoin.do")) {
			service = new MemberJoin();
		} else if (uri.equals("MemberLogin.do")) {
			service = new MemberLogin();
		} else if (uri.equals("MemberLogout.do")) {
			service = new MemberLogout();
		} else if (uri.equals("MemberUpdate.do")) {
			service = new MemberUpdate();
		} else if (uri.equals("MemberDelete.do")) {
			service = new MemberDelete();
		} else if (uri.equals("MemberIdCheck.do")) {
			service = new MemberIdCheck();
		} else if (uri.equals("CommentInsert.do")) {
			service = new CommentInsert();
		} else if (uri.equals("CommentDelete.do")) {
			service = new CommentDelete();
		} else if (uri.equals("CommentUpdate.do")) {
			service = new CommentUpdate();
		} else if (uri.equals("IngreSelect.do")) {
			service = new RecipeIngreSelect();
		} else if (uri.equals("RecipeSelect.do")) {
			service = new RecipeSelect();
		}else if (uri.equals("RecipeOne.do")) {
			service = new RecipeOne();
		} else if (uri.equals("RelikeInsert.do")) {
	         service = new RelikeInsert();
	    }else if (uri.equals("RelikeDelete.do")) {
	         service = new RelikeDelete();
	    }
		
		
		

		moveURL = service.execute(request, response);

		if (moveURL != null) {
			System.out.println("페이지 이동");
			if (moveURL.isRedirect()) {
				System.out.println("sendRedirect방식 이동 : " + moveURL);
				response.sendRedirect(moveURL.getPath());
			} else {
				System.out.println("forward방식 이동 : " + moveURL.getPath());
				RequestDispatcher rd = request.getRequestDispatcher(moveURL.getPath());
				rd.forward(request, response);
			}

		}

	}

}
