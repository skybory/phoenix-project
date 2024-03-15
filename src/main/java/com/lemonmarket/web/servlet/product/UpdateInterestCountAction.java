package com.lemonmarket.web.servlet.product;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ProductDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateInterestCountAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// ActionForward 객체 생성
		ActionForward forward = new ActionForward();
		String productId = "plzeFix"; 
		// productDAO 객체 생성
		ProductDAO pdao = new ProductDAO();

		int productInterestCount = Integer.parseInt(request.getParameter("productInterestCount"));

		// 관심수 업데이트가 성공하면
		if (pdao.updateInterestCount(productId, productInterestCount)) {
			// forward를 리다이렉트로 설정함
			forward.setRedirect(true);

		}
		return forward;

	}
}
