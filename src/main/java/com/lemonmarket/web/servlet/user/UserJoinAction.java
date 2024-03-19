package com.lemonmarket.web.servlet.user;

import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
	
		HttpSession session = request.getSession(); // 세션을 가져옵니다.
//		session.set
		String userId = udto.getUserId();
		String userPw = udto.getUserPw();
//		session.setAttribute("userId", userId);
		udao.login(userId, userPw, session);
			
		
			forward.setPath("/board/Home.bo");
			forward.setRedirect(false);
		}
		
		else {
			forward.setPath("/board/Join.bo");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
