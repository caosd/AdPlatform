<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="change_profile_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../includes/accounts_sidebar.jsp"%>
				<div class="right_content">
					<h2><fmt:message key="change_profile_title"/></h2>
					<c:if test="${not empty updated}">
					<div class="protip success">
						<strong><fmt:message key="tips"/></strong> <fmt:message key="change_profile_success"/>
					</div>
					</c:if>
					<c:if test="${not empty error}">
					<div class="protip warn">
						<strong><fmt:message key="tips"/></strong> <fmt:message key="change_profile_failed"/>
					</div>
					</c:if>
					<form:form method="POST" commandName="profileForm" class="blueform">
						<ul class="form">
							<li><label> <fmt:message key="label.account_type"/> </label> 
								<form:select path="type" id="accountType">
									<option value="1" ${user.type == 1 ? "selected=\"selected\"":"" }><fmt:message key="option.individual"/></option>
									<option value="2" ${user.type == 2 ? "selected=\"selected\"":"" }><fmt:message key="option.company"/></option>
								</form:select>
							</li>
							
							<li><label> <fmt:message key="label.company_name"/> </label> 
								<form:input path="company" value="${user.company }" autocomplete="off"/> 
								<form:errors path="company" cssClass="error" />
							</li>
							
							<li><label> <fmt:message key="label.contact_name"/> </label> 
								<form:input path="contactName" value="${user.contactName }" autocomplete="off"/> 
								<form:errors path="contactName" cssClass="error" />
							</li>
							
							<li><label> <fmt:message key="label.contact_tel"/> </label> 
								<form:input path="contactTel" value="${user.contactTel }" autocomplete="off"/> 
								<form:errors path="contactTel" cssClass="error" />
							</li>
							
                            <li><label> <fmt:message key="label.qq"/> </label> 
                                <form:input path="qq" value="${user.qq }" autocomplete="off"/> 
                                <form:errors path="qq" cssClass="error" />
                            </li>
                            
                            <li><label> <fmt:message key="label.website"/> </label> 
                                <form:input path="website" value="${user.website }" autocomplete="off"/> 
                                <form:errors path="website" cssClass="error" />
                            </li>
						</ul>
						<ul class="form">
							<li>
								<button id="btn_sub" type="submit"><fmt:message key="change_my_profile"/></button>
							</li>
						</ul>
					</form:form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
    <jsp:include page="../includes/footer.jsp">
       <jsp:param value="page/change_profile" name="loader"/>
    </jsp:include>
</body>
</html>