package com.lemonmarket.web.servlet.product;

import java.io.IOException;

import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.servlet.UpdateInterestCountAction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.pro")
public class ProductFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;

		switch (requestURI) {
		case "/product/RegisterProductAction.pro":
			forward = new ProductRegisterAction().execute(req, resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;

//		case "/product/UpdateChatCountAction.pr":
//			// 채팅 수 업데이트 액션 요청 처리
//			String productId = req.getParameter("productId");
//			int chatCount = Integer.parseInt(req.getParameter("chatCount"));
//			new ProductDAO().updateChatCount(productId, chatCount);
//			forward = new ActionForward("/pricing/product_detail.jsp", true); // 적절한 URL과 리다이렉트 여부 설정
//			break;

		case "/product/UpdateInterestCountAction.pro":
			// 관심 수 업데이트 액션 요청 처리
			String interestProductId = req.getParameter("productId");
			int interestCount = Integer.parseInt(req.getParameter("interestCount"));
			new ProductDAO().updateInterestCount(interestProductId, interestCount);
			forward = new UpdateInterestCountAction().execute(req, resp);
			break;
		}

		// 페이지 이동에 대한 일괄처리
		if (forward != null) {
			if (forward.isRedirect()) { // Redirect 방식
				resp.sendRedirect(forward.getPath());
			} else { // forward 방식
				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
			}
		}

	}

}
