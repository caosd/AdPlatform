<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="change_email_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../includes/accounts_sidebar.jsp"%>
				<div class="right_content">
					<h2><fmt:message key="change_email_title"/></h2>
					<c:if test="${not empty updated}">
					<div class="protip success">
						<strong><fmt:message key="tips"/></strong> <fmt:message key="change_email_success"/>
					</div>
					</c:if>
					<c:if test="${not empty error}">
					<div class="protip warn">
						<strong><fmt:message key="tips"/></strong> <fmt:message key="change_email_failed"/>
					</div>
					</c:if>
					<form:form method="POST" commandName="emailForm" class="blueform">
						<ul class="form">
							<li><label> <fmt:message key="label.new_email_address"/> </label> 
								<form:input path="email"/>
								<span class="red">*</span> <br/><form:errors path="email" cssClass="error" />
							</li>
						</ul>
						<ul class="form">
							<li>
								<button id="btn_sub" type="submit"><fmt:message key="change_your_email_address"/></button>
							</li>
						</ul>
					</form:form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>