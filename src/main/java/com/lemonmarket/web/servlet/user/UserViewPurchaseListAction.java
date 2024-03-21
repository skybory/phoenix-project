// MyPurchaseDetailsAction 수정
package com.lemonmarket.web.servlet.user;

import java.util.List;



import com.lemonmarket.web.action.Action;

import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.UserDAO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserViewPurchaseListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession(); // 세션을 가져옵니다.
        UserDTO udto = (UserDTO) session.getAttribute("userDTO");
        
        int userIdx = udto.getUserIdx();
        UserDAO udao = new UserDAO();
        List<ProductDTO> purchaseList = udao.getPurchaseList(userIdx);
        
        
        if (purchaseList != null ) {
            // purchaseList가 비어있지 않은 경우, JSP 페이지로 전달하기 위해 forward 객체에 데이터 추가
            request.setAttribute("purchaseList", purchaseList);
            forward.setRedirect(false);
            forward.setPath("/user/purchaseList.jsp");
        } else {
            forward.setPath("/board/Error.bo");
        }
        return forward;
    }
}