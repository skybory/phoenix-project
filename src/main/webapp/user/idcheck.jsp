<%@page import="com.lemonmarket.web.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String userId = request.getParameter("userId");
    UserDAO udao = new UserDAO();
    // udao.checkId(userId
    
    
    if( !udao.checkId(userId) ){        // 중복아이디 없음
        out.print("ok");
    } else {                            // 중복아이디 있음
        out.print("not-ok");
    }

%>