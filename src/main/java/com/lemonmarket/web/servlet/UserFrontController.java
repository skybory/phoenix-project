package com.lemonmarket.web.servlet;

import java.io.IOException;

import com.lemonmarket.web.action.ActionForward;

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
		String requestRUI = req.getRequestURI();
		ActionForward forward = null;
		
		if( requestRUI.equals("/user/userJoin.us") ) {
			forward = new UserJoinAction().execute(req, resp);
		} else if( requestRUI.equals("/user/UserLogin.us") ) {
			forward = new ActionForward(false, "/app/user/loginview.jsp");
		} else if( requestRUI.equals("/user/UserLoginOK.us") ) {
			forward = new UserLoginOkAction().execute(req, resp);
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
