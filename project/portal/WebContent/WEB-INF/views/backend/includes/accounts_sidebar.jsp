<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String uri = request.getRequestURI();
boolean isOverview = uri.indexOf("/overview") > 0;
boolean isChangeEmail = uri.indexOf("/change_email") > 0;
boolean isChangePwd = uri.indexOf("/change_pwd") > 0;
boolean isChangeProfile = uri.indexOf("/change_profile") > 0;

boolean isPushAd = uri.indexOf("/apps/pushsetting") > 0;
boolean isPushTest = uri.indexOf("/apps/pushtest") > 0;
boolean isPushComposer = uri.indexOf("/apps/pushcomposer") > 0;

boolean isFinancialOverview = uri.indexOf("/financial/overview") > 0;
if (isFinancialOverview) isOverview = false;
boolean isFinancialAccounts = uri.indexOf("/financial/accounts") > 0;
boolean isFinancialRemittance = uri.indexOf("/financial/remittance") > 0;
boolean isFinancialRemittanceHistory = uri.indexOf("/financial/remittance_history") > 0;
if (isFinancialRemittanceHistory) isFinancialRemittance = false;

boolean isDailyIncomingReport = uri.indexOf("/report/incoming/daily") > 0;
boolean isMonthlyIncomingReport = uri.indexOf("/report/incoming/monthly") > 0;
boolean isHourlyIncomingReport = uri.indexOf("/report/incoming/hourly") > 0;

boolean isPushesAdvertReport = uri.indexOf("/report/advert/pushes") > 0;
boolean isAdvertisingReport = uri.indexOf("/report/advert/advertising") > 0;
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
		</ul>
	</div>
	<div id="financial_sidebar" class="sidebar">
        <h2>
            <span><fmt:message key="side.financial"/></span>
        </h2>
        <ul>
            <li class="<%=isFinancialOverview?"current":"" %>"><a href="/financial/overview"> <span> <fmt:message key="side.financial.overview"/> </span></a></li>
            <li class="<%=isFinancialAccounts?"current":"" %>"><a href="/financial/accounts"> <span> <fmt:message key="side.financial.accounts"/> </span></a></li>
            <li class="<%=isFinancialRemittance?"current":"" %>"><a href="/financial/remittance"> <span> <fmt:message key="side.financial.remittance"/> </span></a></li>
            <li class="<%=isFinancialRemittanceHistory?"current":"" %>"><a href="/financial/remittance_history"> <span> <fmt:message key="side.financial.remittance_history"/> </span></a></li>
        </ul>
    </div>
    <div id="incomingReport_sidebar" class="sidebar">
        <h2>
            <span><fmt:message key="side.report.incoming"/></span>
        </h2>
        <ul>
            <li class="<%=isMonthlyIncomingReport?"current":"" %>"><a href="/report/incoming/monthly"> <span> <fmt:message key="side.report.incoming.monthly"/> </span></a></li>
            <li class="<%=isDailyIncomingReport?"current":"" %>"><a href="/report/incoming/daily"> <span> <fmt:message key="side.report.incoming.daily"/> </span></a></li>
        </ul>
    </div>
    <div id="advertiReport_sidebar" class="sidebar">
        <h2>
            <span><fmt:message key="side.report.advert"/></span>
        </h2>
        <ul>
            <li class="<%=isPushesAdvertReport?"current":"" %>"><a href="/report/advert/pushes"> <span> <fmt:message key="side.report.advert.pushes"/> </span></a></li>
            <li class="<%=isAdvertisingReport?"current":"" %>"><a href="/report/advert/advertising"> <span> <fmt:message key="side.report.advert.advertising"/> </span></a></li>
        </ul>
    </div>
</div>
