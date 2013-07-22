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
				<li><a href="#">广告控制管理</a> <span class="divider">&nbsp;</span></li>
				<li><a href="#">广告推送控制列表</a><span class="divider-last">&nbsp;</span></li>
			</ul>
		</div>
	</div>
	<!-- BEGIN ADVANCED TABLE widget-->
	<div class="row-fluid">
		<div class="span12">
			<div class="widget">
				<div class="widget-header">
					<h5>广告推送控制列表</h5>
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
						<li class="search-col"><form:input path="adresourceId" type="text" class="search-input" maxlength="20" placeholder="资源名称"/></li>
						<li class="search-col"><button type="submit" class="button button-turquoise small-button">查询</button></li>
						<li id="export-excel"><a href="javascript:;"><img src="/img/icon/14x14/light/download4.png" title="导出excel"></a></li>
					</ul>
					</form:form>
				</div>
				<div class="widget-body table-container">
					<div class="dataTables_wrapper">
						<table class="default-table stripped turquoise dataTable">
							<thead>
								<tr align="left">
									<th class="sorting">#</th>
									<th class="sorting">推送日期</th>
									<th class="sorting">上架时间</th>
									<th class="sorting">渠道名称</th>
									<th class="sorting">广告名称</th>
									<th class="sorting">广告单价</th>
									<th class="sorting">是否首推</th>
									<th class="sorting">最大推送量</th>
									<th class="sorting">实际推送量</th>
									<th class="sorting">实际收入</th>
									<th class="sorting">推送ARPU</th>
									<th class="sorting">状态</th>
									<th class="sorting">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${adPushList}" var="item" varStatus="stat">
									<tr class="${(stat.index%2) == 0 ? 'odd':'even' }">
										<td>${stat.index}</td>
										<td><fmt:formatDate value="${item.push_date }" pattern="yyyy-MM-dd" /></td>
				                        <td><fmt:formatDate value="${item.shelf_date }" pattern="yyyy-MM-dd" /></td>
				                        <td>${item.channel_name }</td>
				                        <td>${item.ad_name }</td>
				                        <td>${item.price }</td>
				                        <td>
											<c:choose>
												<c:when test="${item.first_push==1}">
													<span class="label label-success">是</span>
												</c:when>
												<c:otherwise>
													<span class="label label-warning">否</span>
												</c:otherwise>
											</c:choose>
										</td>
				                        <td>${item.max_push }</td>
				                        <td>${item.real_push }</td>
				                        <td>${item.money }</td>
				                        <td>${item.arpu }</td>
				                        <td>
											<c:choose>
												<c:when test="${item.status==1}">
													<span class="label label-success">打开</span>
												</c:when>
												<c:otherwise>
													<span class="label label-warning">关闭</span>
												</c:otherwise>
											</c:choose>
										</td>
				                        <td class=" ">
				                        	<a href="/adpush/${item.id }/update.html">编辑</a>
				                        </td>
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