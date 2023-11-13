<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 김성태
  Date: 2023-11-09
  Time: 오전 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

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

<form name="orderInformation">
    <h3>주문자 정보</h3>
    <input name="name" placeholder="이름">
    <input name="phoneNum" placeholder="연락처">
    <input name="email" placeholder="이메일 주소 aaaa@aaa.com">

    <h3>배송정보</h3>
    <input type="checkbox" ><label>주문자 정보와 동일</label>
    <input name="name" placeholder="수령인">
    <input name="phoneNum" placeholder="연락처">
    <input name="addressNum" placeholder="우편번호">
    <button>주소 찾기</button>
    <input name="address" placeholder="주소">
    <input name="detailAddress" placeholder="상세 주소">

    <h3>배송 메모</h3>
    <select>
        <option>부재시 연락 부탁드립니다.</option>
        <option>문 앞에 두고 가주세요</option>
        <option>경비실에 보관 부탁드립니다</option>
        <option>직접입력</option>
    </select>
</form>


<div>





</div>








</body>
</html>
