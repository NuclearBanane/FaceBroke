<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<link rel="shortcut icon" href="resources/img/favicon.ico" />

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/css/facebroke.css">
<title>FaceBroke</title>
</head>
<body>

	<c:set var="cpath" scope="page"
		value="${pageContext.request.contextPath}" />
	<c:if test="${cpath == ''}">
		<c:set var="cpath" scope="page" value="/" />
	</c:if>

	<nav class="navbar navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${cpath}">FaceBroke</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<c:choose>
				<c:when test="${sessionScope.valid != 'true'}">
					<form class="navbar-form navbar-right" action="login" method="post">
						<div class="form-group">
							<input type="text" name="user_cred"
								placeholder="Email or Username" class="form-control">
						</div>
						<div class="form-group">
							<input type="password" name="password" placeholder="Password"
								class="form-control">
						</div>
						<button type="submit" class="btn btn-success">Log in</button>
					</form>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">

						<li class=" dropdown"><a href="#"
							class="dropdown-toggle user-dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><img src="resources/img/dummy.png"
								alt="User profile picture"
								class="img-rounded profile-header-img">${sessionScope.user_fname}<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="wall?user_id=${sessionScope.user_id}"><span
										class="glyphicon glyphicon-user"></span> Wall</a></li>
								<li><a href="demo"><span
										class="glyphicon glyphicon-tag"></span> Demo</a></li>
								<li><a href="settings?id=${sessionScope.user_id}"><span
										class="glyphicon glyphicon-cog"></span> Settings</a></li>
								<li><a href="logout"><span
										class="glyphicon glyphicon-log-out"></span> Logout</a></li>
							</ul></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<!--/.navbar-collapse -->
	</div>
	</nav>


	<div class="container">
		<c:if test="${authMessage != '' && authMessage != null}">
			<div class=\"row\">
				<div
					class="col-md-4 col-md-offset-4 alert alert-warning alert-dismissible fade in alert-message"
					role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
					<c:out value="${authMessage}" />
				</div>
			</div>
		</c:if>