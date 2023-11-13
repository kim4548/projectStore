<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'login' : 'logout'}"/>
<html>
<head>
	<title>Home</title>
</head>
<body>

<div id="menu">
	<li><a href="<c:url value='/ceramics'/>">Ceramics</a></li>
	<li><a href="<c:url value='/vase' />">Vase</a></li>
	<li><a href="<c:url value='/about' />">About</a></li>
	<li><a href="<c:url value='/' />">Home</a></li>
	<li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
	<li><a href="<c:url value='/cart'/>">Cart</a></li>
</div>

<h1>
	 홈 화면
</h1>

</body>
</html>
