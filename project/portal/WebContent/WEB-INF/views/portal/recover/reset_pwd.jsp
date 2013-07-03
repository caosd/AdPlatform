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
    <form:form commandName="resetForm" id="forgotform" method="POST" class="form-vertical no-padding no-margin" onsubmit="return subform()">
        <form:hidden path="lang" id="lang" value="zh_cn" />
        <h4>找回您的密码</h4>
        <p class="center">输入邮箱地址来接收我们发送给您的重置密码链接。</p>
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
            <div class="space20"></div>
        </div>
        <input type="submit" id="forget-btn" class="btn btn-block login-btn" value="确认发送邮件">
    </form:form>
    <script>
    function subform() {
    	$("#forget-btn").attr("disabled", "disabled");
    	return true;
    }
    </script>
    <!-- END FORGOT PASSWORD FORM -->
</body>