package com.lemonmarket.web.servlet.category;

import java.util.List;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.CategoryDAO;
import com.lemonmarket.web.dto.CategoryDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SelectCategoryAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		CategoryDAO cdao = new CategoryDAO();
		List<CategoryDTO> categoryList = cdao.getCategoryAll();
		request.setAttribute("categoryList", categoryList);
		forward.setPath(request.getContextPath()+"/category/category.jsp");
		forward.setRedirect(false);
		return forward;
	}

}