package com.lemonmarket.web.servlet.user;

import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO udao = new UserDAO();
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession(); // 세션을 가져옵니다.
		
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		session.setAttribute("userId", userId);
		
		forward.setRedirect(true);	// redirect
		if( udao.login(userId, userPw, session) ) {
			
			forward.setRedirect(true);
			forward.setPath("/board/Home.bo");
		} else {
			forward.setRedirect(true);
			
			forward.setPath("/board/Login.bo");
		}
		
		return forward;
	}

}
