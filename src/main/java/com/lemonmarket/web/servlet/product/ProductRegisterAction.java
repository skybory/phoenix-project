package com.lemonmarket.web.servlet.product;

import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductRegisterAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = new ProductDTO();
		
		ActionForward forward = new ActionForward();
		
		pdto.setProductId(Integer.parseInt(request.getParameter("productId")));
		pdto.setUserId(null);
		pdto.setProductTitle(request.getParameter("productTitle"));
		pdto.setProductDescription(request.getParameter("productDescription"));
		pdto.setProductImage(request.getParameter("productImage"));
		pdto.setProductDealType(request.getParameter("productDealType"));
		pdto.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
		pdto.setProductLocation(request.getParameter("productLocation"));
		pdto.setProductRegisterTime(request.getParameter("productRegisterTime"));
		pdto.setProductInterestCount(Integer.parseInt(request.getParameter("productInterestCount")));
		pdto.setProductChatCount(Integer.parseInt(request.getParameter("productChatCount")));
		
		
		if( pdao.register(pdto) ) {	// 물품 등록 성공
			forward.setPath("/index.jsp");
			forward.setRedirect(false);
		}
		
		else {
			forward.setPath("/error.jsp");	// 물품 등록 실패
			forward.setRedirect(true);
		}
		
		
		return forward;
	}

}
