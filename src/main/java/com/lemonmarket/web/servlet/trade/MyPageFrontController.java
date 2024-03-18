//package com.lemonmarket.web.servlet.trade;
//
//import java.io.IOException;
//
//import com.lemonmarket.web.action.ActionForward;
//import com.lemonmarket.web.servlet.user.UserProfileViewAction;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("*.my")
//public class MyPageFrontController extends HttpServlet {
//
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		doProcess(req, resp);
//	}
//
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		doProcess(req, resp);
//	}
//
//	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String requestURI = req.getRequestURI();
//		ActionForward forward = null;
//
//
//		switch (requestURI) {
//
////		case "/my/SalesDetails.my":
////			forward = new MySalesDetailsAction().execute(req, resp);
////			// 화면을 바로 보여줄땐 ActionForward
////			break;
////		case "/my/InterestList.my":
////			forward = new MyInterestListAction().execute(req, resp);
////			// 화면을 바로 보여줄땐 ActionForward
////			break;
//
//
//
//		}
//
//		if (forward != null) {
//			if (forward.isRedirect()) {
//				resp.sendRedirect(forward.getPath());
//			} else {
//				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
//			}
//		}
//	}
//}