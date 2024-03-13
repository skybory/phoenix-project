// MyInterestListAction.java

package com.lemonmarket.web.servlet;

import java.util.List;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.MyTradeDAO;
import com.lemonmarket.web.dto.MytradeDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MyInterestListAction implements Action{

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("찜목록 기능");
        System.out.println("찜목록 기능");
        System.out.println("찜목록 기능");
        
        ActionForward forward = new ActionForward();
        MyTradeDAO mytrade = new MyTradeDAO();
        
        // 사용자 번호가 null이거나 비어있는지 확인하여 처리합니다.
        int userNum = 0; // 기본값으로 초기화합니다.
        String userNumStr = request.getParameter("userNum");
        if (userNumStr != null && !userNumStr.isEmpty()) {
            try {
                userNum = Integer.parseInt(userNumStr); // 문자열을 정수로 변환합니다.
            } catch (NumberFormatException e) {
                e.printStackTrace();
                // 예외 처리: 사용자 번호가 올바른 형식이 아닌 경우에 대한 처리
            }
        }
        
        List<MytradeDTO> interestList = mytrade.interestList(userNum); // MyTradeDAO에서 찜목록 가져오기
        
        request.setAttribute("interestList", interestList); // 가져온 찜목록은 request에 저장하기
        
        forward.setPath("/myPage/interestView.jsp"); // 찜목록페이지로 포워딩
        forward.setRedirect(false);
        
        return forward;
    }

}
