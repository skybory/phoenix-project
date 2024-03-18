//package com.lemonmarket.web.servlet.user;
//
//import com.lemonmarket.web.action.Action;
//
//import com.lemonmarket.web.action.ActionForward;
//import com.lemonmarket.web.dao.ProductDAO;
//import com.lemonmarket.web.dao.UserDAO;
//import com.lemonmarket.web.dto.ProductDTO;
//import com.lemonmarket.web.dto.UserDTO;
//
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//public class UserProfileViewAction implements Action {
//
//	@Override
//	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
//		ActionForward forward = new ActionForward();
//		HttpSession session = request.getSession();
//		
//		
//		UserDTO udto = (UserDTO) session.getAttribute("userDTO");
//		String userId = udto.getUserId();
//		UserDAO udao = new UserDAO();
//
//
//		if(udao.viewProfile) {
//			
//		}
//		forward.setPath("/myPage/myProfile.jsp");
//		forward.setRedirect(false);
//
//		return forward;
//	}
//
//}
