<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body class="header">
<div class="container">
<jsp:include page="./includes/header.jsp"/>
	<div align="center">
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>myCalendar에 오신것을 환영합니다!</h2></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <h3>Thank you for registering! Here's the review of your details:</h3>
                </td>
            </tr>
            <tr>
                <td>사용자 ID:</td>
                <td>${userForm.email}</td>
            </tr>
            <tr>
                <td>사용자 이름:</td>
                <td>${userForm.name}</td>
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