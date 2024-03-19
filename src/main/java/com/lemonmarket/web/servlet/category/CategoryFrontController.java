package com.lemonmarket.web.servlet.category;

import java.io.IOException;

import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.cat")
public class CategoryFrontController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;

		switch (requestURI) {
		case "/category/cloth.cat":
			forward = new ClothCategoryAction().execute(req, resp);
			break;
		case "/category/beauty.cat":
			forward = new BeautyCategoryAction().execute(req, resp);
			break;
		case "/category/food.cat":
			forward = new FoodCategoryAction().execute(req, resp);
			break;
		case "/category/digital.cat":
			forward = new DigitalCategoryAction().execute(req, resp);
			break;
		case "/category/home.cat":
			forward = new HomeCategoryAction().execute(req, resp);
			break;
		case "/category/book.cat":
			forward = new BookCategoryAction().execute(req, resp);
			break;
		case "/category/kitchen.cat":
			forward = new KitchenCategoryAction().execute(req, resp);
			break;
		case "/category/sports.cat":
			forward = new SportsCategoryAction().execute(req, resp);
			break;
		}
		
 

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
