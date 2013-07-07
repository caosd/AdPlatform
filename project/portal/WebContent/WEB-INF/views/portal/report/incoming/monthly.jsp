<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
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
               <a href="#">收入报表</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">每月统计</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<!-- BEGIN ADVANCED TABLE widget-->
<div class="row-fluid">
    <div class="span12">
        <!-- BEGIN EXAMPLE TABLE widget-->
        <div class="widget">
            <div class="widget-header">
				<h5>每月统计</h5>
			</div>
            <div class="widget-body">
            	<div class="row-fluid">
            		<form:form id="searchForm" commandName="reportParamForm"  method="post">
	            		<div class="span2">
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
	            		<div class="span8">
			                                从&nbsp;
	                        <span id="start-date-container"><form:input type="text" path="startDatestr" style="width:80px"/></span>
	                        &nbsp;至&nbsp;
	                        <span id="end-date-container"><form:input type="text" path="endDatestr" style="width:80px"/></span>
	                        &nbsp;请选择应用：
		                        <form:select class="mini" path="appId" style="width:100px">
		                            <option value="0">全部应用</option>
		                            <c:forEach items="${appList}" var="app" varStatus="stat">
										<option value="${app.id}" ${reportParam.appId == app.id ? 'selected':'' }>${app.name }</option>
									</c:forEach>
		                        </form:select>
	                    </div>
						<div class="span1">
							<button type="submit" class="btn btn-inverse">查询</button>
							<form:input path="pageNum" type="hidden" aria-controls="role_table"  id="pageNum"/>
						</div>
					</form:form>
				</div>
                <table class="table table-striped table-bordered" id="role_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th width="12%">日期</th>
                        <th>新增用户</th>
                        <th>在线用户</th>
                        <th>推送收入 (元)</th>
                        <th>应用内广告收入 (元)</th>
                        <th>总收入 (元)</th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach items="${monthlyList}" var="report" varStatus="stat">
						<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
						<td>${stat.index}</td>
						<th><fmt:formatDate value="${report.idate }" pattern="yyyy-MM-dd" /></th>
						<td><fmt:formatNumber value="${report.newUsers }"/></td>
						<td><fmt:formatNumber value="${report.onlineUsers }"/></td>
						<td>${report.moneyPushes }</td>
						<td>${report.moneyAdvertising }</td>
						<td>${report.moneyPushes+report.moneyAdvertising }</td>
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