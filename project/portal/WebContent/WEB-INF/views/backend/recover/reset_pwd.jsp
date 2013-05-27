<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp"%>
<head>
<title><fmt:message key="recover_title"/></title>
<%@include file="../includes/style.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/onboard.css">
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
				    <form:form commandName="resetForm" method="post">
				        <form:hidden path="lang" id="lang" />
				        <fieldset>
				            <div>
				                <label for="id_email"><fmt:message key="recover_enter_email_address"/></label>
				                <form:input path="email" id="id_email" maxlength="75" />
				                <c:if test="${emailEmpty }">
                                <ul class="errorlist"><li><fmt:message key="error.field_required"/></li></ul>
                                </c:if>
                                <c:if test="${emailFormatErr }">
                                <ul class="errorlist"><li><fmt:message key="error.invalid_email"/></li></ul>
                                </c:if>
                                <c:if test="${emailNotFound }">
                                <ul class="errorlist"><li><fmt:message key="error.not_found_email"/></li></ul>
                                </c:if>
				            </div>
				        </fieldset>
				        <fieldset class="submit">
				            <div>
				                <button type="submit" class="important"><fmt:message key="recover_submit_email"/></button>
				                or <a href="/accounts/sign-in"><fmt:message key="return_to_sign_in"/></a>
				            </div>
				        </fieldset>
				    </form:form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp">
       <jsp:param value="page/reset_pwd" name="loader"/>
    </jsp:include>
</body>
<html>