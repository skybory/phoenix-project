package com.lemonmarket.web.servlet.user;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.MapDAO;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserUpdateMyProfileAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
        UserDTO udto = (UserDTO) session.getAttribute("userDTO");
		UserDAO udao = new UserDAO();
		int userIdx = udto.getUserIdx();
//		int userIdx = Integer.parseInt(request.getParameter("userIdx"));
//		UserDTO udto = udao.getData(userIdx);
        
		udto.setUserImage(request.getParameter("userImage"));
		udto.setUserName(request.getParameter("userName"));
		udto.setUserId(request.getParameter("userId"));
		udto.setUserAge(request.getParameter("userAge"));
		udto.setUserGender(request.getParameter("userGender"));
		udto.setUserPhoneNumber( request.getParameter("userPhoneNumber"));
		udto.setUserEmail (request.getParameter("userEmail"));
		udto.setUserAddress ( request.getParameter("userAddress"));
		udto.setUserAccount (Integer.parseInt(request.getParameter("userAccount")));
//		udto.setUserIdx(udto.getUserIdx());
		String userId = udto.getUserId();
		String userPw = udto.getUserPw();
		
		forward.setRedirect(true); // redirect

		if (udao.updateUserProfile(udto, userIdx)) {
			udao.login(userId, userPw, session);
			forward.setPath("/board/Home.bo");
			// 성공 출력하고싶음
		} else {
			forward.setPath("/board/ERROR.bo");
		}
		return forward;
	}
}
