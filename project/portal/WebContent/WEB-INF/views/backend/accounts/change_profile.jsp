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
								<form:select path="accountType" id="accountType">
									<option value="1" ${user.accountType == 1 ? "selected=\"selected\"":"" }><fmt:message key="option.individual"/></option>
									<option value="2" ${user.accountType == 2 ? "selected=\"selected\"":"" }><fmt:message key="option.company"/></option>
								</form:select>
							</li>
							
							<li><label> <fmt:message key="label.country"/> </label> 
								<form:select path="country" id="country">
									<%@ include file="../includes/country_options.jsp" %>
								</form:select> 
								<form:errors path="country" cssClass="error" />
							</li>
							
							<li id="companyNameField" ${user.accountType == 1? "style=\"display:none;\"": ""}><label> <fmt:message key="label.company_name"/> </label> 
								<form:input path="companyName" value="${user.companyName }" autocomplete="off"/> 
								<form:errors path="companyName" cssClass="error" />
							</li>
							
							<li id="firstNameField" ${user.accountType == 2? "style=\"display:none;\"": ""}><label> <fmt:message key="label.first_name"/> </label> 
								<form:input path="firstName" value="${user.firstName }" autocomplete="off"/> 
								<form:errors path="firstName" cssClass="error" />
							</li>
							
							<li id="lastNameField" ${user.accountType == 2? "style=\"display:none;\"": ""}><label> <fmt:message key="label.last_name"/> </label> 
								<form:input path="lastName" value="${user.lastName }" autocomplete="off"/> 
								<form:errors path="lastName" cssClass="error" />
							</li>
							
							<li><label> <fmt:message key="label.address"/> </label> 
								<form:input path="address" value="${user.address }" autocomplete="off"/> 
								<form:errors path="address" cssClass="error" />
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
    <script>
    var Account = {};
    Account.country = '${user.country}';
    </script>
</body>
</html>