<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<!DOCTYPE html>
<!--<![endif]-->
<html lang="en">
<head>
<title>注册成功</title>
<%@include file="includes/style.jsp"%>
</head>
<body id="login-body">
    <div class="login-header">
        <!-- BEGIN LOGO -->
        <div id="logo" class="center">
            <img src="/img/logo.png" alt="logo" class="center">
        </div>
        <!-- END LOGO -->
    </div>

    <!-- BEGIN LOGIN -->
    <div id="login">
        <h4>恭喜您，注册成功！</h4>
        <p>由于我们需要对您提交的信息进行审核（大约1-2个工作日内），审核成功后我们将于邮件的形式通知您！</p>
    </div>
    <!-- END LOGIN -->
    <!-- BEGIN COPYRIGHT -->
    <div id="login-copyright">2013 © Admin Lab Dashboard.</div>
    <!-- END COPYRIGHT -->
    <!-- BEGIN JAVASCRIPTS -->
    <script src="/js/jquery-1.8.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <!-- END JAVASCRIPTS -->

    <!-- END BODY -->
</body>
</html>
