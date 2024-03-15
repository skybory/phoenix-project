package com.lemonmarket.web.servlet.category;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.CategoryDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SelectCategoryAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		CategoryDAO cdao = new CategoryDAO();
		request.setAttribute("category", cdao.getcategoryAll());
		forward.setPath(request.getContextPath()+"/category/category.jsp");
		forward.setRedirect(false);
		return forward;
	}

}