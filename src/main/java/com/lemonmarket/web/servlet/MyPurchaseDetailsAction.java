// MyPurchaseDetailsAction 수정
package com.lemonmarket.web.servlet;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.MyTradeDAO;
import com.lemonmarket.web.dto.MytradeDTO;
import com.lemonmarket.web.dto.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MyPurchaseDetailsAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("구매 목록 기능");
        HttpSession session = request.getSession();
        // 세션 또는 요청 파라미터에서 userId 가져오기
        String userId = (String) session.getAttribute("userId");
        System.out.println(userId);

        ActionForward forward = new ActionForward();
        MyTradeDAO myTradeDAO = new MyTradeDAO();
        request.setAttribute("mytradeDTO", myTradeDAO.getPurchaseList(userId));

        forward.setPath("/myPage/purchaseList.jsp");
        forward.setRedirect(false);

        return forward;
    }
}