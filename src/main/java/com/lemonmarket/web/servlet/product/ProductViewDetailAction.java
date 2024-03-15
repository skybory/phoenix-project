package com.lemonmarket.web.servlet.product;

import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ProductViewDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = new ProductDTO();
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession(); // 세션을 가져옵니다.
		forward.setPath("/product/productViewDetail.jsp");
		forward.setRedirect(true);	// redirect
		return forward;
	}

}
