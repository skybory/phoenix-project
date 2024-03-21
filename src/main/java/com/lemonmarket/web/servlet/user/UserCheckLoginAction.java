//package com.lemonmarket.web.servlet.user;
//
//import com.lemonmarket.web.dto.UserDTO;
//import com.lemonmarket.web.action.Action;
//import com.lemonmarket.web.action.ActionForward;
//
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//public class UserCheckLoginAction implements Action{
//
//	@Override
//	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
//
//		// 이 페이지의 기능 : 로그인했는지 확인하고, 로그인되어있다면 userDTO를 세션에서 가져오고 경로를 유지하며, 그렇지 않을 시 error 페이지로 강제 전송
//		
//		ActionForward forward = new ActionForward();
//		HttpSession session = request.getSession(); // 세션을 가져옵니다.
//		UserDTO udto = (UserDTO) session.getAttribute("userDTO");
//		
//		
//		if( udto != null) {
//			forward.setRedirect(true);
//			forward.setPath(request.getRequestURI());	// 경로 유지
//		} else {
//			forward.setRedirect(true);
//			forward.setPath("/board/Error.bo");
//		}
//		
//		return forward;
//	}
//
//}
