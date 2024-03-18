package com.lemonmarket.web.servlet.category;

import java.util.List;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dto.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FoodCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		try {
			// '식품' 카테고리의 ID를 정의합니다. 실제 값은 데이터베이스 상의 '의류' 카테고리 ID와 일치 해야함
			String categoryId = "3";

			ProductDAO productDAO = new ProductDAO();
			List<ProductDTO> productList = productDAO.selectProductsByCategoryId(categoryId);

			// 검색된 상품 목록을 request 속성에 설정
			request.setAttribute("productList", productList);

			forward.setPath("/webapp/category/food.jsp"); // 상대 경로로 설정
			forward.setRedirect(false); // 포워드 방식으로 페이지 이동
		} catch (Exception e) {
			e.printStackTrace();
			// 에러 페이지로 포워딩할 수 있다
			forward.setPath("/error.jsp");
			forward.setRedirect(false);
		}

		return forward;
	}

}
