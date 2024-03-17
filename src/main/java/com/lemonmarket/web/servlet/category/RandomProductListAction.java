package com.lemonmarket.web.servlet.category;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dto.ProductDTO;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RandomProductListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ProductDAO productDAO = new ProductDAO();
        List<ProductDTO> randomProductList = productDAO.getRandomProducts();
        request.setAttribute("randomProductList", randomProductList);

        // 올바르게 ActionForward 인스턴스를 생성하고 반환
        ActionForward forward = new ActionForward();
        forward.setPath("/category/category.jsp");
        forward.setRedirect(false); // 여기서 false는 페이지를 forward 방식으로 이동한다는 의미입니다.
        return forward; // 수정된 부분: forward 변수를 반환
    }
}
