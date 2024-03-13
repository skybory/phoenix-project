package com.lemonmarket.web.servlet;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.MyTradeDAO;
import com.lemonmarket.web.dto.MytradeDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

public class MyPurchaseDetailsAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("구매 목록 기능");

        // 사용자 번호가 파라미터로 전달되었다고 가정합니다.
        String userNumStr = request.getParameter("userNum");
        int userNum = 0;
        if (userNumStr != null && !userNumStr.isEmpty()) {
            userNum = Integer.parseInt(userNumStr);
        }

        ActionForward forward = new ActionForward();
        MyTradeDAO myTradeDAO = new MyTradeDAO();

        try {
            // 사용자의 구매 목록을 가져옵니다.
            List<MytradeDTO> purchaseList = myTradeDAO.purchaseList(userNum);

            // 가져온 구매 목록을 request에 저장합니다.
            request.setAttribute("purchaseList", purchaseList);

            // 구매 목록 페이지로 포워딩합니다.
            forward.setPath("/myPage/purchaseList.jsp");
            forward.setRedirect(false);
        } catch (Exception e) {
            e.printStackTrace();
            // 오류 발생 시 에러 페이지로 리다이렉트할 수 있습니다.
            forward.setPath("/error.jsp");
            forward.setRedirect(true);
        }

        return forward;
    }
}