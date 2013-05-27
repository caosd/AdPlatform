<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../backend/includes/html_attributes.jsp" %>
	<head>
		<%@include file="../backend/includes/style.jsp"%>
	    <link rel="stylesheet" type="text/css" href="/css/index.css">
	    <link rel="stylesheet" type="text/css" href="/css/404.css">
		<title><fmt:message key="404.title"/></title>
	</head>
<body>

<%@include file="../backend/includes/header.jsp" %>
<div class="indexmain">
		<div id="main">
            <div id="clouds1"></div>
            <div id="clouds2"></div>
            <div id="sign"></div>
            <div id="rain"></div>
        </div>
</div>
</body>
</html>