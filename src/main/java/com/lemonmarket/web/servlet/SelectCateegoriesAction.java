package com.lemonmarket.web.servlet;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.CategorieDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SelectCateegoriesAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		CategorieDAO cdao = new CategorieDAO();
		request.setAttribute("categories", cdao.getAllCategories());
		forward.setPath(request.getContextPath()+"/categorie/categorieview.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
