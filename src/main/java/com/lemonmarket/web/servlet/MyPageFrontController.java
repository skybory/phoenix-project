package com.lemonmarket.web.servlet;

import java.io.IOException;

import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.mypage")
public class MyPageFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException{
		String requestURL = req.getRequestURI();
		ActionForward forward = null;
		
		switch(requestURL) {
		
		
		case "/mypage/InterestList.mypage":  
			System.out.println("관심목록 버튼클릭");
			forward = new MyInterestListAction().execute(req,resp);
			break;
			
		case "/mypage/SalesDetails.mypage":
			System.out.println("판매내역 버튼클릭");
			forward = new MySalesDetailsAction().execute(req,resp);
			break;
			
		case "/mypage/PurchaseDetails.mypage":
			System.out.println("구매버튼클릭");
			forward = new MyPurchaseDetailsAction().execute(req,resp);
			break;
		
		case "/mypage/ProfileView.mypage" :
			System.out.println("개인정보 보기 버튼클릭");
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
