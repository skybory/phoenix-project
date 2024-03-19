package com.lemonmarket.web.servlet.user;


import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserPurchaseProductAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO udao = new UserDAO();

		HttpSession session = request.getSession(); // 세션을 가져옵니다.
		UserDTO udto = (UserDTO) session.getAttribute("userDTO");
		int purchaseUserIdx = udto.getUserIdx();
		ProductDAO pdao = new ProductDAO();

        int productIdx = Integer.parseInt(request.getParameter("productIdx"));
        ProductDTO pdto = pdao.viewProductDetail(productIdx);
		
		int userAccount = udto.getUserAccount();
		int productPrice = pdto.getProductPrice();
		ActionForward forward = new ActionForward();
		
		boolean isMoney = false;
		if (userAccount - productPrice >= 0) {
			isMoney = true;
		}
		
		if (isMoney) {
			
			if (udao.purchase(purchaseUserIdx, productIdx)) {
				udto = udao.getData(purchaseUserIdx);
				session.setAttribute("userDTO", udto);
				forward.setPath("/board/Product.bo");
				forward.setRedirect(true);				
			}
			else {
				forward.setPath("/board/Error.bo");
				forward.setRedirect(true);
			}

		}
			

		return forward;
	}

}
