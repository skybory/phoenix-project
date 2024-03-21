//package com.lemonmarket.web.servlet.map;
//
//import java.io.IOException;
//
//
//import com.lemonmarket.web.action.ActionForward;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("*.map")
//public class MapFrontController extends HttpServlet {
//
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		doProcess(req, resp);
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		doProcess(req, resp);
//	}
//
//	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String requestURI = req.getRequestURI();
//		ActionForward forward = null;
//
//		// 화면 이동
//
//		// 예시
//
//		switch (requestURI) {
//		case "/board/Location.map":
//			System.out.println("위치 버튼 클릭");
//			forward = new ActionForward(true, "/map/map.jsp");
//			// 화면을 바로 보여줄땐 ActionForward
//			break;
//
////		case "/ ":
////			forward = new MapFindMyTownAction().execute(req, resp);
////			break;
//
//				
//			}
//		if (forward != null) {
//			if (forward.isRedirect()) { // Redirect 방식
//				resp.sendRedirect(forward.getPath());
//			} else { // forward 방식
//				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
//		}
//			if (forward != null) {
//				if (forward.isRedirect()) { // Redirect 방식
//					resp.sendRedirect(forward.getPath());
//				} else { // forward 방식
//					req.getRequestDispatcher(forward.getPath()).forward(req, resp);
//				}
//
//			}
//		}
//	}
//}
