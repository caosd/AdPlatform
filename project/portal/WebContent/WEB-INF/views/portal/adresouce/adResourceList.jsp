<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/page" prefix="p" %>
<head><style type="text/css">.navbar .span2{width:14%;}</style></head>
<body>
	<ul class="breadcrumb">
		<li><a href="/"><i class="icon-home"></i></a><span
			class="divider">&nbsp;</span></li>
		<li><a href="#">资源管理</a> <span class="divider">&nbsp;</span></li>
		<li><a href="#">资源列表</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<div class="widget-header">
			<h5>资源列表</h5>
		</div>
		<div class="widget-content">
		   <div class="row-fluid">
	          		<form:form id="searchForm" commandName="adResource" method="post">
	           		<div class="span3">
	           			<div id="table_length" class="dataTables_length">
	           				<label>
	           					<select name="pageSize" size="1" class="input-mini">
	           						<option value="10" ${pageBean.pageSize==10 ? "selected":"" }>10</option>
	           						<option value="25" ${pageBean.pageSize==25 ? "selected":"" }>25</option>
	           						<option value="50" ${pageBean.pageSize==50 ? "selected":"" }>50</option>
	           						<option value="100" ${pageBean.pageSize==100 ? "selected":"" }>100</option>
	           					</select>
	           				</label>
	           			</div>
	           		</div>
	           		<div class="span3">
		                    <label>资源名称: <form:input path="adName" type="text" class="input-medium"/></label>
	                </div>
					<div class="span3">
						<button type="submit" class="btn btn-inverse">查询</button>
						<input name="pageNum" type="hidden" aria-controls="role_table" id="pageNum" value="${pageBean.pageNum}"/>
					</div>
				</form:form>
			</div>
	            <table class="table table-striped table-bordered" id="role_table">
	               <thead>
	                   <tr>
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
		                        <td>${item.channelId }</td>
		                        <td>${item.adName }</td>
		                        <!--<td>${item.adPackage }</td>
		                        <td>${item.fileSize }</td>
		                        --><td>${item.version }</td>
		                        <td>${item.supportPlatform }</td>
		                        <td>${item.appTypeId }</td>
		                        <td>${item.chargeType }</td>
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
		                        	<a href="/adResource/updateAdResource.html?id=${item.id }">编辑</a>
		                        	<a href="javascript:void(0)" onclick="deleteData('/adResource/deleteAdResource.html?id=${item.id }')">删除</a>
		                        </td>
		                    </tr>
		           </c:forEach>
	               </tbody>
	           </table>
	           <div class="row-fluid">
	           	<p:page pageNum="${pageBean.pageNum}" pageTotal="${pageBean.pageTotal}"></p:page>
	           </div>
		</div>
	</div>
</body>