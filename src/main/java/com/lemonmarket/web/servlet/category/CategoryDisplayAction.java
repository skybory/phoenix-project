package com.lemonmarket.web.servlet.category;

import java.util.List;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.CategoryDAO;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dto.CategoryDTO;
import com.lemonmarket.web.dto.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CategoryDisplayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	
		ActionForward forward = new ActionForward();
		
		// categoryDAO 를 통해 category 내용 가져옴
		CategoryDAO cdao = new CategoryDAO();
		int categoryIdx = Integer.parseInt(request.getParameter("categoryIdx"));
		CategoryDTO cdto = cdao.getCategory(categoryIdx);

		if (cdto != null) {
			request.setAttribute("cdto", cdto);
			ProductDAO pdao = new ProductDAO();
			List<ProductDTO> productList = pdao.selectProductsByCategoryIdx(categoryIdx);
			request.setAttribute("productList", productList);

			forward.setRedirect(false);
			forward.setPath("/category/categoryDisplay.jsp");
		} else {
			forward.setRedirect(true);
			forward.setPath("/board/Error.bo");

		}
		return forward;
	}

}
