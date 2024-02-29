package com.codingbox.web.servlet;

import com.codingbox.web.action.Action;
import com.codingbox.web.action.ActionForward;
import com.codingbox.web.dao.UserDAO;
import com.codingbox.web.dto.UserDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		ActionForward forward = new ActionForward();
		
//		udto.setUserid(request.getParameter("userid"));
//		udto.setUserpw(request.getParameter("userpw"));
		
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		
		forward.setRedirect(true);
		// 성공여부와 상관없이 redirect 로 주는게 맞음
		if(udao.login(userid, userpw)) {	// 회원가입
			forward.setPath("/app/main/mainview.jsp");
			// 로그인하기
		} else {
			forward.setPath("/app/user/loginview.jsp?flag=false");
		}
	
		return forward;
	}
}
