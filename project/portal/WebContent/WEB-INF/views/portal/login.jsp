<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
    <!-- BEGIN LOGIN FORM -->
	<form:form method="POST" commandName="loginForm" autocomplete="off" id="loginform" class="form-vertical no-padding no-margin">
        <form:hidden path="formToken" name="_form_token_" />
        <form:hidden path="nextUrl" value="${param.nextUrl }" />
        <div class="lock">
            <i class="icon-lock"></i>
        </div>
        <div class="control-wrap">
            <h4>用户登录
            <span style="color:red;font-size:12px;float:right;">
            <c:if test="${accountErr }">请输入正确的账户名。</c:if>
            <c:if test="${usernameEmpty }">请输入用户名。</c:if>
            <c:if test="${passwordEmpty }">请输入密码。</c:if>
            </span>
            </h4>
            <div class="control-group">
                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-user"></i></span>
                        <form:input path="userName" maxlength="20" placeholder="用户名"/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-key"></i></span>
                        <form:password path="password" maxlength="20" placeholder="密码"/>
                    </div>
                    <div class="mtop10">
                        <div class="block-hint pull-left small">
                            <form:checkbox checked="checked" path="remember" id="id_stay_signed_in"/> 下次自动登录
                        </div>
                        <div class="block-hint pull-right">
                            <a href="/recover/reset_pwd.html" target="_blank" class="" id="forget-password">忘记密码？</a>
                        </div>
                    </div>

                    <div class="clearfix space5"></div>
                </div>

            </div>
        </div>

        <input type="submit" id="login-btn" class="btn btn-block login-btn"
            value="登录">
    </form:form>
    <!-- END LOGIN FORM -->
</body>