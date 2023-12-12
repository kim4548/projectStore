<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'login' : 'logout'}"/>



<html>
<head>
	<title>Home</title>
<style>
	body{
		display: flex;
		flex-direction: column;
		align-items: center;
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

	body {
		font-family: Arial;
		margin: 0;
	}

	* {
		box-sizing: border-box;
	}

	img {
		vertical-align: middle;
	}

	/* Position the image container (needed to position the left and right arrows) */
	.container {
		position: relative;
		margin-top: 2px;
	}

	/* Hide the images by default */
	.mySlides {
		display: none;
	}

	/* Add a pointer when hovering over the thumbnail images */
	.cursor {
		cursor: pointer;
	}

	/* Next & previous buttons */
	.prev,
	.next {
		cursor: pointer;
		position: absolute;
		top: 40%;
		width: auto;
		padding: 16px;
		margin-top: -50px;
		color: white;
		font-weight: bold;
		font-size: 20px;
		border-radius: 0 3px 3px 0;
		user-select: none;
		-webkit-user-select: none;
	}

	/* Position the "next button" to the right */
	.next {
		right: 0;
		border-radius: 3px 0 0 3px;
	}

	/* On hover, add a black background color with a little bit see-through */
	.prev:hover,
	.next:hover {
		background-color: rgba(0, 0, 0, 0.8);
	}

	/* Number text (1/3 etc) */
	.numbertext {
		color: #f2f2f2;
		font-size: 12px;
		padding: 8px 12px;
		position: absolute;
		top: 0;
	}

	/* Container for image text */
	.caption-container {
		text-align: center;
		background-color: #222;
		padding: 2px 16px;
		color: white;
	}

	.row:after {
		content: "";
		display: table;
		clear: both;
	}

	/* Six columns side by side */
	.column {
		float: left;
		width: 16.66%;
	}

	/* Add a transparency effect for thumnbail images */
	.demo {
		opacity: 0.6;
	}

	.active,
	.demo:hover {
		opacity: 1;
	}

</style>




</head>
<body>

<div class="navbar">
	<a href="<c:url value='/ceramics'/>">Ceramics</a>
	<a href="<c:url value='/board/list' />">Board</a>
	<a href="<c:url value='/' />">Home</a>
	<a href="<c:url value='${loginOutLink}'/>">${loginOut}</a>
	<a href="<c:url value='/cart'/>">Cart</a>
</div>

<h2 style="text-align:center"></h2>

<div class="container">
	<div class="mySlides">
		<div class="numbertext">1 / 6</div>
		<img src="<c:url value='/display?fileName=onyoujae1.jpg'/> " style="width:100%">
	</div>

	<div class="mySlides">
		<div class="numbertext">2 / 6</div>
		<img src="<c:url value='/display?fileName=onyoujae2.jpg'/> " style="width:100%">
	</div>

	<div class="mySlides">
		<div class="numbertext">3 / 6</div>
		<img src="<c:url value='/display?fileName=onyoujae3.jpg'/> " style="width:100%">
	</div>

	<div class="mySlides">
		<div class="numbertext">4 / 6</div>
		<img src="<c:url value='/display?fileName=onyoujae4.jpg'/> " style="width:100%">
	</div>

	<div class="mySlides">
		<div class="numbertext">5 / 6</div>
		<img src="<c:url value='/display?fileName=onyoujae5.jpg'/> " style="width:100%">
	</div>

	<div class="mySlides">
		<div class="numbertext">6 / 6</div>
		<img src="<c:url value='/display?fileName=onyoujae6.jpg'/> " style="width:100%" alt="fff">
	</div>

	<a class="prev" onclick="plusSlides(-1)">❮</a>
	<a class="next" onclick="plusSlides(1)">❯</a>

	<div class="caption-container">
		<p id="caption"></p>
	</div>

	<div class="row">
		<div class="column">
			<img class="demo cursor" src="<c:url value='/display?fileName=onyoujae1.jpg'/> " style="width:100%" onclick="currentSlide(1)" alt="">
		</div>
		<div class="column">
			<img class="demo cursor" src="<c:url value='/display?fileName=onyoujae2.jpg'/> " style="width:100%" onclick="currentSlide(2)" alt="">
		</div>
		<div class="column">
			<img class="demo cursor" src="<c:url value='/display?fileName=onyoujae3.jpg'/> " style="width:100%" onclick="currentSlide(3)" alt="">
		</div>
		<div class="column">
			<img class="demo cursor" src="<c:url value='/display?fileName=onyoujae4.jpg'/> " style="width:100%" onclick="currentSlide(4)" alt="">
		</div>
		<div class="column">
			<img class="demo cursor" src="<c:url value='/display?fileName=onyoujae5.jpg'/> " style="width:100%" onclick="currentSlide(5)" alt="">
		</div>
		<div class="column">
			<img class="demo cursor" src="<c:url value='/display?fileName=onyoujae6.jpg'/> " style="width:100%" onclick="currentSlide(6)" alt="">




</div>
	</div>
</div>
</body>
<script>
	let slideIndex = 1;
	showSlides(slideIndex);

	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		let i;
		let slides = document.getElementsByClassName("mySlides");
		let dots = document.getElementsByClassName("demo");
		let captionText = document.getElementById("caption");
		if (n > slides.length) {slideIndex = 1}
		if (n < 1) {slideIndex = slides.length}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex-1].style.display = "block";
		dots[slideIndex-1].className += " active";
		captionText.innerHTML = dots[slideIndex-1].alt;
	}



</script>



</html>
