<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true"%>

<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request"/>
<html>
<head>
	<title>myCalendar: <c:out value="${pageTitle}" /> </title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <c:url var="resourceUrl" value="/resources"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css" rel="stylesheet"/>
    <link href="${resourceUrl}/css/custom.css" rel="stylesheet"/>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body class="header" onload='document.loginForm.email.focus();'>
	<div class="container">
	<jsp:include page="./includes/header.jsp"/>
		<form class="form-signin">
			<h2 class=" form-signin-heading">myCalendar 로그인</h2>
	 
			<c:if test="${not empty error}">
				<div class="error">${error}</div>
			</c:if>
			<c:if test="${not empty msg}">
				<div class="msg">${msg}</div>
			</c:if>
		</form>
		
 		<c:url value="/j_spring_security_check" var = "loginUrl"/>
		<form name='loginForm' action="${loginUrl}" method='POST'>
				<input type='text' name='email' class="form-signin form-control" placeholder="아이디" />
				<p></p>
				<input type='password' name='password' class="form-signin form-control" placeholder="비밀번호" />
				<p></p>
				<input class="form-signin btn btn-lg btn-primary btn-block" name="submit" type="submit" value="로그인" />
		</form>
		<p></p>
		<div class="row">
			<div class="col-xs-4 col-xs-offset-7">
						<span class="bar">|</span>
						<c:url var="signupUrl" value="/users/signup" />
						<a href="${signupUrl}">회원가입</a>
						<span class="bar">|</span>
			</div>
		</div>

		<jsp:include page="./includes/footer.jsp"/>
	</div>
</body>
</html>