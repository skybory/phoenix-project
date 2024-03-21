package com.lemonmarket.web.servlet.product;

import com.lemonmarket.web.dao.CategoryDAO;

import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.dto.CategoryDTO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;

import java.util.List;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductViewDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
        
        // ProductDAO를 통해 해당 제품의 세부 정보 가져오기
        ProductDAO pdao = new ProductDAO();
        UserDAO udao = new UserDAO();
        CategoryDAO cdao = new CategoryDAO();
        int productIdx = Integer.parseInt(request.getParameter("productIdx"));
        
        ProductDTO pdto = pdao.viewProductDetail(productIdx);
        int categoryIdx = pdto.getCategoryIdx();
        // 카테고리 값 가져오기
        CategoryDTO cdto = cdao.getCategory(categoryIdx);
        
        int sellUserIdx = pdto.getUserIdx();
        UserDTO sellUserDto = udao.getData(sellUserIdx);
        
        // 페이징 처리
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
        
	        if (pdto != null ) {
	            // ProductDTO 객체가 유효한 경우
	        	request.setAttribute("cdto", cdto);
	            request.setAttribute("pdto", pdto);
	            request.setAttribute("productIdx", productIdx);
	            request.setAttribute("sellUserDto", sellUserDto);
	            forward.setRedirect(false); // redirect하지 않음
	            forward.setPath("/product/productViewDetail.jsp");
	        } else {
	            // ProductDTO 객체가 null인 경우
	            forward.setRedirect(true);
	            forward.setPath("/board/Error.bo");
	        }

		return forward;
	}

}
