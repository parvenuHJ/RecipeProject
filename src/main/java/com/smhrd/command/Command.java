package com.smhrd.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ActionForward;

public interface Command {
	
	public abstract ActionForward execute(HttpServletRequest request, HttpServletResponse response);



}
