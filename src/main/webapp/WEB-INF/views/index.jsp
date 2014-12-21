<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request"/>
<html>
<head>
	<title>myCalendar: <c:out value="${pageTitle}" /> </title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <c:url var="resourceUrl" value="/resources"/>
    <link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css" rel="stylesheet"/>
    <link href="${resourceUrl}/css/custom.css" rel="stylesheet"/>
    <link href="${resourceUrl}/css/carousel.css" rel="stylesheet">
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body class="header">
<div class="container">
<jsp:include page="./includes/header.jsp"/>

    <c:if test="${message != null}">
        <div class="alert alert-danger" id="message"><c:out value="${message}"/></div>
    </c:if>
	
	<p></p>
	<!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <div class="container">
            <div class="carousel-caption">
              <h1>지금 바로 회원가입을 하세요.</h1>
              <c:url var="signupUrl" value="/users/signup" />	
              <p>myCalendar가 제공하는 기능을 이용하여 자신의 일정을 관리 해보세요.</p>
              <p><a class="btn btn-large btn-primary" href="${signupUrl}">Sign up</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="container">
            <div class="carousel-caption">
              <h1>회원가입을 하셨으면 로그인을 해보세요.</h1>
              <c:url var="signinUrl" value="/users/signin" />	
              <p>로그인을 하여 자신의 일정을 관리하고 다른 사람의 일정도 참여해보세요</p>
              <p><a class="btn btn-large btn-primary" href="${signinUrl}">Sign in</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="container">
            <div class="carousel-caption">
              <h1>로그인을 하셨으면 일정을 확인해보세요.</h1>
              <c:url var="myEventUrl" value="/events/my" />	
              <p>생성한 이벤트와 참여한 이벤트의 일정을 확인할 수 있습니다.</p>
              <p><a class="btn btn-large btn-primary" href="${myEventUrl}">Browse gallery</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div><!-- /.carousel -->
	
	
	<jsp:include page="./includes/footer.jsp"/>
</div>

<script type="text/javascript" src="${resourceUrl}/javascript/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${resourceUrl}/bootstrap-3.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${resourceUrl}/javascript/moment.js"></script>
<script type="text/javascript" src="${resourceUrl}/javascript/bootstrap-datetimepicker.js"></script>


<script type="text/javascript" src="${resourceUrl}/javascript/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${resourceUrl}/bootstrap-3.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${resourceUrl}/javascript/holder.js"></script>

</body>
</html>