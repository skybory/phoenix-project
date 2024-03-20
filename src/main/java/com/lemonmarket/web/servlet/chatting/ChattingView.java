package com.lemonmarket.web.servlet.chatting;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dto.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ChattingView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		ActionForward forward = new ActionForward();
        ProductDAO pdao = new ProductDAO();
        int productIdx = Integer.parseInt(request.getParameter("productIdx"));
        ProductDTO pdto = pdao.viewProductDetail(productIdx);
	        if (pdto != null) {
	            // ProductDTO 객체가 유효한 경우
	            request.setAttribute("pdto", pdto);
	            forward.setRedirect(false); // redirect하지 않음
	            forward.setPath("/chatting/chatting.jsp");
	        } else {
	            // ProductDTO 객체가 null인 경우
	            forward.setRedirect(true);
	            forward.setPath("/error.jsp");
	            
	        }


		return forward;

	}

}
