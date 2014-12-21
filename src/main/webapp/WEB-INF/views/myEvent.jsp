<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request"/>
<html lang="en">
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
<body class="header">
<div class="container">
<jsp:include page="./includes/header.jsp"/>

	<div class="table-responsive">
		<table class="table table-hover">
				<tr>
					<p class="text-muted"> 생성한 이벤트</p>
				</tr>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>언제</th>
					<th>내용</th>
					<th>좋아요</th>
					<th>EventLevel</th>
					<th>
				</tr>
				<c:forEach var="events" items="${events}" varStatus="status">
					<tr>
						<td><c:out value="${status.count}"/></td>
						<td>${events.summary}</td>
						<td>${events.when.time}</td>
						<td>${events.description}</td>
						<td>${events.numLikes}</td>
						<td>${events.eventLevel}</td>
					</tr>
				</c:forEach>
		</table>
	</div>
	
	<td></td>
	
	<div class="table-responsive">
		<table class="table table-hover">
			<tr>
				<p class="text-muted"> 참여한 이벤트</p>
			</tr>
			<tr>
				<th>주최자</th>
				<th>아이디</th>
				<th>개요</th>
				<th>일시</th>
				<th>내용</th>
				<th>좋아요</th>
				<th>EventLevel</th>
				<th>
			</tr>
			<c:forEach var="attendees" items="${attendees}" varStatus="status">
				<tr>
					<td>${attendees.event.owner.name}</td>
					<td>${attendees.event.owner.email}</td>
					<td>${attendees.event.summary}</td>
					<td>${attendees.event.when.time}</td>
					<td>${attendees.event.description}</td>
					<td>${attendees.event.numLikes}</td>
					<td>${attendees.event.eventLevel}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

<jsp:include page="./includes/footer.jsp"/>
</div>

</body>
</html>