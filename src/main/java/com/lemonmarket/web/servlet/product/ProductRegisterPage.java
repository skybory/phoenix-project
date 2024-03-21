 package com.lemonmarket.web.servlet.product;

import com.lemonmarket.web.dao.CategoryDAO;

import com.lemonmarket.web.dto.CategoryDTO;
import java.util.List;
import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductRegisterPage implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = new ActionForward();
		CategoryDAO cdao = new CategoryDAO();
		List<CategoryDTO> categoryList = cdao.getCategoryAll();
		request.setAttribute("categoryList", categoryList);

			forward.setPath("/product/productRegistration.jsp");
			forward.setRedirect(false);
		return forward;
	}

}
