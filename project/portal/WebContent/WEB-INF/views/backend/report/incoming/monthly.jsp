<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<h2>每月统计</h2>
					<div id="settings">
						<form:form commandName="reportParamForm" method="POST">
		                      <div id="date-range" class="ready" style="display: block; opacity: 1; top: 4px; z-index: 1000;">
		                        从&nbsp;
		                        <span id="start-date-container"><form:input type="text" path="startDatestr" class="shorter"/></span>
		                        &nbsp;至&nbsp;
		                        <span id="end-date-container"><form:input type="text" path="endDatestr" class="shorter"/></span>
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
					   <table class="data">
					       <thead>
                             <tr>
                               <th width="12%">月份</th>
                               <th>新增用户</th>
                               <th>在线用户</th>
                               <th>推送收入 (元)</th>
                               <th>应用内广告收入 (元)</th>
                               <th>总收入 (元)</th>
                             </tr>
                           </thead>
                           <tbody>
                             <c:forEach items="${monthlyList}" var="report" varStatus="stat">
								<tr>
								<th><fmt:formatDate value="${report.idate }" pattern="yyyy-MM-dd" /></th>
								<td><fmt:formatNumber value="${report.newUsers }"/></td>
								<td><fmt:formatNumber value="${report.onlineUsers }"/></td>
								<td>${report.moneyPushes }</td>
								<td>${report.moneyAdvertising }</td>
								<td>${report.moneyPushes+report.moneyAdvertising }</td>
								</tr>
							</c:forEach>
							<c:if test="${fn:length(monthlyList) == 0 }">
	                             <tr>
	                               <td colspan="7">没有任何可显示的结果</td>
	                             </tr>
							</c:if>
                           </tbody>
					   </table>
					   <ul class="pages">
	                        <li class="prev"><a href="javascript:void(0);" class="btn mini tertiary disabled" rel="prev">←</a></li>
	                        <li class="next"><a href="javascript:void(0);" class="btn mini tertiary disabled" rel="next">→</a></li>
	                        <li><a href="javascript:void(0);" class="btn mini tertiary selected">1</a></li>
	                    </ul>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
    <jsp:include page="../../includes/footer.jsp"></jsp:include>
</body>
</html>
