<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title><fmt:message key="recover_title"/></title>
</head>
<body>
    <!-- BEGIN FORGOT PASSWORD FORM -->
    <form id="forgotform" method="POST" class="form-vertical no-padding no-margin">
        <p class="center">我们已经成功发送邮件到您的邮箱${email }, 请登录邮箱按着我们提示的步骤重置您的密码。</p>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-envelope"></i></span>
                    <form:input path="email" id="input-email" placeholder="Email" maxlength="75"/>
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
            </div>
            <div class="mtop10">
                <div class="block-hint pull-left small">
                    
                </div>
                <div class="block-hint pull-right">
                    <a href="/recover/reset_pwd.html" class="" id="forget-password">没有收到邮件？点击重试。</a>
                </div>
            </div>
            <div class="space20"></div>
        </div>
    </form>
    <!-- END FORGOT PASSWORD FORM -->
</body>