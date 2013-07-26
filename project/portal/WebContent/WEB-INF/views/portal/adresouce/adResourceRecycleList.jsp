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
				<li><a href="#">资源管理</a> <span class="divider">&nbsp;</span></li>
				<li><a href="#">资源列表</a><span class="divider-last">&nbsp;</span></li>
			</ul>
		</div>
	</div>
	<!-- BEGIN ADVANCED TABLE widget-->
	<div class="row-fluid">
		<div class="span12">
			<div class="widget">
				<div class="widget-header">
					<h5>资源列表</h5>
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
						<li class="search-col"><form:input path="adName" type="text" class="search-input" maxlength="20" placeholder="资源名称"/></li>
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
			                       <th>广告渠道</th>
			                       <th>资源名称</th>
			                       <!--<th>应用包名</th>
			                       <th>文件大小</th>
			                       --><th>应用版本</th>
			                       <th>支持平台</th>
			                       <th>应用分类</th>
			                       <th>收费类型</th>
			                       <th>单价</th>
			                       <th>结算方式</th>
			                       <th>下载次数</th>
			                       <th>推荐数</th>
			                       <th>推荐等级</th>
			                       <th>创建日期</th>
			                       <th>状态</th>
			                       <th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${adResourceList}" var="item" varStatus="stat">
					            		<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
					            			<td class="sorting_1">${stat.index}</td>
					                        <td>
											<c:forEach items="${adChannelList}" var="adChannel" >
					                        	<c:if test="${adChannel.id == item.channelId}">
					                        		${adChannel.channelName }
					                        	</c:if>
					                        </c:forEach>
											</td>
					                        <td>${item.adName }</td>
					                        <!--<td>${item.adPackage }</td>
					                        <td>${item.fileSize }</td>
					                        --><td>${item.version }</td>
					                        <td>${item.supportPlatform }</td>
					                        <td>
											<c:forEach items="${appTypeList}" var="appType" >
					                        	<c:if test="${appType.id == item.appTypeId}">
					                        		${appType.typeName }
					                        	</c:if>
					                        </c:forEach>
											</td>
					                        <td>
											<c:choose>
					                        		<c:when test="${item.chargeType == 0 }">免费</c:when>
					                        		<c:otherwise>收费</c:otherwise>
					                        </c:choose>
											</td>
					                        <td>${item.price }</td>
					                        <td>${item.clearingForm }</td>
					                        <td>${item.downloads }</td>
					                        <td>${item.recommens }</td>
					                        <td>${item.adRating }</td>
					                        <td><fmt:formatDate value="${item.createDate }" pattern="yyyy-MM-dd" /></td>
					                        <td>
												<c:choose>
													<c:when test="${item.status==1}">
														<span class="label label-success">上架</span>
													</c:when>
													<c:otherwise>
														<span class="label label-warning">下架</span>
													</c:otherwise>
												</c:choose>
											</td>
					                        <td class=" ">
					                        	<a href="/adResource/recover.html?id=${item.id }">还原</a>
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