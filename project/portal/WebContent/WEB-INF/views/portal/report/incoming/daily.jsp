<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/page" prefix="p"%>
<body>
	<div class="row-fluid">
		<div class="span12">
			<!-- END THEME CUSTOMIZER-->
			<ul class="breadcrumb">
				<li><a href="/"><i class="icon-home"></i></a><span
					class="divider">&nbsp;</span></li>
				<li><a href="#">收入报表</a> <span class="divider">&nbsp;</span></li>
				<li><a href="#">每日统计</a><span class="divider-last">&nbsp;</span></li>
			</ul>
		</div>
	</div>
	<!-- BEGIN ADVANCED TABLE widget-->
	<div class="row-fluid">
		<div class="span12">
			<div class="widget">
				<div class="widget-header">
					<h5>每日统计</h5>
					<form:form id="searchForm" commandName="formParam" method="post" class="form-inline">
                    <form:hidden path="pageNum" id="pageNum"/>
                    <form:hidden path="startDate" id="search_start" />
                    <form:hidden path="endDate" id="search_end" />
					<ul class="widget-nav">
						<li id="reportrange">
						    <img src="/img/icon/14x14/light/calendar.png" alt=""> <span></span>
						</li>
						<li>
							<%@include file="../../includes/pagesize.jsp" %>
						</li>
						<li class="search-col"><form:select class="mini" path="appId" style="width:100px">
		                            <form:option value="0">全部应用</form:option>
		                            <c:forEach items="${appList}" var="app" varStatus="stat">
										<form:option value="${app.id}">${app.name }</form:option>
									</c:forEach>
		                        </form:select>
		                </li>
						<li class="search-col"><button type="submit" class="button button-turquoise small-button">查询</button></li>
					</ul>
					</form:form>
				</div>
				<div class="widget-body table-container">
					<div class="dataTables_wrapper">
						<table class="default-table stripped turquoise dataTable">
							<thead>
								<tr align="left">
									<th>#</th>
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
									<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
									<td>${stat.index+1}</td>
									<th><fmt:formatDate value="${report.idate }" pattern="yyyy-MM-dd" /></th>
									<td><fmt:formatNumber value="${report.newUsers }"/></td>
									<td><fmt:formatNumber value="${report.onlineUsers }"/></td>
									<td>${report.moneyPushes }</td>
									<td>${report.moneyAdvertising }</td>
									<td>${report.moneyPushes+report.moneyAdvertising }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="tableFooter">
							<p:page pageNum="${formParam.pageNum}" pageTotal="${formParam.pageTotal}"></p:page>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>