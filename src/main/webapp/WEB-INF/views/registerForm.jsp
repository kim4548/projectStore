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


</style>
<body>

<div id="menu">
    <li><a href="<c:url value='/ceramics'/>">Ceramics</a></li>
    <li><a href="<c:url value='/vase' />">Vase</a></li>
    <li><a href="<c:url value='/about' />">About</a></li>
    <li><a href="<c:url value='/' />">Home</a></li>
    <li><a href="<c:url value='/login/login'/>">Login</a></li>
    <li><a href="<c:url value='/cart'/>">Cart</a></li>
</div>

<div id = registerForm>
    <h1>회원가입</h1>

    <form:form modelAttribute="user">
        <input type="text" name="id" placeholder="아이디"  oninput="checkId(this.value)">
        <span id="input_re1">사용가능한 아이디 입니다</span>
        <span id="input_re2">아이디가 이미 존재합니다</span>
        <button type="button" onclick="checkDup()">중복 확인</button>


        <input type="password" name="pwd" placeholder="비밀번호" >
<%--        <input type="password" name="pwd1" placeholder="비밀번호 확인" >--%>
        <input type="email" name="email" placeholder="이메일" >
        <input type="text" name="name" placeholder="이름" >
        <input type="text" name="phoneNum" placeholder="연락처" >
        <input type="text" name="ssn" placeholder="생년월일(123456)" >
        <button formaction="<c:url value="/save"/>">가입하기</button>


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



    function checkId(id) {
        $.ajax({
            type: "POST",
            url: "/register",
            contentType: "application/json",
            data: JSON.stringify({ id: id }),
            success: function (data) {
                if (data.exists) {
                    $("#input_re1").hide();
                    $("#input_re2").show();
                } else {
                    $("#input_re1").show();
                    $("#input_re2").hide();
                }
            },
            error: function (error) {
                console.error('ERROR:', error);
            }
        });
    }


    function checkDup() {
        var id = $("input[name='id']").val();
        checkId(id);

        setTimeout(function () {
            if ($("#input_re1").is(":visible")) {
                alert("사용 가능한 아이디 입니다.")
            } else if ($("#input_re2").is(":visible")) {
                alert("아이디가 이미 존재 합니다.")
            }
        }, 500);
    }



</script>


</body>
</html>
