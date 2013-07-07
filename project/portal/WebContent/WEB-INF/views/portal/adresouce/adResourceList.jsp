<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/page" prefix="p" %>
<body>
<div class="row-fluid">
   <div class="span12">
       <!-- BEGIN THEME CUSTOMIZER-->
       <div id="theme-change" class="hidden-phone">
           <i class="icon-cogs"></i>
            <span class="settings">
                <span class="text">Theme:</span>
                <span class="colors">
                    <span class="color-default" data-style="default"></span>
                    <span class="color-gray" data-style="gray"></span>
                    <span class="color-purple" data-style="purple"></span>
                    <span class="color-navy-blue" data-style="navy-blue"></span>
                </span>
            </span>
       </div>
       <!-- END THEME CUSTOMIZER-->
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">资源管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">资源列表</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<!-- BEGIN ADVANCED TABLE widget-->
<div class="row-fluid">
    <div class="span12">
        <!-- BEGIN EXAMPLE TABLE widget-->
        <div class="widget">
            <div class="widget-title">
                <h4><i class="icon-reorder"></i>资源列表</h4>
                <span class="tools">
                    <a href="javascript:;" class="icon-chevron-down"></a>
                    <a href="javascript:;" class="icon-remove"></a>
                </span>
            </div>
            <div class="widget-body">
            	<div class="row-fluid">
            		<form:form id="searchForm" commandName="adResourceParamForm"  method="post">
	            		<div class="span2">
	            			<div id="table_length" class="dataTables_length">
	            				<label>
	            					<select size="1" name="pageSize" aria-controls="role_table" class="input-mini">
	            						<option value="10" selected="selected">10</option>
	            						<option value="25">25</option>
	            						<option value="50">50</option>
	            						<option value="100">100</option>
	            					</select>
	            				</label>
	            			</div>
	            		</div>
	            		<div class="span8">
			                                从&nbsp;
	                        <span id="start-date-container"><form:input type="text" path="startDatestr" style="width:80px"/></span>
	                        &nbsp;至&nbsp;
	                        <span id="end-date-container"><form:input type="text" path="endDatestr" style="width:80px"/></span>
	                        &nbsp;资源名称:&nbsp;<span><form:input type="text" path="adName" style="width:80px"/></span>
	                        &nbsp;请选择类型：
	                        <form:select path="adType" style="width:80px">
				             	<form:option value="0" selected="selected">热门</form:option>
				             	<form:option value="1">应用</form:option>
				             	<form:option value="2">游戏</form:option>
				            </form:select>
				            <form:input path="pageNum" type="hidden" id="pageNum"/>
	                    </div>
						<div class="span1">
							<button class="mini">查询</button>
						</div>
					</form:form>
				</div>
                <table class="table table-striped table-bordered" id="role_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th width="12%">资源名称</th>
                        <th>应用包名</th>
                        <th>积分</th>
                        <th>应用版本</th>
                        <th>安装包大小</th>
                        <th>广告类型</th>
                        <th>录入时间</th>
                        <th>有效日期</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach items="${adResourceList}" var="adr" varStatus="stat">
						<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
						<td>${stat.index}</td>
						<th>${adr.adName}</th>
						<td>${adr.adPackage}</td>
						<td>${adr.adPoint}</td>
						<td>${adr.version}</td>
						<td>${adr.fileSize}</td>
						<td>${adr.adTypeStr}</td>
						<td><fmt:formatDate value="${adr.itime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${adr.startTime } - ${adr.endTime }</td>
						<td>
							<span class="label ${adr.status==1?'label-success':'label-error' }">${adr.status }</span>
						</td>
						<td><a href="${ctx }/adResource/getAdResource.html?id=${adr.id }" >编辑</a> | <a href="${ctx }/adResource/showAdResource.html?id=${adr.id }">预览</a></td>
						</tr>
					</c:forEach>
                </tbody>
            </table>
            <div class="row-fluid">
            	<p:page pageNum="${pageNum}" pageTotal="${pageTotal}"></p:page>
            </div>
          </div>
        </div>
        <!-- END EXAMPLE TABLE widget-->
    </div>
</div>
</body>