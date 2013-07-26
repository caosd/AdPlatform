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
				<li><a href="#">财务管理</a> <span class="divider">&nbsp;</span></li>
				<li><a href="#">汇款记录</a><span class="divider-last">&nbsp;</span></li>
			</ul>
		</div>
	</div>
	<!-- BEGIN ADVANCED TABLE widget-->
	<div class="row-fluid">
		<div class="span12">
			<div class="widget">
				<div class="widget-header">
					<h5>汇款记录</h5>
					<form:form id="searchForm" commandName="formParam" method="post" class="form-inline">
                    <form:hidden path="pageNum" id="pageNum"/>
                    <form:hidden path="startDate" id="search_start" />
                    <form:hidden path="endDate" id="search_end" />
					<ul class="widget-nav">
						<li id="reportrange">
						    <img src="/img/icon/14x14/light/calendar.png" alt=""> <span></span>
						</li>
						<li>
							<%@include file="../includes/pagesize.jsp" %>
						</li>
						<li class="search-col"><button type="submit" class="button button-turquoise small-button">查询</button></li>
					</ul>
					</form:form>
				</div>
				<div class="widget-body table-container">
					<div class="dataTables_wrapper">
						<table class="default-table stripped turquoise dataTable">
							<thead>
								<th>#</th>
		                        <th>姓名</th>
		                        <th>卡号</th>
		                        <th>金额</th>
		                        <th>取款时间</th>
		                        <th>汇款时间</th>
		                        <th>状态</th>
		                        <th>备注</th>
							</thead>
							<tbody>
								<c:forEach items="${remittanceList}" var="remittance" varStatus="stat">
									<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
									<td>${stat.index}</td>
									<th>${remittance.bankAccount }</th>
									<td>${remittance.bankCard }</td>
									<td>${remittance.money }</td>
									<td><fmt:formatDate value="${remittance.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><fmt:formatDate value="${remittance.remittanceTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>
										<c:choose>
											<c:when test="${remittance.status == 0}">
												<span class="label label-warning">申请中</span>
											</c:when>
											<c:otherwise>
												<span class="label label-success">汇款成功</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td>${remittance.remark }</td>
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