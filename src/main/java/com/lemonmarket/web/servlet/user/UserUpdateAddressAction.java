package com.lemonmarket.web.servlet.user;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.MapDAO;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserUpdateAddressAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
        UserDAO udao = new UserDAO();
        UserDTO udto = (UserDTO) session.getAttribute("userDTO");
        String userId = udto.getUserId();
		String userAddress = request.getParameter("userAddress");

		forward.setRedirect(true); // redirect

		if (udao.updateAddress(userId, userAddress)) {
			forward.setPath("/board/Home.bo");
			// 성공 출력하고싶음
		} else {
			forward.setPath("/board/ERROR.bo");
		}
		return forward;
	}
}
