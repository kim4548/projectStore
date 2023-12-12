<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>

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

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        .header {
            text-align: center;
            padding: 32px;
        }

        .row {
            display: -ms-flexbox; /* IE 10 */
            display: flex;
            -ms-flex-wrap: wrap; /* IE 10 */
            flex-wrap: wrap;
            padding: 0 4px;
        }

        /* Create two equal columns that sits next to each other */
        .column {
            -ms-flex: 50%; /* IE 10 */
            flex: 50%;
            padding: 0 4px;
        }

        .column img {
            margin-top: 8px;
            vertical-align: middle;
        }

        /* Style the buttons */
        .btn {
            border: none;
            outline: none;
            padding: 10px 16px;
            background-color: #f1f1f1;
            cursor: pointer;
            font-size: 18px;
        }

        .btn:hover {
            background-color: #ddd;
        }

        .btn.active {
            background-color: #666;
            color: white;
        }
    </style>
</head>
<body>

<div class="navbar">
    <a href="<c:url value='/' />">Home</a>
</div>
<!-- Header -->
<div class="header" id="myHeader">
    <h1>Ceramics</h1>
    <button class="btn" onclick="one()">1</button>
    <button class="btn active" onclick="two()">2</button>
    <button class="btn" onclick="four()">4</button>
</div>

<!-- Photo Grid -->
<div class="row">
    <div class="column">
        <a href="<c:url value='/admin/goodsManage'/> ">
        <img src="<c:url value='/display?fileName=onyoujae18.jpg'/>" style="width:100%"></a>
        <img src="<c:url value='/display?fileName=onyoujae17.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae16.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae15.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae14.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae13.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae12.jpg'/>" style="width:100%">
    </div>
    <div class="column">
        <img src="<c:url value='/display?fileName=onyoujae11.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae10.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae9.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae8.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae7.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae6.jpg'/>" style="width:100%">
    </div>
    <div class="column">
        <img src="<c:url value='/display?fileName=onyoujae5.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae4.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae3.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae2.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=onyoujae1.jpg'/>" style="width:100%">
        <img src="<c:url value='/display?fileName=moonjar.jpg'/>" style="width:100%">
        <img src="/w3images/paris.jpg" style="width:100%">
    </div>
    <div class="column">
        <img src="/w3images/underwater.jpg" style="width:100%">
        <img src="/w3images/ocean.jpg" style="width:100%">
        <img src="/w3images/wedding.jpg" style="width:100%">
        <img src="/w3images/mountainskies.jpg" style="width:100%">
        <img src="/w3images/rocks.jpg" style="width:100%">
        <img src="/w3images/underwater.jpg" style="width:100%">
    </div>
</div>

<script>
    // Get the elements with class="column"
    var elements = document.getElementsByClassName("column");

    // Declare a loop variable
    var i;

    // Full-width images
    function one() {
        for (i = 0; i < elements.length; i++) {
            elements[i].style.msFlex = "100%";  // IE10
            elements[i].style.flex = "100%";
        }
    }

    // Two images side by side
    function two() {
        for (i = 0; i < elements.length; i++) {
            elements[i].style.msFlex = "50%";  // IE10
            elements[i].style.flex = "50%";
        }
    }

    // Four images side by side
    function four() {
        for (i = 0; i < elements.length; i++) {
            elements[i].style.msFlex = "25%";  // IE10
            elements[i].style.flex = "25%";
        }
    }

    // Add active class to the current button (highlight it)
    var header = document.getElementById("myHeader");
    var btns = header.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function() {
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
        });
    }
</script>

</body>
</html>
