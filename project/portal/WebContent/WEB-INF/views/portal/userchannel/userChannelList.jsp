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
				<li><a href="#">用户渠道管理</a> <span class="divider">&nbsp;</span></li>
				<li><a href="#">用户渠道列表</a><span class="divider-last">&nbsp;</span></li>
			</ul>
		</div>
	</div>
	<!-- BEGIN ADVANCED TABLE widget-->
	<div class="row-fluid">
		<div class="span12">
			<div class="widget">
				<div class="widget-header">
					<h5>用户渠道列表</h5>
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
						<li class="search-col"><form:input path="channelNo" type="text" class="search-input" maxlength="32" placeholder="渠道编号"/></li>
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
			                       <th>渠道编号</th>
			                       <th>厂商名</th>
			                       <th>描述</th>
			                       <th>添加时间</th>
			                       <th>推送开关</th>
			                       <th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userChannelList}" var="item" varStatus="stat">
					            		<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
					            			
					            			<td class="sorting_1">${stat.index+1}</td>
					                        <td>${item.channelNo }</td>
					                        <td>${item.companyName }</td>
					                        <td>${item.description }</td>
					                        <td><fmt:formatDate value="${item.createDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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
					                        	<a href="javascript:void(0)" onclick="openPushBtn(${item.id },'${item.channelNo }')"> 打开 </a>
					                        	<a href="javascript:void(0)" onclick="closePushBtn(${item.id },'${item.channelNo }')"> 关闭 </a>
					                        	<a href="javascript:void(0)" onclick="deleteData('/userchannel/deleteUserChannel.html?id=${item.id }')"> 删除 </a>
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