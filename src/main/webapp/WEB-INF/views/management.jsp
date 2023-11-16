<%--
  Created by IntelliJ IDEA.
  User: 김성태
  Date: 2023-11-14
  Time: 오전 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>결제 창</title>
</head>
<body>
<h1> 관리자 페이지 입니다.</h1>
<h2> 주문 관리 , 상품 등록</h2>


<li class="menu">
<a href="<c:url value='/dashboard' />" >대시보드</a>
<a href="<c:url value='/userManager' />">유저관리</a>
<a href="<c:url value='/ceramics'/>" >상품등록</a>
</li>


<div class="todoManager">
    <a href="<c:url value='/managerView' />" >신규 주문</a>
    <a href="<c:url value='/managerView' />" >취소 관리</a>
    <a href="<c:url value='/managerView ' />" >교환 관리</a>
    <a href="<c:url value='/managerView' />" >답변 대기 문의</a>
</div>

<div class="paymentManger">
    <a href="<c:url value='/paymentManager' />" >입금대기</a>
    <a href="<c:url value='/paymentManager' />" >취소 요청</a>
    <a href="<c:url value='/paymentManager' />" >취소 처리중</a>
    <a href="<c:url value='/paymentManager' />" >문의 </a>

</div>








</body>
</html>
