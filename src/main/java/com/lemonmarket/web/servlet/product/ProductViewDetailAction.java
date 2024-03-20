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
		
		ActionForward forward = new ActionForward();
        
        // ProductDAO를 통해 해당 제품의 세부 정보 가져오기
        ProductDAO pdao = new ProductDAO();
        UserDAO udao = new UserDAO();
        int productIdx = Integer.parseInt(request.getParameter("productIdx"));
        
        ProductDTO pdto = pdao.viewProductDetail(productIdx);
        int sellUserIdx = pdto.getUserIdx();
        UserDTO sellUserDto = udao.getData(sellUserIdx);
        
	        if (pdto != null) {
	            // ProductDTO 객체가 유효한 경우
	            request.setAttribute("pdto", pdto);
	            request.setAttribute("sellUserDto", sellUserDto);
	            forward.setRedirect(false); // redirect하지 않음
	            forward.setPath("/product/productViewDetail.jsp");
	        } else {
	            // ProductDTO 객체가 null인 경우
	            forward.setRedirect(true);
	            forward.setPath("/board/Error.bo");
	        }

		return forward;
	}

}
