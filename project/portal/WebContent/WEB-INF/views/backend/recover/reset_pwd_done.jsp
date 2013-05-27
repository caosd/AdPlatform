<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/html_attributes.jsp"%>
<head>
<title><fmt:message key="recover_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp" %>
	<div class="inside">
		<div class="container">
			<h1>
				<span><fmt:message key="recover_reset"/></span>
			</h1>
	
			<div id="content">
				<div class="pwreset">
				    <div class="col_1">
				        <h2><fmt:message key="recover_reset_done_success"/></h2>
				        <p><fmt:message key="recover_reset_done_sendmail"/></p>
				        <ul>
				            <li><a href="/accounts/sign-in"><fmt:message key="return_to_sign_in"/></a></li>
				        </ul>
				    </div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>
<html>