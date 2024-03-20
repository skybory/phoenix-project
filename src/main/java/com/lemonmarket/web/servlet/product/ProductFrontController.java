package com.lemonmarket.web.servlet.product;

import java.io.IOException;

import java.util.List;

import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.CategoryDAO;
import com.lemonmarket.web.dto.CategoryDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.pr")
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
		case "/product/ProductWriteBoard.pr":
			forward = new ProductRegisterPage().execute(req, resp);
			break;
			
		case "/product/ProductRegisterAction.pr":
			new ProductRegisterAction().doPost(req,resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;
			
		case "/product/ViewDetailAction.pr":
			forward = new ProductViewDetailAction().execute(req,resp);
			break;

		case "/product/DecreaseInterest.pr":
			// 관심 수 업데이트 액션 요청 처리
			new UpdateInterestCountAction().execute(req, resp);
			break;
		case "/product/getItem.pr":
			// 관심 수 업데이트 액션 요청 처리
			new GetItem().execute(req, resp);
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
