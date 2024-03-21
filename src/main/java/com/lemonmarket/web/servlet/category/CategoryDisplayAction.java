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
		ProductDAO pdao = new ProductDAO();
		String categoryName = cdto.getCategoryName();
		
		int totalCnt = pdao.getProductsCntByCategoryIdx(categoryIdx);
		int pageSize = 12;
		int totalPage = (totalCnt + pageSize - 1) / pageSize;

		// 현재 페이지 넘겨받기
		String temp = request.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		int startRow = (page - 1) * pageSize;

		// [1],[2]...[10] : 1페이지, [11],[12]...[20] : 11페이지
		int startPage = (page - 1) / pageSize * pageSize + 1;
		
		// [1],[2]...[10] : 10페이지, [11],[12]...[20] : 20페이지
		int endPage = startPage + pageSize - 1;
		endPage = Math.min(endPage, totalPage);

		// 물품 리스트를 바꿔야함. pdao.selectProduct궁시렁으로 : 바꿈
		List<ProductDTO> productList = pdao.selectProductsByCategoryIdx(startRow, pageSize, categoryIdx);
		request.setAttribute("productList", productList);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		
		if (cdto != null) {
			request.setAttribute("cdto", cdto);
			request.setAttribute("categoryName", categoryName);
			forward.setRedirect(false);
			forward.setPath("/category/categoryDisplay.jsp");
		} else {
			forward.setRedirect(true);
			forward.setPath("/board/Error.bo");

		}
		return forward;
	}

}
