<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="app_upload_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<h2>添加完成</h2>
                <c:if test="${param.success}">
                <div class="protip success">
                    <strong><fmt:message key="tips"/></strong> 应用创建成功。 
                </div>
                </c:if>
                <div style="text-align:center;">
                    <img src="/images/step4.png" />
                </div>
                <div class="bluebox">
                  <dl class="app_info">
                    <dt>应用名称</dt>
                    <dd>${app.name }</dd>
                    <dt>应用Key</dt>
                    <dd>${app.key }</dd>
                    <dt>应用Icon</dt>
                    <dd><img width="65" src="http://localhost:10000${iconDir}${fn:replace(app.icon, "#", "%23")}"/></dd>
                  </dl>
                </div>
			</div>
		</div>
	</div>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>
