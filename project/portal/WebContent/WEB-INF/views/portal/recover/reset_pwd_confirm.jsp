<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title><fmt:message key="recover_title"/></title>
</head>
<body>
    <form:form commandName="confirmForm" method="post"  class="form-vertical no-padding no-margin">
        <h4><fmt:message key="recover_reset_title"/></h4>
        <p class="center"><fmt:message key="recover_reset_desc"/></p>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-key"></i></span>
                    <form:password path="new_password1" placeholder="新密码" maxlength="75" style="width:310px"/>
                    <div style="color:red;font-size:12px;"><form:errors path="new_password1"/></div>
                </div>
            </div>
            <div class="controls">
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-key"></i></span>
                    <form:password path="new_password2" placeholder="确认密码" maxlength="75" style="width:310px"/>
                    <div style="color:red;font-size:12px;"><form:errors path="new_password2"/></div>
                </div>
            </div>
        </div>
        <div class="space20"></div>
        <input type="submit" id="forget-btn" class="btn btn-block login-btn" value="重置密码">
    </form:form>
</body>
