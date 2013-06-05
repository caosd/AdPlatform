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
