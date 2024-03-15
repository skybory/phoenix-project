package com.lemonmarket.web.servlet.user;

import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserLogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession(); // 세션을 가져옵니다.
		UserDTO udto = (UserDTO) session.getAttribute("userDTO");
		
		
		if(udto != null) {

			session.invalidate();
			forward.setRedirect(true);
			forward.setPath("/index.jsp");
			
		} else {
			forward.setRedirect(true);
			
			forward.setPath("/error.jsp");
		}
		
		return forward;
	}

}
