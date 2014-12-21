<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request" />
<html>
<head>
	<title>myCalendar: <c:out value="${pageTitle}" />
	</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<c:url var="resourceUrl" value="/resources" />
	<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css" rel="stylesheet" />
	<link href="${resourceUrl}/css/custom.css" rel="stylesheet" />
	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]-->
</head>
<body class="header" >
	<div class="container">
		<jsp:include page="./includes/header.jsp" />
		<div align="center">
			
		
			<form:form action="signup" method="post" commandName="userForm"> 
				<h2 class=" form-signin-heading">myCalendar 회원가입</h2> 
				<form:input path='email' type="email" class="form-signin form-control" placeholder="아이디" />
				<p></p>
				<form:input path='password' type="password" class="form-signin form-control" placeholder="비밀번호" />
				<p></p>
				<form:input path='name' class="form-signin form-control" placeholder="이름" />
				<p></p>
				<input class="form-signin btn btn-lg btn-primary btn-block" type="submit" value="회원가입" />
			</form:form>
			    
		</div>


		<jsp:include page="./includes/footer.jsp" />
	</div>
</body>
</html>