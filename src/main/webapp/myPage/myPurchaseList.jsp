<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구매 목록</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        #container {
            width: 1000px;
            margin: 20px auto;
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
        }

        h2 {
            font-size: 28px;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border-bottom: 1px solid #ddd;
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: #fddb3a; /* 컬럼명 노란색 배경색 적용 */
            color: #333;
            font-weight: bold;
            font-size: 16px;
        }

        tr:hover {
            background-color: #fcf3cf; /* 마우스 오버 시 연한 노란색 배경색 유지 */
        }

        .no-item {
            text-align: center;
            font-size: 18px;
            color: #666;
            padding: 20px;
        }
    </style>
</head>
<body>
<div id="container">
    <h2 style="text-align: center; color:orange;">내 구매 목록</h2>
    <table>
        <thead>
            <tr>
                <th>상품번호</th>
                <th>상품명</th>
                <th>거래금액</th>
                <th>거래장소</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${mytradeDTO != null and fn:length(mytradeDTO) > 0}">
                    <c:forEach var="trade" items="${mytradeDTO}" varStatus="loop">
                        <tr>
                            <c:choose>
                                <c:when test="${loop.first}">
                                    <td>${trade.productId}</td>
                                    <td>${trade.productTitle}</td>
                                    <td>${trade.productPrice}</td>
                                    <td>${trade.productLocation}</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${trade.productId}</td>
                                    <td>${trade.productTitle}</td>
                                    <td>${trade.productPrice}</td>
                                    <td>${trade.productLocation}</td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4" class="no-item">등록된 게시물이 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>
<div style="text-align: center; margin-top: 20px;">
        <a href="/myPage/myPage.jsp" style="display: inline-block; padding: 10px 20px; background-color: #fddb3a; color: #333; text-decoration: none; border-radius: 5px; font-weight: bold; font-size: 16px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); transition: background-color 0.3s ease;">
            마이 페이지로 돌아가기
        </a>
    </div>
</body>
</html>