package com.codingbox.web.servlet;

import org.apache.ibatis.session.SqlSession;

import com.codingbox.web.action.Action;
import com.codingbox.web.action.ActionForward;
import com.codingbox.web.dao.UserDAO;
import com.codingbox.web.dto.UserDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		// DAO 와 DTO 초기화
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		
		// 경로를 설정하기 위해 ActionForward 객체 생성
		ActionForward forward = new ActionForward();
		
		// DTO 에 정보 삽입
		udto.setUserid(request.getParameter("userid"));
		udto.setUserpw(request.getParameter("userpw"));
		udto.setUseremail(request.getParameter("useremail"));
		udto.setUsername(request.getParameter("username"));
		udto.setUserbirth(request.getParameter("userbirth"));
		udto.setUsergender(request.getParameter("usergender"));
		udto.setUserphone(request.getParameter("userphone"));
		
		if(udao.join(udto)) {	// 회원가입
			forward.setPath("/app/user/loginview.jsp");
			forward.setRedirect(true);
		} 
		
		return forward; 
	}


	
}
