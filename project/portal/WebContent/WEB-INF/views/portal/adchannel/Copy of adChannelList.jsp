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
		<li><a href="#">广告渠道管理</a> <span class="divider">&nbsp;</span></li>
		<li><a href="#">广告渠道列表</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<div class="widget-header">
			<h5>广告渠道列表</h5>
		</div>
		<div class="widget-content">
		<c:if test="${success != null}">
           <div class="note note-danger" style="margin: 20px 30px;">
               <button type="button" class="close note-remove">×</button>
               <strong><fmt:message key="tips"/></strong> 
               <c:choose>
               	<c:when test="${success=='del'}">
               		删除渠道成功。
               	</c:when>
               	<c:otherwise>
               		未知操作结果。
               	</c:otherwise>
               </c:choose>
           </div>
           </c:if>
		   <div class="row-fluid">
	          		<form:form id="searchForm" commandName="adChannel" method="post">
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
		                    <label>渠道名称: <form:input path="channelName" type="text" aria-controls="role_table" class="input-medium"/></label>
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
		            			
		            			<td class="sorting_1">${stat.index}</td>
		                        <td>${item.channelName }</td>
		                        <td>${item.contactTel }</td>
		                        <td>${item.qq }</td>
		                        <td>${item.contactName }</td>
		                        <td>
									<c:choose>
										<c:when test="${item.enable}">
											<span class="label label-success">已启用</span>
										</c:when>
										<c:otherwise>
											<span class="label label-warning">未启用</span>
										</c:otherwise>
									</c:choose>
								</td>
		                        <td><fmt:formatDate value="${item.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		                        <td class=" ">
		                        	<a href="/adchannel/updateAdChannel.html?id=${item.id }">编辑</a>
		                        	<a href="javascript:void(0)" onclick="deleteData('/adchannel/deleteAdChannel.html?id=${item.id }')">删除</a>
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