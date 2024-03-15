// MyInterestListAction.java

package com.lemonmarket.web.servlet;

import java.util.List;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.MyTradeDAO;
import com.lemonmarket.web.dto.MytradeDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MyInterestListAction implements Action{

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("찜목록 기능");
        System.out.println("찜목록 기능");
        System.out.println("찜목록 기능");
        
        HttpSession session = request.getSession();
        ActionForward forward = new ActionForward();
        
        String userId = (String) session.getAttribute("userId");
        System.out.println(userId);
        MyTradeDAO myTradeDAO = new MyTradeDAO();
        request.setAttribute("mytradeDTO", myTradeDAO.getInterestList(userId));
        
        forward.setPath("/myPage/InterestList.jsp");
        forward.setRedirect(false);
        
        return forward;
    }

}
