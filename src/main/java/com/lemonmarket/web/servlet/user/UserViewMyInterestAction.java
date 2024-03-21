package com.lemonmarket.web.servlet.user;

import java.util.HashMap;
import java.util.List;

import com.lemonmarket.web.action.Action;

import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.dto.WishlistDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserViewMyInterestAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		// 세션에서 현재 로그인한 사람의 udto 가져오기
		UserDTO udto = (UserDTO) session.getAttribute("userDTO");
		int userIdx = udto.getUserIdx();
		UserDAO udao = new UserDAO();
		HashMap<String, Integer> list = new HashMap<>();
		List<WishlistDTO> wishProduct = udao.getWishList(userIdx);
		
		for(WishlistDTO wish : wishProduct) {
			list.put("productIdx", wish.getproductIdx());
			System.out.println(wish.getproductIdx());
		}
		
		List<ProductDTO> wishList = udao.getWish(list);
		if (wishList != null) {

			request.setAttribute("wishList", wishList);
			forward.setPath("/user/interestList.jsp");
		}

		else {
			forward.setRedirect(true);
			forward.setPath("/board/Error.bo");
		}
		forward.setRedirect(false);
		
		
		return forward;
	}

}
