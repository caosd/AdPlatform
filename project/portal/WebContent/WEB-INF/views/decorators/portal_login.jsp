<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<!DOCTYPE html>
<!--<![endif]-->
<html lang="en">
<head>
<title><decorator:title default="" /></title>
<%@include file="../portal/includes/style.jsp"%>
<decorator:head />
</head>
<body id="login-body">
    <div class="login-header">
        <!-- BEGIN LOGO -->
        <div id="logo" class="center">
            <img src="img/logo.png" alt="logo" class="center">
        </div>
        <!-- END LOGO -->
    </div>

    <!-- BEGIN LOGIN -->
    <div id="login">
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
                                <a href="javascript:;" class="" id="forget-password">忘记密码？</a>
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
        <!-- BEGIN FORGOT PASSWORD FORM -->
        <form id="forgotform" class="form-vertical no-padding no-margin hide"
            action="/login">
            <p class="center">Enter your e-mail address below to reset your
                password.</p>
            <div class="control-group">
                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-envelope"></i></span><input
                            id="input-email" type="text" placeholder="Email">
                    </div>
                </div>
                <div class="space20"></div>
            </div>
            <input type="button" id="forget-btn" class="btn btn-block login-btn"
                value="Submit">
        </form>
        <!-- END FORGOT PASSWORD FORM -->
    </div>
    <!-- END LOGIN -->
    <!-- BEGIN COPYRIGHT -->
    <div id="login-copyright">2013 © Admin Lab Dashboard.</div>
    <!-- END COPYRIGHT -->
    <!-- BEGIN JAVASCRIPTS -->
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- END JAVASCRIPTS -->

    <!-- END BODY -->
</body>
</html>