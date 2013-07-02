<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="account_overview_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../includes/accounts_sidebar.jsp"%>
				<div class="right_content">
					<h2><fmt:message key="account_overview_title"/></h2>
					<div class="bluebox">
						<dl>
							<dt><fmt:message key="label.account_name"/></dt>
                            <dd>${user.userName}</dd>
                            <dt><fmt:message key="label.email"/></dt>
                            <dd>${user.email}</dd>
							<dt><fmt:message key="label.account_type"/></dt>
							<dd>
							<c:if test="${user.type == 1}"><fmt:message key="option.individual"/></c:if>
							<c:if test="${user.type == 2}"><fmt:message key="option.company"/></c:if>
							</dd>
							<c:if test="${user.type == 2 }">
							<dt><fmt:message key="label.company_name"/></dt>
							<dd>${user.company}</dd>
							</c:if>
							<c:if test="${user.type == 1 }">
							<dt><fmt:message key="label.contact_name"/></dt>
							<dd>${user.contactName }</dd>
							</c:if>
                            <dt><fmt:message key="label.contact_tel"/></dt>
                            <dd>${user.contactTel}</dd>
                            <dt><fmt:message key="label.qq"/></dt>
                            <dd>${user.qq}</dd>
							<dt><fmt:message key="label.website"/></dt>
							<dd>${user.website}</dd>
                            <dt><fmt:message key="label.account_created"/></dt>
                            <dd><fmt:formatDate value="${user.createtime}" type="both" pattern="MMM, dd HH:mm:ss z"/></dd>
                            <dt><fmt:message key="label.last_login_time"/></dt>
                            <dd><fmt:formatDate value="${user.loginTokenTime}" type="both" pattern="MMM, dd HH:mm:ss z"/></dd>
						</dl>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>