package com.lemonmarket.web.servlet.category;

import java.io.IOException;

import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.cat")
public class CategoryFrontController extends HttpServlet{
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
		
		
//		switch (requestURI) {
//		case "/user/cat":
//			forward = new UserLoginAction().execute(req, resp);
//			// 화면을 바로 보여줄땐 ActionForward
//			break;
//		case "/user/UserJoinAction.cat":
//			forward = new UserJoinAction().execute(req, resp);
//			// 화면을 바로 보여줄땐 ActionForward
//			break;
//		case "/user/UserLogoutAction.cat":
//			forward = new UserLogoutAction().execute(req, resp);
//			// 화면을 바로 보여줄땐 ActionForward
//			break;
//		}
//			
//		// 페이지 이동에 대한 일괄처리
//		if( forward != null ) {
//			if( forward.isRedirect() ) {	// Redirect 방식
//				resp.sendRedirect(forward.getPath());
//			} else {						// forward 방식
//				req.getRequestDispatcher(forward.getPath())
//					.forward(req, resp);
//			}
//		}
		
	}
	
	
	
	
	
	
}
