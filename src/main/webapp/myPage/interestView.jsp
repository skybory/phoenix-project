<!-- interestView.jsp -->

<%@page import="com.lemonmarket.web.dto.MytradeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>찜 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        #container {
            width: 600px;
            margin: 50px auto;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .item {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
    </style>
</head>
<body>
<div id="container">
    <h2 style="text-align: center; color: orange;">찜 목록5</h2>
    <div id="interestList">
        <% List<MytradeDTO> interestList = (List<MytradeDTO>) request.getAttribute("interestList");
        if (interestList != null && !interestList.isEmpty()) { %>
            <ul>
                <% for (MytradeDTO item : interestList) { %>
                    <li class="item">
                        <strong>관심 목록: </strong><%= item.getInterestList() %><br>
                    </li>
                <% } %>
            </ul>
        <% } else { %>
            <p>찜 목록이 없습니다.</p>
        <% } %>
    </div>
</div>
</body>
</html>