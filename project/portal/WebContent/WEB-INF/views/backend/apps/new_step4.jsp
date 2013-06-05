<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
				<h2><fmt:message key="app_upload_title"/></h2>
				<c:if test="${param.failed}">
                <div class="protip error">
                    <strong><fmt:message key="tips"/></strong> <fmt:message key="app_upload_failed"/>
                </div>
                </c:if>
                <c:if test="${param.success}">
                <div class="protip success">
                    <strong><fmt:message key="tips"/></strong> <fmt:message key="app_upload_success"/>
                </div>
                </c:if>
                <div style="text-align:center;">
                    <img src="/images/step3.png" />
                </div>
				<form method="POST" class="blueform" enctype="multipart/form-data" style="margin-left: 95px;width: 812px;">
					<ul class="form">
						<li>
						    <label> 集成SDK后的应用 </label> 
							<a href="javascript:void(0);" class="file">
								<span><em>+</em><fmt:message key="app_upload_choose"/></span>
								<input title="<fmt:message key="app_upload_limit"/>" size="3" name="file" type="file" id="fileCtrl">
							</a>
							<span id="fileCtrlVal"></span>
						</li>
					</ul>
					<ul class="form">
						<li>
							<button id="btn_sub" type="submit">
								<fmt:message key="app_upload_submit"/>
							</button>
						</li>
						<li><span style="color:red">*</span><fmt:message key="app_upload_attention"/></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
    <jsp:include page="../includes/footer.jsp">
       <jsp:param value="page/upload" name="loader"/>
    </jsp:include>
</body>
</html>
