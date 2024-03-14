<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;  
    } 
    #container {
        width: 400px;
        margin: 50px auto;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 110px;
        padding: 100px; 
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .button {
        display: block;
        width: 100%;
        padding: 15px 20px;
        margin-bottom: 10px;
        background-color: #007bff;
        color: #fff;
        text-align: center;
        text-decoration: none;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div id="container">
    <h2 style="text-align: center; color:orange;">마이 페이지4</h2>
    
   
    <!-- 구매내역 링크 -->
   <a class="button" href="${pageContext.request.contextPath}/mypage/PurchaseDetails.bo">구매내역</a> 
    <!-- 판매내역 링크 -->
    <a class="button" href="${pageContext.request.contextPath}/mypage/SalesDetails.mp">판매내역</a>
    <!-- 찜 목록 링크 -->
    <a class="button" href="${pageContext.request.contextPath}/mypage/InterestList.mp">찜 목록</a>
    <!-- 내 정보 링크 -->
    <a class="button" href="${pageContext.request.contextPath}/mypage/ProfileView.mp">내 정보</a>
</div>
</body>
</html>