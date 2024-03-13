package com.lemonmarket.web.servlet;

import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO udao = new UserDAO();
		ActionForward forward = new ActionForward();
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		forward.setRedirect(true);	// redirect
		if( udao.login(userId, userPw) ) {
			forward.setRedirect(true);
			forward.setPath("/index.jsp");
		} else {
			forward.setRedirect(true);
			
			forward.setPath("/error.jsp");
		}
		
		return forward;
	}

}
