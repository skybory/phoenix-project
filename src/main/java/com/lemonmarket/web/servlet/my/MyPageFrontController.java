package com.lemonmarket.web.servlet.my;

import java.io.IOException;

import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.mp")
public class MyPageFrontController extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doProcess(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doProcess(req, resp);
    }

    protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestURI = req.getRequestURI();
        ActionForward forward = null;

        System.out.println("프론트컨트롤러 도착!");
        
        // 요청 URI로부터 액션을 결정합니다.
        if (requestURI.endsWith("/InterestList.mp")) {
            forward = new MyInterestListAction().execute(req, resp);
        } else if (requestURI.endsWith("/SalesDetails.mp")) {
            forward = new MySalesDetailsAction().execute(req, resp);
        } else if (requestURI.endsWith("/mypage/PurchaseDetails.mp")) {
            forward = new MyPurchaseDetailsAction().execute(req, resp);
        } else if (requestURI.endsWith("/ProfileView.mp")) {
            forward = new MyProfileViewAction().execute(req, resp);
        }

        if (forward != null) {
            if (forward.isRedirect()) {
                resp.sendRedirect(forward.getPath());
            } else {
                req.getRequestDispatcher(forward.getPath()).forward(req, resp);
            }
        }
    }
}