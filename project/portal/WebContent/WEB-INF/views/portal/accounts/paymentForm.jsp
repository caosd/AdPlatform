<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="payment_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../includes/accounts_sidebar.jsp"%>
				<div class="right_content">
					<h2><fmt:message key="payment_title"/></h2>
                    <c:if test="${not empty param.updated}">
                    <div class="protip success">
                        <strong><fmt:message key="tips"/></strong> <fmt:message key="payment_success"/>
                    </div>
                    </c:if>
					<form:form method="POST" commandName="paymentForm" class="blueform">
						<ul class="form">
							<li><label></label>
								<c:if test="${paymentForm.payType == 1 }">
								<form:radiobutton path="payType" value="1" id="paypalRdo" checked="checked"/><fmt:message key="option.pay_via_paypal"/>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<form:radiobutton path="payType" value="2" id="wireRdo"/><fmt:message key="option.pay_via_wire"/>
								</c:if>
								<c:if test="${paymentForm.payType == 2 }">
								<form:radiobutton path="payType" value="1" id="paypalRdo"/><fmt:message key="option.pay_via_paypal"/>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<form:radiobutton path="payType" value="2" id="wireRdo" checked="checked"/><fmt:message key="option.pay_via_wire"/>
								</c:if>
								&nbsp;&nbsp;<form:errors path="payType" cssClass="error" />
							</li>
							
							<li id="paypalLoginGroup" <c:if test="${paymentForm.payType == 2 }">style="display:none;"</c:if>><label><fmt:message key="label.paypal_login"/><span class="red">*</span> :</label>
								<form:input path="paypalLogin"/><br/><form:errors path="paypalLogin" cssClass="error" />
							</li>
							
							<li id="beneficiaryNameGroup" <c:if test="${paymentForm.payType == 1 }">style="display:none;"</c:if>><label><fmt:message key="label.beneficiary_name"/><span class="red">*</span> :</label>
								<form:input path="beneficiaryName"/><br/><form:errors path="beneficiaryName" cssClass="error"/>
							</li>
							
							<li id="bankNameGroup" <c:if test="${paymentForm.payType == 1 }">style="display:none;"</c:if>><label><fmt:message key="label.bank_name"/><span class="red">*</span> :</label>
								<form:input path="bankName"/><br/><form:errors path="bankName" cssClass="error" />
							</li>
							
							<li id="bankAddressGroup" <c:if test="${paymentForm.payType == 1 }">style="display:none;"</c:if>><label><fmt:message key="label.bank_address"/><span class="red">*</span> :</label>
								<form:input path="bankAddress"/><br/><form:errors path="bankAddress" cssClass="error" />
							</li>
							
							<li id="ibanGroup" <c:if test="${paymentForm.payType == 1 }">style="display:none;"</c:if>><label><fmt:message key="label.iban"/><span class="red">*</span> :</label>
								<form:input path="iban"/><br/><form:errors path="iban" cssClass="error" />
							</li>
							
							<li id="swiftCodeGroup" <c:if test="${paymentForm.payType == 1 }">style="display:none;"</c:if>><label><fmt:message key="label.swift_code"/><span class="red">*</span> :</label>
								<form:input path="swiftCode"/><br/><form:errors path="swiftCode" cssClass="error" />
							</li>
							
							<li id="itermediaryGroup" <c:if test="${paymentForm.payType == 1 }">style="display:none;"</c:if>><label></label>
								<c:if test="${paymentForm.isIntermediary == true}">
								<form:checkbox path="isIntermediary" checked="checked"/>
								</c:if>
								<c:if test="${paymentForm.isIntermediary == false }">
								<form:checkbox path="isIntermediary"/>
								</c:if>
								<fmt:message key="label.intermediary_bank"/> <form:errors path="isIntermediary" cssClass="error" />
							</li>
						</ul>
						<ul class="form">
							<li>
								<button type="submit"><fmt:message key="payment_submit"/></button>
							</li>
						</ul>
					</form:form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
    <jsp:include page="../includes/footer.jsp">
       <jsp:param value="page/edit_payment" name="loader"/>
    </jsp:include>
</body>
</html>
