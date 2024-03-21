package com.lemonmarket.web.servlet.product;

import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;

import java.util.List;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ProductViewMainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		
		ProductDAO pdao = new ProductDAO();
		int totalCnt = pdao.getProductCnt();
		int pageSize = 12;
		int totalPage = (totalCnt + pageSize - 1) / pageSize;

		// 현재 페이지 넘겨받기
		String temp = request.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		int startRow = (page - 1) * pageSize;
//		int endRow = startRow + pageSize - 1;

		// [1],[2]...[10] : 1페이지, [11],[12]...[20] : 11페이지
		int startPage = (page - 1) / pageSize * pageSize + 1;
		
		// [1],[2]...[10] : 10페이지, [11],[12]...[20] : 20페이지
		int endPage = startPage + pageSize - 1;
		endPage = Math.min(endPage, totalPage);

		List<ProductDTO> productList = pdao.getProductList(startRow, pageSize);
		request.setAttribute("productList", productList);
		
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
        
		//forward 방식으로 페이지 이동
		forward.setRedirect(false);
		forward.setPath(request.getContextPath() + "/product/productMain.jsp");
		// request.getContextPath() 이 부분은 경로가 깨질 경우 사용
		return forward;
	}
}
