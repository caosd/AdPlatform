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
			<div id="content">
				<h1><fmt:message key="recover_unsuccess"/></h1>
                <p><fmt:message key="recover_unsuccess_desc"/><a href="/recover/password/reset/"><fmt:message key="recover_request_mail"/></a></p>
			</div>
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>
<html>