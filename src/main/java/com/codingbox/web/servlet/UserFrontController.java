package com.codingbox.web.servlet;

import java.io.IOException;

import com.codingbox.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.us")
public class UserFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		//회원가입 화면으로 이동
		if(requestURI.equals("/user/userJoin.us")) {
			forward = new UserJoinAction().execute(req, resp);
			
		//로그인 화면으로 이동
		} else if (requestURI.equals("/user/UserLogin.us")) {
			forward = new ActionForward(false, "/app/user/loginview.jsp");
		
		//로그인 성공 화면으로 이동
		} else if (requestURI.equals("/user/UserLoginOK.us")) {
			forward = new UserLoginAction().execute(req, resp);
		}
		
		
		// 페이지 이동에 대한 일괄처리
		if(forward != null) {
			if(forward.isRedirect() ) {	// Redirect 방식
				resp.sendRedirect(forward.getPath());
			} else { 					// forward 방식
				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
			}
			
		}
	}
}
