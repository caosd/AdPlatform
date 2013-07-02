<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/html_attributes.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="sign_out_title"/></title>
<%@include file="../includes/style.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/onboard.css">
</head>
<body id="onboard">
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<h1>
				<span><fmt:message key="sign_out_out"/></span>
			</h1>
	
			<div id="content">
				<div class="general">
					<p><fmt:message key="sign_out_title"/></p>
					<ul>
						<li><a href="/accounts/sign-in/"><fmt:message key="return_to_sign_in"/></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>
<html>