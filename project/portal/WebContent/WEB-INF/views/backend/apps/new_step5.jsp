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
                <ul id="steps">
                  <li style="z-index: 6;"><a href="javascript:;" id="step-nav-0" class="active">分析应用</a></li>
                  <li style="z-index: 5;"><a href="javascript:;" id="step-nav-1" class="active">修改信息</a></li>
                  <li style="z-index: 4;"><a href="javascript:;" id="step-nav-2" class="active">下载SDK</a></li>
                  <li style="z-index: 3;"><a href="javascript:;" id="step-nav-3" class="active">上传应用</a></li>
                  <li style="z-index: 2;"><a href="javascript:;" id="step-nav-4" class="active">添加成功</a></li>
                </ul>
                <div class="bluebox">
                  <dl class="app_info">
                    <dt>应用名称</dt>
                    <dd>${app.name }</dd>
                    <dt>应用Key</dt>
                    <dd>${app.key }</dd>
                    <dt>应用Icon</dt>
                    <dd><img width="65" src='${imgServer }${iconDir}${fn:replace(app.icon, "#", "%23")}'/></dd>
                  </dl>
                </div>
			</div>
		</div>
	</div>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>
