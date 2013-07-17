<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/page" prefix="p" %>
<body>
<div class="row-fluid">
   <div class="span12">
       <!-- END THEME CUSTOMIZER-->
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">开发者应用</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#"><fmt:message key="applist_title"/></a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<!-- BEGIN ADVANCED TABLE widget-->
<div class="row-fluid">
    <div class="span12">
        <!-- BEGIN EXAMPLE TABLE widget-->
        <div class="widget">
			<div class="widget-header">
				<h5><fmt:message key="applist_title"/></h5>
			</div>
            <div class="widget-body">
            	<div class="row-fluid">
            		<form id="exportForm" method="post" style="display:none" action="/apps/exportExcel.html"></form>
            		<form id="searchForm" method="post">
            			<div class="span3">
	            			<div id="table_length" class="dataTables_length">
	            				<label>
	            					<select name="pageSize" size="1" class="input-mini">
	            						<option value="10">10</option>
	            						<option value="25">25</option>
	            						<option value="50">50</option>
	            						<option value="100">100</option>
	            					</select>
	            				</label>
	            			</div>
	            		</div>
	            		<div class="span3">
			                    <label>应用名: <input name="name" type="text" class="input-medium"/></label>
	                    </div>
						<div class="span3">
							<button type="submit" class="btn btn-inverse">查询</button>
							<button type="button" id="excel_but" class="btn btn-inverse">导出Excel</button>
							<input name="pageNum" type="hidden" id="pageNum"/>
						</div>
					</form>
				</div>
                <table class="table table-striped table-bordered" id="role_table">
                <thead>
                    <tr>
                        
                        <th>#</th>
                        <th width="16%"><fmt:message key="applist_name"/></th>
						<th width="8%"><fmt:message key="applist_total"/></th>
						<th width="16%"><fmt:message key="applist_active"/></th>
						<th width="18%"><fmt:message key="applist_new"/></th>
						<th class="last" width="10%"><fmt:message key="applist_earnings"/></th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${applist}" var="app" varStatus="stat">
		            		<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
		            			<td class="sorting_1"><input type="checkbox" class="checkboxes" value="${item.uid }"></td>
		            			<td class="sorting_1">${stat.index}</td>
		                        <td class="app_name"><a href="/apps/${app.key }/detail">${app.name }</a></td>
								<td class=app_amounts>-</td>
								<td class="app_online">- / -</td>
								<td class="app_new">- / -</td>
								<td class="app_earnings">-</td>
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
<script>
    (function() {
    	//导出excel
    	$('#excel_but').bind("click",function(event,data) {
    		var postData = jQuery(currGridElementId).jqGrid("getGridParam","postData");
    		var params = "page="+postData.page+"&rows="+postData.rows;
    		$("#exportForm").submit();
    	});
    })();
    </script>
</body>