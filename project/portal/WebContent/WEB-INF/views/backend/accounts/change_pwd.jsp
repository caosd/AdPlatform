<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="change_password_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../includes/accounts_sidebar.jsp"%>
				<div class="right_content">
					<h2><fmt:message key="change_password_title"/></h2>
					<c:if test="${not empty updated}">
					<div class="protip success">
						<strong><fmt:message key="tips"/></strong> <fmt:message key="change_password_success"/>
					</div>
					</c:if>
					<c:if test="${not empty passwordError}">
					<div class="protip warn">
						<strong><fmt:message key="tips"/></strong> <fmt:message key="change_password_failed"/>
					</div>
					</c:if>
					<form:form method="POST" commandName="pwdForm" class="blueform">
						<ul class="form">
							<li><label> <fmt:message key="label.origin_password"/> </label> 
								<form:password path="password"/>
								<span class="red">*</span> <br/><form:errors path="password" cssClass="error" />
							</li>
							
							<li><label> <fmt:message key="label.new_password"/> </label> 
								<form:password path="newpassword"/>
								<span class="red">*</span> <br/><form:errors path="newpassword" cssClass="error" />
							</li>
							
							<li><label> <fmt:message key="label.new_password_again"/> </label> 
								<form:password path="cfmpassword"/>
								<span class="red">*</span> <br/><form:errors path="cfmpassword" cssClass="error" />
							</li>
						</ul>
						<ul class="form">
							<li>
								<button id="btn_sub" type="submit"><fmt:message key="change_my_password"/></button>
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