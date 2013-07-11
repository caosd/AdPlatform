<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head><style type="text/css">.navbar .span2{width:14%;}</style></head>
<body>
	<ul class="breadcrumb">
		<li><a href="/"><i class="icon-home"></i></a><span
			class="divider">&nbsp;</span></li>
		<li><a href="#">广告渠道管理</a> <span class="divider">&nbsp;</span></li>
		<li><a href="#">广告渠道列表</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<form:form commandName="adChannelParamForm" method="POST" class="form-horizontal form-wizard">
			<div class="widget-header">
				<h5>广告渠道列表</h5>
			</div>
			<div class="widget-content no-padding">
			   <div class="row-fluid">
            		<form:form id="searchForm" commandName="menuParamForm" method="post">
	            		<div class="span3">
	            			<div id="table_length" class="dataTables_length">
	            				<label>
	            					<form:select path="pageSize" size="1" class="input-mini">
	            						<form:option value="10">10</form:option>
	            						<form:option value="25">25</form:option>
	            						<form:option value="50">50</form:option>
	            						<form:option value="100">100</form:option>
	            					</form:select>
	            				</label>
	            			</div>
	            		</div>
	            		<div class="span3">
			                    <label>渠道名称: <form:input path="name" type="text" aria-controls="role_table" class="input-medium"/></label>
	                    </div>
						<div class="span3">
							<button type="submit" class="btn btn-inverse">查询</button>
							<form:input path="pageNum" type="hidden" aria-controls="role_table"  id="pageNum"/>
						</div>
					</form:form>
				</div>
                <table class="table table-striped table-bordered" id="role_table">
	                <thead>
	                    <tr>
	                        <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
	                        <th>#</th>
	                        <th>渠道名称</th>
	                        <th>联系电话</th>
	                        <th>QQ</th>
	                        <th>联系人</th>
	                        <th>是否启用</th>
	                        <th>添加时间</th>
	                        <th>操作</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach items="${adChannelList}" var="item" varStatus="stat">
			            		<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
			            			<td class="sorting_1"><input type="checkbox" class="checkboxes" value="${item.id }"></td>
			            			<td class="sorting_1">${stat.index}</td>
			                        <td>${item.channelName }</td>
			                        <td>${item.chantactTel }</td>
			                        <td>${item.qq }</td>
			                        <td>${item.contactName }</td>
			                        <td>
										<c:choose>
											<c:when test="${item.enable == 0}">
												<span class="label label-warning">未启用</span>
											</c:when>
											<c:otherwise>
												<span class="label label-success">已启用</span>
											</c:otherwise>
										</c:choose>
									</td>
			                        <td>${item.createTime }</td>
			                        <td class=" ">
			                        	<a href="/adchannel/updateAdChannel.html?id=${item.id }">编辑</a>
			                        </td>
			                    </tr>
			           </c:forEach>
	                </tbody>
	            </table>
	            <div class="row-fluid">
	            	<p:page pageNum="${pageNum}" pageTotal="${pageTotal}"></p:page>
	            </div>
			</div>
		</form:form>
	</div>
</body>