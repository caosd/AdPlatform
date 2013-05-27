<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="edit_app_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../includes/sidebar.jsp"%>
				<div class="right_content">
					<h2><fmt:message key="edit_app_title"/></h2>
					<c:if test="${failed}">
					<div class="protip error">
						<strong><fmt:message key="tips"/></strong> <fmt:message key="edit_app_failed"/>
					</div>
					</c:if>
					<form:form method="POST" commandName="appForm" class="blueform">
						<form:hidden path="id"/>
						<ul class="form">
							<li><label> <fmt:message key="label.app_name"/> </label> 
								<form:input path="name" value="${app.name }" autocomplete="off" maxlength="30"/>
								<span class="red">*</span> <form:errors path="name" />
							</li>
							
							<li><label for="appPackage"> <fmt:message key="label.app_package"/> </label> 
								<div style="padding-top: 8px;"><span>${app.pkg }</span></div>
							</li>
						</ul>
						<ul class="form">
							<li>
								<button id="btn_sub" type="submit"><fmt:message key="edit_app_submit"/></button>
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
