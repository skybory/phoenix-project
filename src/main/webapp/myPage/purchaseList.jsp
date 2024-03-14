<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
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
    <!-- 게시글 작성 :게시글이 있는경우-->
			<c:choose>
				<c:when test="${mytradeDTO != null and fn:length(mytradeDTO) >0 }">
					<c:forEach var="trade" items="${mytradeDTO }">
						<tr align="center" valign="middle" 
							onmouseover="this.style.background='#bbdefb'"
                    	    onmouseout="this.style.background=''" height="23px"
						>
							<td>${userId }</td>
							<td height="23px;">${trade.productId}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr style="height: 50px;">
		               <td colspan="5" style="text-align: center">
		                  등록된 게시물이 없습니다.
		               </td>
		            </tr>
				</c:otherwise>
			</c:choose>	
</div>
</body>
</html>