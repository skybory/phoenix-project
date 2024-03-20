
package com.lemonmarket.web.servlet.chatting;

import java.io.IOException;

import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.chat")
public class ChatFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;

		// 화면 이동

		// 예시

				
		switch (requestURI) {
		case "/chatting/chatwrite.chat":
			forward = new ActionForward(true,"/chatting/chatting.jsp");
			break;
		case "/chatting/chatting.chat":
			forward = new ChattingView().execute(req,resp);
			break;
		case "/chatting/getNewChat.chat":
			new ChattingNewGet().execute(req, resp);
			break;
		
		case "/chatting/getList.chat":
//			forward = new ChattingGetList().execute(req, resp);
			new ChattingGetList().execute(req, resp);
			break;
		case "/chatting/getRoomList.chat":
//			forward = new ChattingGetList().execute(req, resp);
			new ChattingRoomGetList().execute(req, resp);
			break;
		
		case "/chatting/write.chat":
			new chattingWriteOk().execute(req, resp);
			break;
		}
		

		// 윗부분 작성 후 아래부분 주석해제 할것.
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
