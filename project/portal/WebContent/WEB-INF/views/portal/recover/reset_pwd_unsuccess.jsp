<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title><fmt:message key="recover_title"/></title>
</head>
<body>
	<h4><fmt:message key="recover_unsuccess"/></h4>
    <p><fmt:message key="recover_unsuccess_desc"/><a href="/recover/reset_pwd.html"><fmt:message key="recover_request_mail"/></a></p>
</body>
