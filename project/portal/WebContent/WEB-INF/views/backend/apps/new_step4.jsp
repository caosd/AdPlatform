<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="new_app_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
    <%@include file="../includes/header.jsp"%>
    <div class="inside">
        <div class="container">
            <div id="content">
                <h2><fmt:message key="new_app_title"/></h2>
                <c:if test="${failed}">
                <div class="protip error">
                    <strong><fmt:message key="tips"/></strong> <fmt:message key="new_app_failed"/>
                </div>
                </c:if>
                <div class="bare-box">
                    <a href="javascript:void(0);" class="file">
                        <span><em>+</em>选择证件照片</span>
                        <input title="支持jpg,gif,png格式" size="3" name="file1" type="file" id="fileCtrl1">
                    </a>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>
