package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.MemberDAO;

public class MemberIdCheck implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		String mem_id = request.getParameter("mem_id");	
		System.out.println("mem_id : " + mem_id);
		
		boolean check = new MemberDAO().idCheck(mem_id);
		
		// check true -> 중복X
		// check false -> 중복O
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(check);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
		
	}

}
