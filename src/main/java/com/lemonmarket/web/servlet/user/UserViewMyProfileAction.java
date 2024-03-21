package com.lemonmarket.web.servlet.user;

import com.lemonmarket.web.action.Action;

import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserViewMyProfileAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		// 세션에서 현재 로그인한 사람의 udto 가져오기
		UserDTO udto = (UserDTO) session.getAttribute("userDTO");
		int userIdx = udto.getUserIdx();
		UserDAO udao = new UserDAO();
		udto = udao.getData(userIdx);
		if (udto != null) {

			request.setAttribute("userDTO", udto);
			forward.setRedirect(true);
			forward.setPath("/myPage/myProfile.jsp");
		}

		else {
			forward.setRedirect(true);
			forward.setPath("/board/Error.bo");
		}
		return forward;
	}

}
