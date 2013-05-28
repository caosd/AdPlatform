<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../includes/html_attributes.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="sign_up_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp" %>
	<div class="inside">
		<div class="container">
			<div id="content">
<%
if ("true".equals(request.getParameter("success"))) {
	out.print("<p>注册成功</p>");
}
%>
				<form:form commandName="regForm" method="post" class="blueform">
				    <ul class="form">
				        <li><label for="userName"><fmt:message key="label.username"/><span class="red">*</span></label> <form:input path="userName" /> <form:errors path="userName" cssClass="error"/></li>
				        <li><label for="password"><fmt:message key="label.password"/><span class="red">*</span></label> <form:input path="password" /> <form:errors path="password" cssClass="error"/></li>
				        <li><label for="confirmPassword"><fmt:message key="label.password_again"/><span class="red">*</span></label> <form:input path="confirmPassword" id="confirmPassword" /> <form:errors path="confirmPassword" cssClass="error"/></li>
				        <li><label for="email"><fmt:message key="label.email"/><span class="red">*</span></label> <form:input path="email" /> <form:errors path="email" cssClass="error"/></li>
				        <li><label for="accountType"><fmt:message key="label.account_type"/></label> 
				            <form:select path="accountType">
		                        <option value="1"><fmt:message key="option.individual"/></option>
		                        <option value="2"><fmt:message key="option.company"/></option>
		                    </form:select>
				        <form:errors path="accountType" cssClass="error"/></li>
				        <li><label for="country"><fmt:message key="label.country"/></label> 
                            <form:select path="country">
		                        <%@ include file="../includes/country_options.jsp" %>
		                    </form:select>
                        <form:errors path="country" cssClass="error"/></li>
				        <li id="companyNameGroup" style="display:none;"><label for="companyName"><fmt:message key="label.company_name"/></label> <form:input path="companyName" /> <form:errors path="companyName" cssClass="error"/></li>
				        <li id="firstNameGroup"><label for="firstName"><fmt:message key="label.first_name"/></label> <form:input path="firstName" /> <form:errors path="firstName" cssClass="error"/></li>
				        <li id="lastNameGroup"><label for="lastName"><fmt:message key="label.last_name"/></label> <form:input path="lastName" /> <form:errors path="lastName" cssClass="error"/></li>
				        <li><label for="address"><fmt:message key="label.address"/></label> <form:input path="address" /> <form:errors path="address" cssClass="error"/></li>
				        <li>
				            <button type="submit"><fmt:message key="sign_up_submit"/></button>
				        </li>
				    </ul>
				</form:form>
			</div>
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>
	<script type="text/javascript">
    $("#accountType").change(function() {
        switch($(this).val()) {
        case '1':
            $("#firstNameGroup").show();
            $("#lastNameGroup").show();
            $("#companyNameGroup").hide();
            break;
        case '2':
            $("#firstNameGroup").hide();
            $("#lastNameGroup").hide();
            $("#companyNameGroup").show();
            break;
        }
    });
    </script>
</body>
<html>