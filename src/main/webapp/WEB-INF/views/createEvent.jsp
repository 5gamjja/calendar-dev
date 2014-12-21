<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request"/>
<html>
<head>
	<title>myCalendar: <c:out value="${pageTitle}"/> </title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <c:url var="resourceUrl" value="/resources"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css" rel="stylesheet"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap-datetimepicker.css" rel="stylesheet"/>    
    <link href="${resourceUrl}/css/custom.css" rel="stylesheet"/>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body class="header" onload='document.loginForm.summary.focus();'>
	<div class="container">
	<jsp:include page="./includes/header.jsp"/>
    
    
    <div class="form-signin">
			<h2 class=" form-signin-heading">이벤트 생성하기</h2>
	</div> 
     
    <form:form action="form" method="post" commandName="eventForm"> 
		<div class="form-group">
	    	<div class='col-md-3'>
			</div>
			<div class="container">
			    <div class="row">
			        <div class='col-md-6'>
						<label>Summary</label>
			   			<form:input path='summary' name='summary' class="form-control" placeholder="Summary" />
					</div>
				</div>
			</div>
		</div>
		<p></p>
		
		<div class="form-group">
	    	<div class='col-md-3'>
			</div>
			<div class="container">
			    <div class="row">
			        <div class='col-md-6'>
   						<label>Description</label>
   						<form:input path='description' class="form-control" placeholder="Description" />
   					</div>
   				</div>
   			</div>
   		</div>
   		<p></p>
   		
   		
   		<div class="form-group">
	    	<div class='col-md-3'>
			</div>
			<div class="container">
			    <div class="row">
			        <div class='col-md-6'>
			       		<label>When</label>
		                <div class='input-group date' id='datetimepicker1'>
		                    <input type='text' class="form-control" />
		                    <span class="input-group-addon">
		                    	<span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
			        </div>
			    </div>
			</div>
    	</div>
    	<input class="form-signin btn btn-lg btn-primary btn-block" type="submit" value="생성하기" />
	</form:form>

	
<jsp:include page="./includes/footer.jsp"/>
</div>
<script type="text/javascript" src="${resourceUrl}/javascript/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${resourceUrl}/bootstrap-3.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${resourceUrl}/javascript/moment.js"></script>
<script type="text/javascript" src="${resourceUrl}/javascript/bootstrap-datetimepicker.js"></script>
<script type="text/javascript">
$(function () {
    $('#datetimepicker1').datetimepicker();
});
</script>
</body>
</html>