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
                <c:if test="${failedWithDuplicatePackage}">
                <div class="protip error">
                    <strong><fmt:message key="tips"/></strong> <fmt:message key="new_app_duplicated_package"/>
                </div>
                </c:if>
				<form:form method="POST" commandName="appForm" class="blueform">
					<ul class="form">
						<li><label> <fmt:message key="label.app_name"/><span class="red">*</span></label> 
							<form:input path="name" value="${app.name }" autocomplete="off" maxlength="30"/>
							<form:errors path="name" cssClass="error" />
						</li>
						
						<li><label for="appPackage"> <fmt:message key="label.app_package"/><span class="red">*</span></label> 
							<form:input path="pkg" autocomplete="off" maxlength="100"/>
							<span id="tip_package"><form:errors path="pkg" cssClass="error" /></span>
						</li>
					</ul>
					<ul class="form">
						<li>
							<button id="btn_sub" type="submit">
								<fmt:message key="new_app_submit"/>
							</button>
						</li>
					</ul>
				</form:form>
			</div>
			<div class="clear"></div>
		</div>
	</div>
    <jsp:include page="../includes/footer.jsp">
       <jsp:param value="page/create_app" name="loader"/>
    </jsp:include>
</body>
</html>
