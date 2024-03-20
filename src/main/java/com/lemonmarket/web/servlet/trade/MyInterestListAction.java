//// MyInterestListAction.java
//
//package com.lemonmarket.web.servlet.trade;
//
//import java.util.List;
//
//import com.lemonmarket.web.action.Action;
//import com.lemonmarket.web.action.ActionForward;
//import com.lemonmarket.web.dao.MyTradeDAO;
//import com.lemonmarket.web.dao.TradeDAO;
//import com.lemonmarket.web.dto.TradeDTO;
//
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//public class MyInterestListAction implements Action{
//
//    @Override
//    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
//        
//        HttpSession session = request.getSession();
//        ActionForward forward = new ActionForward();
//        String userId = (String) session.getAttribute("userId");
//        System.out.println(userId);
//        TradeDAO tradeDAO = new TradeDAO();
//        request.setAttribute("mytradeDTO", tradeDAO.getInterestList(userId));
//        
//        forward.setPath("/myPage/myInterestList.jsp");
//        forward.setRedirect(false);
//        
//        return forward;
//    }
//
//}
