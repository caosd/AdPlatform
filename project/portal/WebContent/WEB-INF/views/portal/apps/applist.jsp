<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/page" prefix="p"%>
<%@ include file="../includes/config.jsp" %>
<body>
	<div class="row-fluid">
		<div class="span12">
			<!-- END THEME CUSTOMIZER-->
			<ul class="breadcrumb">
				<li><a href="/"><i class="icon-home"></i></a><span
					class="divider">&nbsp;</span></li>
				<li><a href="#">开发者应用</a> <span class="divider">&nbsp;</span></li>
				<li><a href="#">应用列表</a><span class="divider-last">&nbsp;</span></li>
			</ul>
		</div>
	</div>
	<!-- BEGIN ADVANCED TABLE widget-->
	<div class="row-fluid">
		<div class="span12">
			<div class="widget">
				<div class="widget-header">
					<h5><fmt:message key="applist_title" /></h5>
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
						<li class="search-col"><form:input path="name" type="text" class="search-input" maxlength="20" placeholder="应用名查询"/></li>
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
									<th class="sorting">Icon</th>
									<th class="sorting">应用名称</th>
									<th class="sorting">创建日期</th>
									<th class="sorting">天数</th>
									<th class="sorting">总收入</th>
									<th class="sorting">发布</th>
									<th class="sorting">推送状态</th>
									<th class="sorting">推送收入</th>
									<th class="sorting">富媒体状态</th>
									<th class="sorting">富媒体收入</th>
									<th class="sorting">LBS状态</th>
									<th class="sorting">LBS收入</th>
									<th class="sorting">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${applist}" var="app" varStatus="stat">
									<tr class="${(stat.index%2) == 0 ? 'odd':'even' }">
										<td>${stat.index+1}</td>
										<td><img width="50" src='${imgServer }${iconDir}${app.key}/icon/${fn:replace(app.icon, "#", "%23")}'/></td>
										<td class="app_name"><a href="/apps/${app.appKey }/detail">${app.name}</a></td>
										<td><fmt:formatDate value="${app.createTime }" pattern="yyyy-MM-dd" /></td>
										<td>-</td>
										<td>-</td>
										<td>-</td>
										<td><c:choose>
												<c:when test="${app.allowPush }">
													<span class="label label-success">已开通</span>
												</c:when>
												<c:otherwise>
													<span class="label label-warning">未开通</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td>-</td>
										<td><c:choose>
												<c:when test="${app.allowRichpush}">
													<span class="label label-success">已开通</span>
												</c:when>
												<c:otherwise>
													<span class="label label-warning">未开通</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td>-</td>
										<td><c:choose>
												<c:when test="${app.allowLbs}">
													<span class="label label-success">已开通</span>
												</c:when>
												<c:otherwise>
													<span class="label label-warning">未开通</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td>-</td>
										<td>
											<a href="/apps/${app.appKey }/edit">编辑</a>
											<a href="javascript:," onclick="deleteData('/apps/${app.appKey }/delete')"><fmt:message key="app_overview_delete_middle"/></a>
											<a href="javascript:,">下载</a>
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
<script type="text/javascript">
	//导出excel
	(function() {
        $('#export-excel').bind("click",function(event,data) {
        	$form = $("#searchForm");
        	url = $form.attr("action");
        	$form.attr("action", "/apps/export-excel").submit();
        	$form.attr("action",url);
		});
    })();
</script>
</body>