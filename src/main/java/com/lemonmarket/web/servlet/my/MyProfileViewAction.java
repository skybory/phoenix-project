package com.lemonmarket.web.servlet.my;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.MyTradeDAO;
import com.lemonmarket.web.dao.UserDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MyProfileViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	ActionForward forward = new ActionForward();
	System.out.println("프로필조회 기능");
	 HttpSession session = request.getSession();
	 String userId = (String) session.getAttribute("userId");
     System.out.println(userId);
     
     UserDAO userDAO = new UserDAO();

     request.setAttribute("userDTO", userDAO.getProfileList(userId));
     
     forward.setPath("/myPage/ProfileList.jsp");
     forward.setRedirect(false);
     
		return forward;
	}

}
