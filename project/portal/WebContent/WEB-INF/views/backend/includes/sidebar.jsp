<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String uri = request.getRequestURI();//this is absolute file path, caused by sitemash
	boolean isPushAd = uri.indexOf("/apps/pushsetting") > 0;
	boolean isPushTest = uri.indexOf("/apps/pushtest") > 0;
	boolean isPushComposer = uri.indexOf("/apps/pushcomposer") > 0;
	boolean isEarnings = uri.indexOf("/reports/earnings") > 0;
	boolean isReport = uri.indexOf("/reports") > 0;
	if (isEarnings) isReport = false;
	boolean isAppDetail = uri.indexOf("/detail") > 0;
	boolean isAppEdit = uri.indexOf("/edit") > 0;
	boolean isUploads = uri.indexOf("/uploads") > 0;
	
    boolean isFinancialOverview = uri.indexOf("/financial/overview") > 0;
    boolean isFinancialAccounts = uri.indexOf("/financial/accounts") > 0;
    boolean isFinancialRemittance = uri.indexOf("/financial/remittance") > 0;
    boolean isFinancialRemittanceHistory = uri.indexOf("/financial/remittance_history") > 0;
    if (isFinancialRemittanceHistory) isFinancialRemittance = false;
    
    boolean isDailyIncomingReport = uri.indexOf("/report/incoming/daily") > 0;
    boolean isMonthlyIncomingReport = uri.indexOf("/report/incoming/monthly") > 0;
    boolean isHourlyIncomingReport = uri.indexOf("/report/incoming/hourly") > 0;
%>
<div class="left_content">
	<div id="premium_sidebar" class="sidebar">
		<h2>
			<span> <fmt:message key="side.app.push"/> </span>
		</h2>
		<ul>
            <li id="premium_composer" class="<%=isPushTest?"current":"" %>">
                <a href="/apps/${app.key }/push/test">
                    <span class="icon push-composer"></span><fmt:message key="side.app.test"/>
                </a>
            </li>
            <li id="premium_composer" class="<%=isPushAd?"current":"" %>">
                <a href="/apps/${app.key }/push/setting">
                    <span class="icon push-composer"></span>推送设置
                </a>
            </li>
            <li id="premium_composer" class="<%=isPushComposer?"current":"" %>">
                <a href="/apps/${app.key }/push/composer">
                    <span class="icon push-composer"></span>自定义内容
                </a>
            </li>
			<li id="premium_reports" class="<%=(isReport||isEarnings)?"current":"" %>">
				<a href="/apps/${app.key }/reports">
					<span class="icon reports"></span><fmt:message key="side.app.report"/>
				</a>
				<ul>
					<li class="<%=isReport?"current":"" %>"><a href="/apps/${app.key}/reports"><fmt:message key="side.app.userstatistic"/></a></li>
					<li class="<%=isEarnings?"current":"" %>"><a href="/apps/${app.key}/reports/earnings"><fmt:message key="side.app.earnings"/></a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="app_sidebar" class="sidebar">
		<h2>
			<span>${app.name }</span>
		</h2>
		<ul>
			<li id="app_details" class="<%=isAppDetail?"current":"" %>"><a href="/apps/${app.key }/detail"> <span> <fmt:message key="side.app.overview"/> </span></a></li>
            <li id="edit_app" class="<%=isAppEdit?"current":"" %>"><a href="/apps/${app.key }/edit"> <span> <fmt:message key="side.app.edit"/> </span></a></li>
            <li id="app_uploads" class="<%=isUploads?"current":"" %>"><a href="/apps/${app.key }/uploads"> <span> <fmt:message key="side.app.upload"/> </span></a></li>
            <li id="sdk_integration"><a href="/docs/<fmt:message key="docs_alias"/>"> <span> <fmt:message key="side.app.doc"/> </span></a></li>
            <li id="sdk_download"><a href="/sdk/download"> <span> <fmt:message key="side.app.downsdk"/> </span></a></li>
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
            <li class="<%=isHourlyIncomingReport?"current":"" %>"><a href="/report/incoming/hourly"> <span> <fmt:message key="side.report.incoming.hourly"/> </span></a></li>
        </ul>
    </div>
</div>