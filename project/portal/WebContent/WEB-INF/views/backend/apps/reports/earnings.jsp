<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="report.earnings_title"/></title>
<%@include file="../../includes/style.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/reports.css" media="all">
<link rel="stylesheet" type="text/css" href="/css/reports-print.css" media="print">
</head>
<body>
	<%@include file="../../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../../includes/sidebar.jsp"%>
				<div class="right_content">
					<div id="content">
					<h3><fmt:message key="report.earnings_title"/></h3>
					<div id="settings">
					  <a href="#" class="badge tertiary help" id="help-btn"></a>
					  <div id="search-container">
					      <a class="btn mini tertiary">
					        <span class="icon calendar"></span>
					        <span rel="label"><fmt:message key="option.last_7_days"/></span>
					        <span class="icon select"></span>
					      </a>
					      <ul class="popover light"></ul>
					  </div>
					  <div id="date-range">
					    <span id="start-date-container">
					      <input type="text" name="start" id="start" class="shorter" />
					    </span>
					    &nbsp;<fmt:message key="to"/>&nbsp;
					    <span id="end-date-conta iner">
					      <input type="text" name="end" id="end" class="shorter" />
					    </span>
					    <button id="update-chart" class="mini"><fmt:message key="apply"/></button>
					  </div>
					</div>
					<div id="chart-container">
					  <div id="data-fetch-error" class="report-overlay">
					    <fmt:message key="report.data_fetch_error"/>
					  </div>
					  <div id="report-type-help" class="report-overlay">
					    <h3><fmt:message key="report.help"/></h3>
					    <h4><fmt:message key="report.question_with_report_type"/></h4>
					    <ul><fmt:message key="report.earnings.answer_with_report_type"/></ul>
					  </div>
					  <div id="links"></div>
					  <div id="exports">
                        <a href="#" id="export-csv" title="<fmt:message key="report.export_csv"/>"><fmt:message key="report.export_csv"/></a> 
                        <a href="#" id="print-chart" title="<fmt:message key="report.print"/>"><fmt:message key="report.print"/></a> 
                        <a href="#" id="export-chart" title="<fmt:message key="report.export_image"/>"><fmt:message key="report.export_image"/></a>
                      </div>
					  <div id="chart" style="height: 340px"></div>
					</div>
					<div id="counter-totals" class="bare-box">
					  <span class="total" id="total-container"><fmt:message key="report.total"/></span>
					  <span class="total" id="average-container"><fmt:message key="report.average"/></span>
					  <span class="total" id="high-container"><fmt:message key="report.high"/></span>
					  <span class="total" id="low-container"><fmt:message key="report.low"/></span>
					</div>
				</div>
				<div><fmt:message key="report.timezone"/></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<jsp:include page="../../includes/footer.jsp">
	   <jsp:param value="page/reports_app_earnings" name="loader"/>
	</jsp:include>
</body>
</html>
