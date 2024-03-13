package com.lemonmarket.web.servlet;

import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserLoginOKAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO udao = new UserDAO();
		ActionForward forward = new ActionForward();
		
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		
		forward.setRedirect(true);	// redirect
		if( udao.login(userid, userpw) ) {
			forward.setPath("/index.jsp");
		} else {
			forward.setPath("/user/loginview.jsp?flag=false");
		}
		
		return forward;
	}

}
