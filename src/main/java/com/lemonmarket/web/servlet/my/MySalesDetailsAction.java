package com.lemonmarket.web.servlet.my;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.MyTradeDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MySalesDetailsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		 System.out.println("판매 목록 기능");
		 HttpSession session = request.getSession();
		 String userId = (String) session.getAttribute("userId");
	        System.out.println(userId);
	        MyTradeDAO myTradeDAO = new MyTradeDAO();
	        request.setAttribute("mytradeDTO", myTradeDAO.getSalesList(userId));
	        
	        forward.setPath("/myPage/SalesList.jsp");
	        forward.setRedirect(false);

		return forward;
	}
}
