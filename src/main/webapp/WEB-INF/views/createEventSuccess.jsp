<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request"/>
<html lang="en">
<head>
	<title>myCalendar: <c:out value="${pageTitle}"/> </title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <c:url var="resourceUrl" value="/resources"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css" rel="stylesheet"/>    
    <link href="${resourceUrl}/css/custom.css" rel="stylesheet"/>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body class="header" onload='document.loginForm.summary.focus();'>
	<div class="container">
	<jsp:include page="./includes/header.jsp"/>
     
    <div align="center">
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>CreateEvent Succeeded!</h2></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                </td>
            </tr>
            <tr>
                <td>when :</td>
                <td>${eventForm.when.time}</td>
            </tr>
            <tr>
                <td>summary :</td>
                <td>${eventForm.summary}</td>
            </tr>
            <tr>
                <td>description :</td>
                <td>${eventForm.description}</td>
            </tr>
            <tr>
                <td>owner :</td>
                <td>${eventForm.owner.name}</td>
            </tr>
            
            <!-- 
            <tr>
                <td>Role:</td>
                <td>${userForm.email}</td>
            </tr>
             -->        </table>
    </div>

	
	<jsp:include page="./includes/footer.jsp"/>
	</div>
</body>
</html>