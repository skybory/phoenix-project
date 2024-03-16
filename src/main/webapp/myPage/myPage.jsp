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
        border-radius: 5px;
        padding: 50px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .button {
        display: block;
        width: calc(100% - 40px); /* 버튼의 width에서 좌우 패딩값만큼 제외 */
        padding: 15px 20px;
        margin-bottom: 10px;
        margin-left: 0px; /* 왼쪽 마진 추가 */
        margin-right: 500px; /* 오른쪽 마진 추가 */
        background-color: #FFD700;
        color: #fff;
        text-align: center;
        text-decoration: none;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .button:hover {
        background-color: #FFA500;
    }
</style>
</head>
<body>
<div id="container">
    <h2 style="text-align: center; color:orange;">마이 페이지</h2>
    
   
    <!-- 구매내역 링크 -->
   <a class="button" href="${pageContext.request.contextPath}/my/PurchaseDetails.my">구매내역</a> 
    <!-- 판매내역 링크 -->
    <a class="button" href="${pageContext.request.contextPath}/my/SalesDetails.my">판매내역</a>
    <!-- 찜 목록 링크 -->
    <a class="button" href="${pageContext.request.contextPath}/my/InterestList.my">찜 목록</a>
    <!-- 내 정보 링크 -->
    <a class="button" href="${pageContext.request.contextPath}/my/ProfileView.my">내 정보</a>
    <div style="text-align: center; margin-top: 20px;">
        <a href="../index.jsp" style="display: inline-block; padding: 10px 20px; background-color: #fddb3a; color: #fff; text-decoration: none; border-radius: 5px; font-weight: bold; font-size: 16px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); transition: background-color 0.3s ease;">
            홈으로 돌아가기
        </a>
</div>
</div>

</body>
</html>