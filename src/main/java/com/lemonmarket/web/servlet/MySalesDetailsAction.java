package com.lemonmarket.web.servlet;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MySalesDetailsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		return forward;
	}

}
