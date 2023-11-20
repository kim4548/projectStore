<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Login</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<style>
    #input_re1 {
        color: green;
        display: none;
    }
    #input_re2 {
        color: red;
        display: none;
    }



    /* styles.css 파일 내용 */

    /* 전체 페이지 스타일 */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
    }

    .container {
        width: 64%;
        height: 83%;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    #menu {
        background-color: #333;
        color: #fff;
        padding: 10px 0;
    }

    #menu ul.menu {
        list-style: none;
        padding: 0;
        margin: 0;
        text-align: center;
    }

    #menu ul.menu li {
        display: inline;
        margin-right: 10px;
    }

    #menu ul.menu li a {
        color: #fff;
        text-decoration: none;
    }

    h1 {
        margin-top: 0;
    }

    /* Form 스타일 */
    #input-field {
        margin-bottom: 10px;
        padding: 8px;
        width: 100%;
        box-sizing: border-box;
    }

    .message {
        display: none;
    }

    /* 다른 스타일들은 유지하고 위의 부분만 변경 */


</style>
<body>

<div id="menu">
    <ul class="menu">
    <li><a href="<c:url value='/ceramics'/>">Ceramics</a></li>
    <li><a href="<c:url value='/vase' />">Vase</a></li>
    <li><a href="<c:url value='/about' />">About</a></li>
    <li><a href="<c:url value='/' />">Home</a></li>
    <li><a href="<c:url value='/login/login'/>">Login</a></li>
    <li><a href="<c:url value='/cart'/>">Cart</a></li>
    </ul>
</div>

<div id ="registerForm" class="container">
    <h1>회원가입</h1>

    <form:form modelAttribute="user">
        <input type="text" class="id1" name="id" placeholder="아이디" id="input-field">
        <span id="input_re1">사용가능한 아이디 입니다</span>
        <span id="input_re2">아이디가 이미 존재합니다</span>



        <input type="password" name="pwd" placeholder="비밀번호" id="input-field" >
<%--        <input type="password" name="pwd1" placeholder="비밀번호 확인" >--%>
        <input type="email" name="email" placeholder="이메일" id="input-field" >
        <input type="text" name="name" placeholder="이름" id="input-field">
        <input type="text" name="phoneNum" placeholder="연락처" id="input-field">
        <input type="text" name="ssn" placeholder="생년월일(123456)" id="input-field">
        <button class="submit-btn" formaction="<c:url value='/save'/>">가입하기</button>


    </form:form>



</div>


<script>

    function formCheck(frm) {
        let message = '';
        if (frm.id.value.length < 5 || frm.id.value.length > 20) {
            message = "id 입력이 잘못되었습니다!";
            return false;
        }

        if (frm.pwd.value != frm.pwd1.value) {
            message = "비밀번호가 일치하지 않습니다.";
            return false;
        }
        if (frm.pwd.value.length < 5 || frm.pwd.value.length > 20) {
            message = "pwd 입력이 잘못되었습니다!";
            return false;
        }
        return true;
    }



$('.id1').on("property change keyup paste input",function  checkId(){

    // console.log("keyup 테스트");
    var id1= $('.id1').val();
    var data = {id:id1}

    $.ajax({
        type:"post",
        url:"/shop/checkId" ,
       data:data,
        success:function (result) {
            console.log("성공여부 " + result);
            if (result != "success") {
                $('#input_re1').hide();
                $('#input_re2').show();
            } else {
                $('#input_re2').hide();
                $('#input_re1').show();
            }
        }

    })


});




</script>


</body>
</html>
