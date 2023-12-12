<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 20px auto;
            display: table;
        }

        li {
            display: table-row;
            margin-bottom: 10px;
        }

        a {
            display: table-cell;
            text-align: center;
            text-decoration: none;
            padding: 10px 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            color: #333;
            transition: all 0.3s ease;
        }

        a:hover {
            background-color: #ddd;
            color: #000;
        }
    </style>
</head>
<body>
<h1>관리자 페이지</h1>
<ul>
    <li><a href="<c:url value='/admin/goodEnroll'/>">상품등록</a></li>
    <li><a href="<c:url value='/admin/goodsManage'/>">상품조회</a></li>
    <li><a href="<c:url value='/admin/goodsModify'/>">상품삭제</a></li>
    <li><a href="<c:url value='/cart'/>">주문현황</a></li>
    <li><a href="<c:url value='/board/list'/> ">게시판 관리</a></li>
</ul>
</body>
</html>
