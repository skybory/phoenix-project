package com.lemonmarket.web.servlet;

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
		
		udto.setUserId(request.getParameter("userid"));
		udto.setUserPw(request.getParameter("userpw"));
		udto.setUserAge(request.getParameter("userage"));
		udto.setGender(request.getParameter("gender"));
		udto.setUserName(request.getParameter("username"));
		udto.setUserEmail(request.getParameter("useremail"));
		udto.setPhoneNumber(request.getParameter("phonenumber"));
		udto.setUserAddress(request.getParameter("useraddress"));
		udto.setLocation(request.getParameter("location"));
		udto.setRegistDate(request.getParameter("registdate"));
		udto.setProfileUrl(request.getParameter("profileurl"));
//		udto.setIsPremium(request.getParameter("ispremium"));
		
		
		if( udao.join(udto) ) {	// 회원가입
			forward.setPath("/app/user/loginview.jsp");
			forward.setRedirect(true);
		}
		
		
		return forward;
	}

}
