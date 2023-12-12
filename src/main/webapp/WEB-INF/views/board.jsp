<%--
  Created by IntelliJ IDEA.
  User: 김성태
  Date: 2023-11-22
  Time: 오후 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'Logout'}"/>
<html>
<head>
    <title>공지사항</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/menu.css'/>">
    <script src="https://kit.fontawesome.com/7ee9b7a626.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Noto Sans KR", sans-serif;
        }

        .container {
            width : 50%;
            margin : auto;
        }

        .writing-header {
            position: relative;
            margin: 20px 0 0 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #323232;
        }

        input {
            width: 100%;
            height: 35px;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            padding: 8px;
            background: #f8f8f8;
            outline-color: #e6e6e6;
        }

        textarea {
            width: 100%;
            background: #f8f8f8;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            resize: none;
            padding: 8px;
            outline-color: #e6e6e6;
        }

        .frm {
            width:100%;
        }
        .btn {
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
        }

        .btn:hover {
            text-decoration: underline;
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


<div class="navbar">
    <nav>
        <a href="<c:url value='/ceramics'/>">Ceramics</a>
        <a href="<c:url value='/board/list' />">Board</a>
        <a href="<c:url value='/' />">Home</a>
        <a href="<c:url value='${loginOutLink}'/>">${loginOut}</a>
        <a href="<c:url value='/cart'/>">Cart</a>
    </nav>
</div>


<script>
    let msg='${msg}';
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해주세요");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요");

</script>
<div class="container">
    <h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" :"읽기"}</h2>
    <form id="form" class="frm" action="" method="post">
        <input type="hidden" name="bno" value="${boardDto.bno}">
        <input name="title" type="text" value="${boardDto.title}" placeholder="제목을 입력해 주세요" ${mode=="new" ? "":"readonly='readonly'"}><br>
        <textarea name="content" rows="20" placeholder=" 내용을 입력해주세요. " ${mode=="new" ? "":"readonly='readonly'"}>${boardDto.content}</textarea><br>


        <c:if test="${mode=='new'}">
            <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i>등록</button>
        </c:if>
        <c:if test="${mode=='new'}">
            <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i>글쓰기</button>
        </c:if>
    <c:if test="${boardDto.writer==loginId}">
        <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i>수정</button>
        <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i>삭제</button>
    </c:if>
        <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i>목록</button>
    </form>
</div>
</body>
<script>
    $(document).ready(function () {
        let formCheck= function (){
        let form = document.getElementById("form");
        if (form.title.value == "") {
            alert("제목을 입력해 주세요.");
            form.title.focus();
            return false;
        }

        if (form.content.value == "") {
            alert("내용을 입력해 주세요");
            form.content.focus();
            return false;
        }
        return true;
    }

    $("#writeNewBtn").on("click", function(){
        location.href="<c:url value='/board/write'/>";
    });

        $("#writeBtn").on("click",function () {
            let form =$('#form');
            form.attr("action","<c:url value='/board/write'/>");
            form.attr("method","post");

            if(formCheck())
                form.submit();
        });

        $("#modifyBtn").on("click",function (){
            let form = $("#form");
            let isReadonly = $("input[name=title]").attr('readonly');

            if(isReadonly=='readonly'){
                $(".writing-header").html("게시판 수정");
                $("input[name=title]").attr('readonly',false);
                $("textarea").attr('readonly',false);
                $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
                return;
            }

            form.attr("action","<c:url value='/board/modify${searchCondition.queryString}'/> ");
            form.attr("method","post");
            if(formCheck())
                form.submit();
        });


        $("#removeBtn").on("click",function () {
            if(!confirm("정말로 삭제하겠습니까?"))return;

            let form =$("#form");
            form.attr("action","<c:url value='/board/remove${searchCondition.queryString}'/> ");
            form.attr("method","post");
            form.submit();
        });


        $("#listBtn").on("click",function () {
            location.href="<c:url value='/board/list${searchCondition.queryString}'/>";
        })
    });






</script>




</html>
