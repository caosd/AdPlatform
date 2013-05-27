<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String uri = request.getRequestURI();
boolean isOverview = uri.indexOf("/overview") > 0;
boolean isChangeEmail = uri.indexOf("/change_email") > 0;
boolean isChangePwd = uri.indexOf("/change_pwd") > 0;
boolean isChangeProfile = uri.indexOf("/change_profile") > 0;
boolean isPayment = uri.indexOf("/payment") > 0;
boolean isStatements = uri.indexOf("/statements") > 0;
%>
<div class="left_content">
	<div class="sidebar">
		<h2>
			<span> <fmt:message key="side.account"/> </span>
		</h2>
		<ul>
			<li <%=isOverview?"class=\"current\"":""  %>>
				<a href="/accounts/overview"> <span> <fmt:message key="side.account.overview"/> </span> </a>
			</li>
            <li <%=isChangeEmail?"class=\"current\"":""  %>>
                <a href="/accounts/change_email"> <span> <fmt:message key="side.account.change_email"/> </span> </a>
            </li>
            <li <%=isChangeProfile?"class=\"current\"":""  %>>
                <a href="/accounts/change_profile"> <span> <fmt:message key="side.account.change_profile"/> </span> </a>
            </li>
			<li <%=isChangePwd?"class=\"current\"":""  %>>
				<a href="/accounts/change_pwd"> <span> <fmt:message key="side.account.change_password"/> </span> </a>
			</li>
			<li class='<%=isPayment?"current":"" %>'><a
				href="/accounts/payment"> <span> <fmt:message key="side.account.payment"/> </span>
			</a></li>
			<li class='<%=isStatements?"current":"" %>'><a
				href="/accounts/statements"> <span> <fmt:message key="side.account.statements"/> </span>
			</a></li>
		</ul>
	</div>
</div>
