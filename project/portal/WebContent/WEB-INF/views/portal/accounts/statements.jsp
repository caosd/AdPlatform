<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="statement_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../includes/accounts_sidebar.jsp"%>
				<div class="right_content">
					<h2><fmt:message key="statement_title"/></h2>
					<div class="">
						<table class="tablesorter" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr class="first_tr">
								<th width="4%"></th>
								<th width="18%"><fmt:message key="label.date"/></th>
								<th width="10%"><fmt:message key="label.pay_type"/></th>
								<th><fmt:message key="label.pay_detail"/></th>
								<th class="last" width="10%"><fmt:message key="label.pay_amount"/></th>
							</tr>
							<c:forEach items="${statements}" var="statement" varStatus="stat">
								<tr class="${stat.index%2==0?"even_number":"odd_number" }">
									<th class="first">${stat.index + 1 }</th>
									<td><fmt:formatDate value="${statement.createDate }" type="both" pattern="MMM, dd HH:mm z"/></td>
									<td>${statement.payType == 1? "PayPal": "Wire" }</td>
									<td>${statement.payInfo }</td>
									<td data-value="${statement.transferAmount }"><fmt:formatNumber value="${statement.transferAmount }" pattern="#,#00.00#"/></td>
								</tr>
							</c:forEach>
							<c:set var="count" value="${fn:length(statements)}"></c:set>
							<c:if test="${count == 0 }">
								<tr class="even_number">
									<th></th>
									<td colspan="4"><fmt:message key="statement_empty_records"/></td>
								</tr>
							</c:if>
						</table>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>
