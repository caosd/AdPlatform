<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title>${app.name}</title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../includes/sidebar.jsp"%>
				<div class="right_content">
					<h2><fmt:message key="app_overview_title"/></h2>
					<h2>
					    <c:if test="${empty app.icon }">
						<div class="app_icon" style="background-image: url(/images/default_app_icon_57x57.png);"></div>
						</c:if>
						<c:if test="${not empty app.icon }">
                        <div class="app_icon" style="background-image: url(${imgServer}${app.icon});background-size: 100% 100%;"></div>
                        </c:if>
						<span>${app.name }</span>
					</h2>
					<div class="bluebox">
						<dl class="app_info">
							<dt><fmt:message key="label.app_key"/></dt>
							<dd id="app_key">${app.key }</dd>
							<dt><fmt:message key="label.app_package"/></dt>
							<dd id="appPackage">${app.pkg }</dd>
							<dt><fmt:message key="label.created_time"/></dt>
							<dd id="app_itime">${app.createTime}</dd>
                            <dt><fmt:message key="label.last_update_time"/></dt>
                            <dd id="app_itime">${app.lastUpdateTime}</dd>
                            <dt></dt>
                            <dd><br/><fmt:message key="app_overview_delete_prefix"/> <a href="javascript:if (confirm('<fmt:message key="app_overview_delete_confirm"/>')) location.href='/apps/${app.key }/delete';"><fmt:message key="app_overview_delete_middle"/></a> <fmt:message key="app_overview_delete_suffix"/></dd>
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
