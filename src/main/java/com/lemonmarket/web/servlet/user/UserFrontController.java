package com.lemonmarket.web.servlet.user;

import java.io.IOException;

import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.servlet.product.ProductRegisterAction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.us")
public class UserFrontController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		case "/user/UserLoginAction.us":
			forward = new UserLoginAction().execute(req, resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/user/UserJoinAction.us":
			new UserJoinAction().doPost(req,resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/user/UserLogoutAction.us":
			forward = new UserLogoutAction().execute(req, resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/user/UserupdateAddressAction.us":
			forward = new UserUpdateAddressAction().execute(req, resp);
			break;
		case "/user/PurchaseListAction.us":
			forward = new UserViewPurchaseListAction().execute(req, resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/user/SalesListAction.us":
			forward = new UserViewSalesListAction().execute(req, resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/user/onSalesListAction.us":
			forward = new UserViewOnSalesListAction().execute(req, resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/user/PurchaseProductAction.us":
			forward = new UserPurchaseProductAction().execute(req, resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/user/ViewMyProfileAction.us":
			forward = new UserViewMyProfileAction().execute(req, resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/user/InterestListAction.us":
			forward = new UserViewMyInterestAction().execute(req, resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/user/UpdateMyProfileAction.us":
			forward = new UserUpdateMyProfileAction().execute(req, resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;
		}
			
 
		// 페이지 이동에 대한 일괄처리
		if( forward != null ) {
			if( forward.isRedirect() ) {	// Redirect 방식
				resp.sendRedirect(forward.getPath());
			} else {						// forward 방식
				req.getRequestDispatcher(forward.getPath())
					.forward(req, resp);
			}
		}
		
	}
	
	
	
	
	
	
}
