<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title><decorator:title default="" /></title>
<%@include file="../includes/style.jsp"%>
<decorator:head />
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
        <decorator:body />
    </div>
    <!-- END LOGIN -->
    <!-- BEGIN COPYRIGHT -->
    <div id="login-copyright">2013 © umScape. All rights reserved.</div>
    <!-- END COPYRIGHT -->
    <!-- BEGIN JAVASCRIPTS -->
    <script src="/js/jquery-1.8.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <!-- END JAVASCRIPTS -->

    <!-- END BODY -->
</body>
</html>