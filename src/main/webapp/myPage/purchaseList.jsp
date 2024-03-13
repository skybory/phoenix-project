
Copy code
<%@page import="java.util.List"%>
<%@page import="com.lemonmarket.web.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구매 목록</title>
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
    <h2 style="text-align: center; color: orange;">구매 목록</h2>
    <div id="purchaseList">
        <% List<ProductDTO> purchaseList = (List<ProductDTO>) request.getAttribute("purchaseList");
        if (purchaseList != null && !purchaseList.isEmpty()) { %>
            <ul>
                <% for (ProductDTO product : purchaseList) { %>
                    <li class="item">
                        <strong>상품명: </strong><%= product.getProductTitle() %><br>
                        <strong>가격: </strong><%= product.getProductCost() %><br>
                        <strong>구매일: </strong><%= product.getUploadDate() %><br>
                    </li>
                <% } %>
            </ul>
        <% } else { %>
            <p>구매 목록이 없습니다.</p>
        <% } %>
    </div>
</div>
</body>
</html>