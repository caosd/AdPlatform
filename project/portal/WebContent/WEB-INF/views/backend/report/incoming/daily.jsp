<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/html_attributes.jsp" %>
<head>
<%@include file="../../includes/style.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/tablereport.css" media="screen">
</head>
<body>
	<%@include file="../../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
			    <%@include file="../../includes/accounts_sidebar.jsp"%>
			    <div class="right_content">
					<h2>每日统计</h2>
					<div id="settings">
						<form:form commandName="reportParamForm" method="POST" action="/report/incoming/daily">
		                      <div id="date-range" class="ready" style="display: block; opacity: 1; top: 4px; z-index: 1000;">
		                        从&nbsp;
		                        <span id="start-date-container"><form:input type="text" path="startDatestr" class="shorter" value=""/></span>
		                        &nbsp;至&nbsp;
		                        <span id="end-date-container"><form:input type="text" path="endDatestr" class="shorter" value=""/></span>
		                        &nbsp;请选择应用：
		                        <form:select class="mini" path="appId">
		                            <option value="0">全部应用</option>
		                            <c:forEach items="${appList}" var="app" varStatus="stat">
										<option value="${app.id}" ${reportParam.appId == app.id ? 'selected':'' }>${app.name }</option>
									</c:forEach>
		                        </form:select>
		                        &nbsp;&nbsp;
		                        <button class="mini">查询</button>
		                      </div>
		                </form:form>
                    </div>
                    <div class="box">
                       <!--<table class="data">
                           <thead>
                             <tr>
                               <th width="12%">天数</th>
                               <th>新增用户</th>
                               <th>在线用户</th>
                               <th>推送收入 (元)</th>
                               <th>应用内广告收入 (元)</th>
                               <th>总收入 (元)</th>
                             </tr>
                           </thead>
                           <tbody>
                             <c:forEach items="${todayList}" var="report" varStatus="stat">
								<tr>
								<th><fmt:formatDate value="${report.idate }" pattern="MM-dd" /></th>
								<td><fmt:formatNumber value="${report.newUsers }"/></td>
								<td><fmt:formatNumber value="${report.onlineUsers }"/></td>
								<td>${report.moneyPushes }</td>
								<td>${report.moneyAdvertising }</td>
								<td>${report.moneyPushes+report.moneyAdvertising }</td>
								</tr>
							</c:forEach>
							<c:if test="${fn:length(todayList) == 0 }">
	                             <tr>
	                               <td colspan="7">没有任何可显示的结果</td>
	                             </tr>
							</c:if>
                           </tbody>
                       </table>
                       --><table class="data">
                           <thead>
                             <tr>
                               <th width="12%">日期</th>
                               <th>新增用户</th>
                               <th>在线用户</th>
                               <th>推送收入 (元)</th>
                               <th>应用内广告收入 (元)</th>
                               <th>总收入 (元)</th>
                             </tr>
                           </thead>
                           <tbody>
                             <c:forEach items="${dailyList}" var="report" varStatus="stat">
								<tr>
								<th><fmt:formatDate value="${report.idate }" pattern="yyyy-MM-dd" /></th>
								<td><fmt:formatNumber value="${report.newUsers }"/></td>
								<td><fmt:formatNumber value="${report.onlineUsers }"/></td>
								<td>${report.moneyPushes }</td>
								<td>${report.moneyAdvertising }</td>
								<td>${report.moneyPushes+report.moneyAdvertising }</td>
								</tr>
							</c:forEach>
							<c:if test="${fn:length(dailyList) == 0 }">
	                             <tr>
	                               <td colspan="7">没有任何可显示的结果</td>
	                             </tr>
							</c:if>
                           </tbody>
                       </table>
                        ${pager}
                    </div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
    <jsp:include page="../../includes/footer.jsp">
        <jsp:param value="page/ad_report" name="loader"/>
    </jsp:include>
</body>
</html>
