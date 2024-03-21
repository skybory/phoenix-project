package com.lemonmarket.web.servlet.user;

import java.util.List;

import com.lemonmarket.web.action.Action;

import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserViewOnSalesListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession(); // 세션을 가져옵니다.
		UserDTO udto = (UserDTO) session.getAttribute("userDTO");

		int userIdx = udto.getUserIdx();
	        UserDAO udao = new UserDAO();
        	List<ProductDTO> onSalesList = udao.getOnSalesList(userIdx);	        
	        
	        if (onSalesList != null  ) {

	        	request.setAttribute("onSalesList",onSalesList);
	        	 forward.setPath("/user/onSalesList.jsp");
	        }
	        else {
	        	forward.setPath("/board/ERROR.bo");
	        }
	        forward.setRedirect(false);

		return forward;
	}
}
