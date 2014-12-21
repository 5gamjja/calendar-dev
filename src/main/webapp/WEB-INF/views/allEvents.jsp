<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
<body class="header" onload='document.loginForm.id.focus();'>
	<div class="container">
	<jsp:include page="./includes/header.jsp"/>
		
		
		<div class="table-responsive">
			<table class="table table-hover">
 				<tr>
					<th>번호</th>
					<th>개요</th>
					<th>언제</th>
					<th>내용</th>
					<th>개최자</th>
					<th>아이디</th>
					<th>좋아요</th>
					<th>EventLevel</th>
					<th>
				</tr>
				<form:form action="form" method="post" commandName="eventForm"> 
					<c:forEach var="events" items="${events}" varStatus="status">
						<tr>
							<td><c:out value="${status.count}"/></td>
							<td>${events.summary}</td>
							<td>${events.when.time}</td>
							<td>${events.description}</td>
							<td>${events.owner.name}</td>
							<td>${events.owner.email}</td>
							<td>${events.numLikes}</td>
							<td>${events.eventLevel}</td>
							<td>
								<button type="button" class="btn btn-default btn-sm">
	 								<span class="glyphicon glyphicon-thumbs-up"></span>참여
								</button>
							</td>
						</tr>
						
						<c:forEach var="attendees" items="${attendees}" varStatus="status2">
							<c:if test="${events.id == attendees.event.id}">
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td>참여자</td>
									<td>${attendees.attendee.name}</td>
									<td>${attendees.attendee.email}</td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</c:if>	
						</c:forEach>
					</c:forEach> 	
				</form:form>			
			</table>
		</div>				
		
	<jsp:include page="./includes/footer.jsp"/>
	</div>
</body>
</html>