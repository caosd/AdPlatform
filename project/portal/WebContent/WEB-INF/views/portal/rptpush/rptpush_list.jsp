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
				<li><a href="#">广告报表管理</a> <span class="divider">&nbsp;</span></li>
				<li><a href="#">广告收入报表</a><span class="divider-last">&nbsp;</span></li>
			</ul>
		</div>
	</div>
	<!-- BEGIN ADVANCED TABLE widget-->
	<div class="row-fluid">
		<div class="span12">
			<div class="widget">
				<div class="widget-header">
					<h5>广告收入报表</h5>
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
						<li class="search-col"><form:input path="adName" type="text" class="search-input" maxlength="20" placeholder="广告资源名称"/></li>
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
									<th class="sorting">广告名称</th>
									<th class="sorting">渠道</th>
									<th class="sorting">日期</th>
									<th class="sorting">拉取数</th>
									<th class="sorting">收入</th>
									<th class="sorting">展示数</th>
									<th class="sorting">点击数</th>
									<th class="sorting">下载数</th>
									<th class="sorting">下载成功数</th>
									<th class="sorting">下载失败数</th>
									<th class="install">安装数</th>
									<th class="sorting">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${rptPushList}" var="item" varStatus="stat">
									<tr class="${(stat.index%2) == 0 ? 'odd':'even' }">
										<td>${stat.index+1}</td>
										<td>${item.ad_name}</td>
				                        <td>${item.channel_name }</td>
				                        <td>${item.idate }</td>
				                        <td>${item.push }</td>
				                        <td>${item.revenue }</td>
				                        <td>${item.shows }</td>
				                        <td>${item.click }</td>
				                        <td>${item.download }</td>
				                        <td>${item.download_success }</td>
				                        <td>${item.fail }</td>
				                        <td>${item.install }</td>
				                        <td class=" ">
				                        	<a href="/rptpush/${item.id }/edit.html">编辑</a>
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
        	$form.attr("action", "/adpush/export-excel").submit();
        	$form.attr("action",url);
		});
    })();
</script>
</body>