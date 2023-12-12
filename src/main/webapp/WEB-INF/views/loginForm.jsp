<%@ page import="java.math.BigInteger" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%--
  Created by IntelliJ IDEA.
  User: 김성태
  Date: 2023-11-08
  Time: 오전 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
    * { box-sizing:border-box; }
    a { text-decoration: none; }
    form{
        display: flex;
        align-items: center;
        flex-direction: column;
        justify-content: center;
    }
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f8f8;
        margin: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
    }
    .menu {
        display: flex;
        list-style-type: none;
        padding: 0;
        position: absolute;
        top: 20px;
        left: 20px;
    }
    .menu li {
        margin-right: 10px;
    }
    .menu li a {
        color: #000;
    }
    .LoginForm {
        width: 41%;
        height: 77%;
        display: flex;
        flex-direction: column;
        align-items: center;
        border: 3px solid #000;
        border-radius: 35px;
        padding: 20px;
        background-color: #fff;
        margin-top: 100px;
        padding-top: 45px;
    }
    .LoginForm input[type='text'],
    .LoginForm input[type='password'] {
        width: 300px;
        height: 40px;
        border: 1px solid #000;
        border-radius: 5px;
        padding: 0 10px;
        margin-bottom: 10px;
    }
    .LoginForm button[type='submit'] {
        background-color: #000;
        color: white;
        width: 300px;
        height: 50px;
        font-size: 17px;
        border: none;
        border-radius: 5px;
        margin: 20px 0 30px 0;
    }
    #title {
        font-size: 50px;
        margin: 40px 0 30px 0;
    }
    #msg {
        height: 30px;
        text-align: center;
        font-size: 16px;
        color: red;
        margin-bottom: 20px;
    }

    .navbar {
        display: flex;
        justify-content: center;
        overflow: hidden;
        background-color: #333;
        position: fixed;
        top: 0;
        width: 100%;
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
        <%
    String clientId = "Q6268OHw9RpPoJv6vatk";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:80/shop/login/callback/naverLogin", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
%>

<div class="navbar">
<a href="<c:url value='/ceramics'/>">Ceramics</a>
    <a href="<c:url value='/board/list' />">Board</a>
    <a href="<c:url value='/' />">Home</a>
    <a href="<c:url value='/cart'/>">Cart</a>
</div>


<div class="LoginForm">

<%--    <a href="#" ><img src="../imgs/kakao-login.png" style="width: 297px; height: 47px; margin-bottom: 20px;"></a>--%>
    <a href="<%=apiURL%>"><img  src="http://static.nid.naver.com/oauth/small_g_in.PNG" style="width: 155px; height: 48px; "/></a><br>

    <form action="<c:url value='/login/login' />"  method="post" onsubmit="loginCheck(this)" >
    <input type="text" name="id" value="${cookie.id.value}" placeholder="ID를 입력하세요">
    <input type="password" name="pwd" placeholder="PWD를 입력하세요">
    <input type="hidden" name="toURL" value="${param.toURL}">
    <input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value=="" ? "":"check"} >
    <label>로그인 상태 유지</label>
    <button type="submit">로그인</button>
        <div class="subBtn">
    <button formaction="<c:url value='/register' />" formmethod="post">회원가입</button>
    <button class="hidden-button"  formaction="<c:url value='/order/order' /> " >비회원 주문</button>
        </div>
    </form>









</body>
</html>





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
