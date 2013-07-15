<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="/page" prefix="p" %>
<body>
<div class="row-fluid">
   <div class="span12">
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">收入报表</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">小时统计</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<!-- BEGIN ADVANCED TABLE widget-->
<div class="row-fluid">
    <div class="span12">
        <!-- BEGIN EXAMPLE TABLE widget-->
        <div class="widget">
            <div class="widget-title">
                <h4><i class="icon-reorder"></i>广告推送</h4>
                <span class="tools">
                    <a href="javascript:;" class="icon-chevron-down"></a>
                    <a href="javascript:;" class="icon-remove"></a>
                </span>
            </div>
            <div class="widget-body">
            	<div class="row-fluid">
            		<form:form id="searchForm" commandName="reportParamForm"  method="post">
	            		<div class="span3">
	            			<div id="table_length" class="dataTables_length">
	            				<label>
	            					<select size="1" name="pageSize" aria-controls="role_table" class="input-mini">
	            						<option value="10" selected="selected">10</option>
	            						<option value="25">25</option>
	            						<option value="50">50</option>
	            						<option value="100">100</option>
	            					</select> 
	            					records per page
	            				</label>
	            			</div>
	            		</div>
	            		<div class="span6">
			                                从&nbsp;
	                        <span id="start-date-container"><form:input type="text" path="startDatestr" style="width:80px"/></span>
	                        &nbsp;至&nbsp;
	                        <span id="end-date-container"><form:input type="text" path="endDatestr" style="width:80px"/></span>
	                        &nbsp;请选择应用：
	                        <form:select class="mini" path="appId" style="width:80px">
	                            <option value="0">全部应用</option>
	                            <c:forEach items="${appList}" var="app" varStatus="stat">
									<option value="${app.id}" ${reportParam.appId == app.id ? 'selected':'' }>${app.name }</option>
								</c:forEach>
	                        </form:select>
	                    </div>
						<div class="span3">
							<button class="mini">查询</button>
						</div>
					</form:form>
				</div>
                <table class="table table-striped table-bordered" id="role_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th width="12%">日期</th>
                        <th>总用户数</th>
                        <th>应用打开次数</th>
                        <th>展示次数</th>
                        <th>填充率</th>
                        <th>广告收入 (元)</th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach items="${dailyList}" var="report" varStatus="stat">
						<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
						<td>${stat.index}</td>
						<th><fmt:formatDate value="${report.idate }" pattern="yyyy-MM-dd" /></th>
						<td><fmt:formatNumber value="${report.totalUsers }"/></td>
						<td><fmt:formatNumber value="${report.appOpens }"/></td>
						<td><fmt:formatNumber value="${report.displayTimes }"/></td>
						<td><fmt:formatNumber value="${report.fillRate }" type="percent"/></td>
						<td>${report.moneyAdvertising }</td>
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