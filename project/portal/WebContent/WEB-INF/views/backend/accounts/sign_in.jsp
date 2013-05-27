<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="../includes/html_attributes.jsp"%>
<head>
<title><fmt:message key="sign_in_title"/></title>
<%@include file="../includes/style.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/onboard.css">
</head>
<body id="onboard">
    <%@include file="../includes/header.jsp"%>
    <div class="inside">
        <div class="container">
            <h1>
                <span><fmt:message key="sign_in_title"/></span>
            </h1>
            <div id="content">
                <div class="login">
                    <div class="col_1">
                        <form:form method="POST" commandName="loginForm" autocomplete="off">
                        	<form:hidden path="formToken" name="_form_token_" />
                        	<form:hidden path="nextUrl" value="${param.nextUrl }" />
                            <fieldset>
                                <div>
                                    <label><fmt:message key="label.username"/></label> 
                                    <form:input path="userName" maxlength="20" />
                                    <c:if test="${accountErr }">
                                    <ul class="errorlist"><li><fmt:message key="error.not_found_account"/></li></ul>
                                    </c:if>
                                    <c:if test="${usernameEmpty }">
                                    <ul class="errorlist"><li><fmt:message key="error.field_required"/></li></ul>
                                    </c:if>
                                </div>
                                <div>
                                    <label><fmt:message key="label.password"/></label> 
                                    <form:password path="password" maxlength="20" />
                                    <c:if test="${passwordEmpty }">
                                    <ul class="errorlist"><li><fmt:message key="error.field_required"/></li></ul>
                                    </c:if>
                                </div>
                                <div>
                                    <form:checkbox checked="checked" path="remember" id="id_stay_signed_in"/>
                                    <label for="id_stay_signed_in" id="remember"><fmt:message key="label.remember_me"/></label>
                                </div>
                            </fieldset>
                            <fieldset class="submit">
                                <div>
                                    <button type="submit" class="important"><fmt:message key="login"/></button>
                                    or <a href="/recover/password/reset/"><fmt:message key="label.forgot_password"/></a>
                                </div>
                            </fieldset>
                        </form:form>
                    </div>
                    <div class="col_2">
                        <h2><fmt:message key="sign_in_need_account_q"/></h2>
                        <p><fmt:message key="sign_in_need_account_a"/></p>
                        <ul>
                            <li><a href="/helpcenter"><fmt:message key="sign_in_need_account_link"/></a></li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../includes/footer.jsp"%>
</body>
</html>