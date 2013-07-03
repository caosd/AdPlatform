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
        <p class="center">我们已经成功发送邮件到您的邮箱<a href="javascript:;" >${email }</a>, 请登录邮箱按着我们提示的步骤重置您的密码。</p>
        <div class="control-group">
            <div class="space20"></div>
            <input type="button" id="forget-btn" class="btn btn-block login-btn" value="关闭页面" onclick="self.close();">
        </div>
    </form>
    <!-- END FORGOT PASSWORD FORM -->
</body>