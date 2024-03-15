//package com.lemonmarket.web.filter;
//
//import java.io.IOException;
//import jakarta.servlet.DispatcherType;
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
//
//public class AuthenticationFilter implements Filter {
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpServletResponse httpResponse = (HttpServletResponse) response;
//        
//        String urlPattern = httpRequest.getRequestURI();
//        
//        // .cat, .map, .my, .pr로 끝나는 URL 패턴에만 필터 적용
//        if (urlPattern.endsWith(".cat") || urlPattern.endsWith(".map") || urlPattern.endsWith(".my") || urlPattern.endsWith(".pr")) {
//            HttpSession session = httpRequest.getSession(false); // 세션이 없을 경우 새로 생성하지 않음
//            
//            boolean loggedIn = session != null && session.getAttribute("userDTO") != null;
//            
//            String loginURI = httpRequest.getContextPath() + "/board/Login.bo"; // 로그인 페이지의 URI
//            
//            boolean loginRequest = httpRequest.getRequestURI().equals(loginURI);
//            
//            if (loggedIn || loginRequest) {
//                // 로그인되어 있거나 로그인 페이지에 요청이 오면 요청을 허용
//                chain.doFilter(request, response);
//            } else {
//                // 로그인되어 있지 않고 로그인 페이지에 요청이 아닌 경우 로그인 페이지로 리다이렉트
//                httpResponse.sendRedirect(loginURI);
//            }
//        } else {
//            // .cat, .map, .my, .pr로 끝나지 않는 URL 패턴일 경우 필터를 거치지 않고 요청을 허용
//            chain.doFilter(request, response);
//        }
//    }
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        // 필터 초기화 작업
//    }
//
//    @Override
//    public void destroy() {
//        // 필터 파괴 시의 작업
//    }
//}