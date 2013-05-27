<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../includes/html_attributes.jsp"%>
<head>
<title><fmt:message key="recover_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp" %>
	<div class="inside">
		<div class="container">
			<div id="content">
				<h2><fmt:message key="recover_reset_title"/></h2>

				<p><fmt:message key="recover_reset_desc"/></p>
				
				<form:form commandName="confirmForm" method="post" class="blueform">
				    <ul class="form">
				        <li><label for="id_new_password1"><fmt:message key="label.new_password"/></label> <form:password path="new_password1" id="id_new_password1" /> <form:errors path="new_password1" cssClass="error"/></li>
				        <li><label for="id_new_password2"><fmt:message key="label.new_password_again"/></label> <form:password path="new_password2" id="id_new_password2" /> <form:errors path="new_password2" cssClass="error"/></li>
				        <li>
				            <button type="submit"><fmt:message key="recover_reset_submit"/></button>
				        </li>
				    </ul>
				</form:form>
			</div>
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>
<html>