<%--
  Created by IntelliJ IDEA.
  User: 김성태
  Date: 2023-11-08
  Time: 오전 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>Login</title>
</head>
<body>

<div id="menu">
<li><a href="<c:url value='/ceramics'/>">Ceramics</a></li>
<li><a href="<c:url value='/vase' />">Vase</a></li>
    <li><a href="<c:url value='/about' />">About</a></li>
    <li><a href="<c:url value='/' />">Home</a></li>
    <li><a href="<c:url value='/cart'/>">Cart</a></li>
</div>


<div id="LoginForm">

<a href="" >카카오로 시작하기</a>
<a href="" >네이버로 시작하기 </a>
<form action="<c:url value='/login/management' />"  method="post" onsubmit="loginCheck(this)" >
    <input type="text" name="id" value="${cookie.id.value}" placeholder="ID를 입력하세요">
    <input type="password" name="pwd" placeholder="PWD를 입력하세요">
    <input type="" name="toURL">
    <input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value=="" ? "":"check"} >로그인 상태 유지
    <button>로그인</button>
    <button formaction="<c:url value='/register' />" formmethod="post">회원가입</button>
    <button class="hidden-button"  formaction="<c:url value='/order/order' /> " >비회원 주문</button>
</form>

</div>
<script>
    function formCheck(frm){
        let message ="";
        if(frm.id.value.length< 5 || frm.id.value.length>20){
            message="id를 잘못 입력하셨습니다!"
        }
        if(frm.pwd.value.length< 5 || frm.pwd.value.length>20){
            message="pwd를 잘못 입력하셨습니다!"
        }


    }


</script>

</body>




</html>
