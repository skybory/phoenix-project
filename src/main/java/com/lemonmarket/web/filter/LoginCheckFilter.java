//package com.lemonmarket.web.filter;
//
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.FilterConfig;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebFilter("*.bo")
//public class LoginCheckFilter implements Filter {
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        // 필요한 경우 초기화 작업 수행
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        String requestURI = httpRequest.getRequestURI();
//        HttpServletResponse httpResponse = (HttpServletResponse) response;
//
//        try {
//            // 로그인 페이지인 경우에는 필터를 건너뛰고 다음 필터 또는 서블릿을 실행합니다.
//            if (requestURI.endsWith("/Login.bo") || requestURI.endsWith("/Join.bo")) {
//                chain.doFilter(request, response);
//                return;
//            }
//
//            // 세션을 확인하여 로그인 여부를 확인합니다.
//            HttpSession session = httpRequest.getSession(false);
//            if (session == null || session.getAttribute("userDTO") == null) {
//                // 로그인이 되어있지 않으면 로그인 페이지로 리다이렉트합니다.
//                httpResponse.sendRedirect("/board/LoginCheck.bo");
//                return;
//            }
//
//            // 로그인이 되어있는 경우에는 다음 필터 또는 서블릿을 실행합니다.
//            chain.doFilter(request, response);
//        } catch (Exception e) {
//            throw new ServletException("Authentication Filter Error", e);
//        }
//    }
//
//    @Override
//    public void destroy() {
//        // 필요한 경우 리소스 해제 등의 정리 작업 수행
//    }
//}