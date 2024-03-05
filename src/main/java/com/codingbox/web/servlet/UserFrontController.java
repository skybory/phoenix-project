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
		
		//화면 이동
		
		//예시

//		switch (requestURI) {
//		case "/board/BoardWrite.bo":
//			System.out.println("switch성공시 출력");
//			forward = new ActionForward(true, "/board/boardwrite2.jsp");
//			//화면을 바로 보여줄땐 ActionForward
//			break;
//		case "/board/BoardList.bo":
//			forward = new BoardListAction().execute(req, resp);
//			break;
//			
//		case "/board/boardwriteOK.bo":
//			forward = new BoardWriteOKAction().execute(req,resp);
//			break;
		
		
		
		// 윗부분 작성 후 아래부분 주석해제 할것.
		// 페이지 이동에 대한 일괄처리
//		if(forward != null) {
//			if(forward.isRedirect() ) {	// Redirect 방식
//				resp.sendRedirect(forward.getPath());
//			} else { 					// forward 방식
//				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
//			}
//			
//		}
	}
}
