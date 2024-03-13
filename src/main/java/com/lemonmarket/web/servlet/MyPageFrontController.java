package com.lemonmarket.web.servlet;

import java.io.IOException;

import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.mp")
public class MyPageFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException{
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		
		System.out.println(requestURI);
		
		System.out.println("프론트컨트롤러 도착!");
		System.out.println("프론트컨트롤러 도착!");
		System.out.println("프론트컨트롤러 도착!");
		
		switch(requestURI) {
		
		
		case "/mypage/InterestList.mp": 
			forward = new MyInterestListAction().execute(req,resp);
			break;
			
		case "/mypage/SalesDetails.mp":
			forward = new MySalesDetailsAction().execute(req,resp);
			break;
			
		case "/mypage/PurchaseDetails.mp":
			forward = new MyPurchaseDetailsAction().execute(req,resp);
			break;
		
		case "/mypage/ProfileView.mp" :
			forward = new MyProfileViewAction().execute(req,resp);
			break;
			
		}
		
		
		
		
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			} else {
				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
			}
		}
	}
}
