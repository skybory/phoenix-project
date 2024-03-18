package com.lemonmarket.web.servlet.user;

import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		ActionForward forward = new ActionForward();
		
		udto.setUserId(request.getParameter("userId"));
		udto.setUserPw(request.getParameter("userPw"));
		udto.setUserName(request.getParameter("userName"));
		udto.setUserAge(request.getParameter("userAge"));
		udto.setUserGender(request.getParameter("userGender"));
		udto.setUserPhoneNumber(request.getParameter("userPhoneNumber"));
		udto.setUserEmail(request.getParameter("userEmail"));
		udto.setUserAddress(request.getParameter("userAddress"));
		
		if( udao.join(udto) ) {	// 회원가입 성공
			forward.setPath("/index.jsp");
			forward.setRedirect(false);
		}
		
		else {
			forward.setPath("/joinview.jsp");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
