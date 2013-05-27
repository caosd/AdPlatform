<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="push_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../includes/sidebar.jsp"%>
				<div class="right_content">
					<h2><fmt:message key="push_title"/></h2>
                    <div id="user-imei-list" data-key="${app.key}" >
	                    <c:forEach items="${userImeiList}" var="userImei">
                        <div class="bluebox" data-id="${userImei.id }" data-value="${userImei.imei }:${userImei.status == 0}">
                            <dl>
                                <dt>${userImei.description }:</dt>
                                <dd>
                                    <span class="code imei">IMEI:${userImei.imei }</span>
                                    <c:if test="${userImei.status == 1}">
                                    <a class="button-link switch start"><fmt:message key="push_start"/></a>
                                    </c:if>
                                    <c:if test="${userImei.status == 0}">
                                    <a class="button-link switch stop"><fmt:message key="push_stop"/></a>
                                    </c:if>
                                    <a class="button-link fantacy hide delete"><fmt:message key="push_delete"/></a>
                                </dd>
                            </dl>
                        </div>
	                    </c:forEach>
                    </div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp">
       <jsp:param value="page/push" name="loader"/>
    </jsp:include>
</body>
</html>
