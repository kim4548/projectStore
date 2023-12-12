<%--
  Created by IntelliJ IDEA.
  User: 김성태
  Date: 2023-11-08
  Time: 오전 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<%--<c:set var="loginId" value="${pageContext.request.getSession(false)==null ?   '/'  : pageContext.request.session.getAttribute(id) }"/>--%>
<%--<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>--%>
<%--<c:set var="loginOut" value="${loginId=='' ? 'login' : 'logout'}"/>--%>
<html>
<head>
    <title>Cart</title>
<style>
    /* styles.css 파일 내용 */

    /* 전체 페이지 스타일 */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
        margin-top: 100px;
    }

    .container {
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    header {
        background-color: #333;
        color: #fff;
        padding: 10px 0;
    }

     ul.menu {
        list-style: none;
        padding: 0;
        margin: 0;
        text-align: center;
        display: flex;
        justify-content: space-around;
    }


   ul.menu li {
        margin-right: 10px;
    }

  ul.menu li a {
        color: #1c1919;
        text-decoration: none;
        padding: 5px 10px;
        border-radius: 5px;

    }

    h1 {
        margin-top: 0;
    }

    /* 주문 상세 정보 */
    .order-details {
        margin-bottom: 20px;
    }

    .total-summary {
        margin-top: 10px;
    }

    /* 버튼 스타일 */
    .buttons {
        text-align: right;
        margin-top: 20px;
    }

    .order-btn, .continue-shopping-btn {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .order-btn {
        background-color: #3498db;
        color: #fff;
        margin-right: 10px;
    }

    .continue-shopping-btn {
        background-color: #27ae60;
        color: #fff;
    }
    .navbar {
        display: flex;
        justify-content: center;
        overflow: hidden;
        background-color: #333;
        position: fixed;
        top: 0;
        width: 100%;
        margin-top: 0px;
    }

    .navbar a {
        float: left;
        display: block;
        color: #f2f2f2;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
    }

    .navbar a:hover {
        background: #ddd;
        color: black;
    }

</style>


</head>

<body>
<ul class="navbar">
    <a href="<c:url value='/ceramics'/>">Ceramics</a>
    <a href="<c:url value='/' />">Home</a>
    <a href="<c:url value='/board/list' />">Board</a>
<%--<li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>--%>
    <a href="<c:url value='/cart'/>">Cart</a>
</ul>

 <div class="container" >
     <h2>장바구니</h2>

     <form class="order-detailes">
         <h3>주문자 ID :${selcet.id} </h3>
         <table class="ShoppingList">
             <c:forEach var="select" items="${selcetList}">
                 <tr>
                     <td><input type="checkbox" name="selectedItems" value="${select.itemId}"></td>
                     <td>상품정보 : ${select.sellName} </td>
                     <td>수량 : ${select.sellCount} </td>
                     <td>주문 금액 : ${select.totalPrice} </td>
                 </tr>

                 <!-- 위의 형태에 따라 추가적인 아이템들을 표시할 수 있습니다 -->
             </c:forEach>

                 <div class="total-summary">
                     <p>총 주문 상품 개수 : ${selcet.sellCount}</p>
                     <p> 총 주문 가격:${selcet.totalPrice}</p>
                 </div>
         </table>
       <div class="buttons">
         <button class="order-btn" formaction="<c:url value='/order/order'/> ">주문하기</button>
         <button class="continue-shopping-btn" formaction="<c:url value='/ceramics'/>">계속 쇼핑하기</button>

       </div>

     </form>

 </div>

</body>
</html>
