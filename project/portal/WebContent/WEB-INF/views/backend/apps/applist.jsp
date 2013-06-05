<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="applist_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
<%@include file="../includes/header.jsp"%>
<div class="inside">
	<div class="container">
		<div id="content">
			<h2>
				<span><fmt:message key="applist_title"/> <span style="font-size: 14px;padding-left: 30px;"><a href="/apps/create"><fmt:message key="applist_create_new"/></a></span></span>
			</h2>
			<table class="tablesorter" border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr class="first_tr">
					<th width="2%"></th>
					<th width="16%"><fmt:message key="applist_name"/></th>
					<th width="8%"><fmt:message key="applist_total"/></th>
					<th width="16%"><fmt:message key="applist_active"/></th>
					<th width="18%"><fmt:message key="applist_new"/></th>
					<th class="last" width="10%"><fmt:message key="applist_earnings"/></th>
				</tr>
				<c:forEach items="${applist}" var="app" varStatus="stat">
				<tr class="app_summary_ajax ${stat.index%2==0?"even_number":"odd_number" }" data-key="${app.key }" data-type="app_summary">
					<th class="first"><img src="/images/icon-android.png"/></th>
					<td class="app_name"><a href="/apps/${app.key }/detail">${app.name }</a></td>
					<td class=app_amounts>-</td>
					<td class="app_online">- / -</td>
					<td class="app_new">- / -</td>
					<td class="app_earnings">-</td>
				</tr>
				</c:forEach>
				<c:if test="${fn:length(applist) == 0 }">
					<tr class="even_number">
						<th></th>
						<td colspan="5"><fmt:message key="applist_nodata"/></td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
    <jsp:include page="../includes/footer.jsp">
       <jsp:param value="page/app_list" name="loader"/>
    </jsp:include>
</div>
</body>
</html>