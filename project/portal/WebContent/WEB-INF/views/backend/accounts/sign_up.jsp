<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../includes/html_attributes.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="sign_up_title"/></title>
<%@include file="../includes/style.jsp"%>
<style>
form.blueform .radioGroup {
height: 35px;
line-height: 35px;
}
form.blueform .radioGroup label {
margin: 0;
padding: 0;
float: none;
top: 0;
right: 0;
display: inline;
}
</style>
</head>
<body>
	<%@include file="../includes/header.jsp" %>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%
				if ("true".equals(request.getParameter("success"))) {
					out.print("<h3>注册成功</h3>");
				}
				%>
				<form:form commandName="regForm" method="post" class="blueform" enctype="multipart/form-data">
				    <ul class="form">
				        <li><label for="accountType"><fmt:message key="label.account_type"/></label>
				            <div class="radioGroup">
				                <form:radiobutton path="type" id="type1" value="1" checked="checked"/><label for="type1">&nbsp;<fmt:message key="option.individual"/></label>
				                <form:radiobutton path="type" id="type2" value="2" style="margin-left: 20px;"/><label for="type2">&nbsp;<fmt:message key="option.company"/></label>
				            </div>
                        <form:errors path="type" cssClass="error"/></li>
				        <li><label for="userName"><fmt:message key="label.username"/><span class="red">*</span></label> <form:input path="userName" /> <form:errors path="userName" cssClass="error"/></li>
				        <li><label for="password"><fmt:message key="label.password"/><span class="red">*</span></label> <form:password path="password" /> <form:errors path="password" cssClass="error"/></li>
				        <li><label for="confirmPassword"><fmt:message key="label.password_again"/><span class="red">*</span></label> <form:password path="confirmPassword" id="confirmPassword" /> <form:errors path="confirmPassword" cssClass="error"/></li>
				        <li><label for="email"><fmt:message key="label.email"/><span class="red">*</span></label> <form:input path="email" /> <form:errors path="email" cssClass="error"/></li>
				        <li id="companyNameGroup"><label for="companyName"><fmt:message key="label.company_name"/></label> <form:input path="company" /> <form:errors path="company" cssClass="error"/></li>
				        <li id="contactNameGroup"><label for="contactName"><fmt:message key="label.contact_name"/></label> <form:input path="contactName" /> <form:errors path="contactName" cssClass="error"/></li>
				        <li id="contactTelGroup"><label for="contactTel"><fmt:message key="label.contact_tel"/></label> <form:input path="contactTel" /> <form:errors path="contactTel" cssClass="error"/></li>
				        <li id="qqGroup"><label for="qq"><fmt:message key="label.qq"/></label> <form:input path="qq" /> <form:errors path="qq" cssClass="error"/></li>
				        <li id="websiteGroup"><label for="website"><fmt:message key="label.website"/></label> <form:input path="website" /> <form:errors path="website" cssClass="error"/></li>
				        <li id="ExtrasGroup1" style="${userType==2 ? '':'display: none;'}"><label for="credentialsNo"><fmt:message key="label.credentials_no"/></label> <input type="text" name="credentialsNo"/></li>
				        <li id="ExtrasGroup2" style="${userType==2 ? '':'display: none;'}"><label for="credentialsPhoto"><fmt:message key="label.credentials_photo"/></label> <input type="file" multiple name="credentialsPhoto"/></li>
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
	$("#type2").click(function() {
        $("#ExtrasGroup1,#ExtrasGroup2").show();
    });
	$("#type1").click(function() {
        $("#ExtrasGroup1,#ExtrasGroup2").hide();
    });
    </script>
</body>
<html>