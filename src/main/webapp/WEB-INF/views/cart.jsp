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
</head>
<body>
<div id="menu">
    <li><a href="<c:url value='/ceramics'/>">Ceramics</a></li>
    <li><a href="<c:url value='/vase' />">Vase</a></li>
    <li><a href="<c:url value='/about' />">About</a></li>
    <li><a href="<c:url value='/' />">Home</a></li>
<%--    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>--%>
    <li><a href="<c:url value='/cart'/>">Cart</a></li>
</div>

 <div >
     <h2>장바구니</h2>
     <form>
         <table id="ShoppingList">
             <th>
                 <tr>
             <td><input type="checkbox" name=""></td>
             <td>상품정보</td>
             <td>수량 </td>
             <td>주문 금액</td>
             </tr>
             <tr>
                 <td><input type="checkbox" name=""></td>
                 <td id="listCnt">1</td>
                 <td>1</td>
                 <td>30,000</td>
             </tr>
             <tr>
                 <td><input type="checkbox" name=""></td>
                 <td id="listCnt1">2</td>
                 <td>2</td>
                 <td>50,000</td>
             </tr>
             </th>
         </table>
         <button>선택 상품 삭제</button>

         <table id="totalShoppingList">
             <th>
                 <tr>
             <td>총주문 상품 개수</td>
             </tr>
             <tr>
                 <td>총주문 가격</td>
             </tr>
             </th>
         </table>


         <button formaction="<c:url value='/order/order'/> ">주문하기</button>
         <button formaction="<c:url value='/ceramics'/>">계속 쇼핑하기</button>


     </form>

 </div>

</body>
</html>
