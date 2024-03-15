package com.lemonmarket.web.servlet.map;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.MapDAO;
import com.lemonmarket.web.dao.UserDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MapUpdateAddressAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		MapDAO mdao = new MapDAO();
		ActionForward forward = new ActionForward();

		// 여기서 address 받아와야함!!!
		String address = request.getParameter("address");

		forward.setRedirect(true); // redirect

		if (true) {
			forward.setPath("/index.jsp");
		} else {
			forward.setPath("/1234");
		}

		return forward;
	}
}
