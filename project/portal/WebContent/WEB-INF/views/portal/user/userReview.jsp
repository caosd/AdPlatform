<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
               <a href="#">用户管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">用户列表</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<!-- BEGIN ADVANCED TABLE widget-->
<div class="row-fluid">
    <div class="span12">
        <!-- BEGIN EXAMPLE TABLE widget-->
        <div class="widget">
			<div class="widget-header">
				<h5>用户列表</h5>
			</div>
            <div class="widget-body">
            	<div class="row-fluid">
            		<form:form id="searchForm" commandName="userParamForm"  method="post">
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
			                    <label>用户名: <form:input path="userName" type="text" class="input-medium"/></label>
	                    </div>
						<div class="span3">
							<button type="submit" class="btn btn-inverse">查询</button>
							<form:input path="pageNum" type="hidden" id="pageNum"/>
						</div>
					</form:form>
				</div>
                <table class="table table-striped table-bordered" id="role_table">
                <thead>
                    <tr>
                        <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
                        <th>#</th>
                        <th>用户名</th>
                        <th>角色</th>
                        <th>录入时间</th>
                        <th>最后登录时间</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${userList}" var="item" varStatus="stat">
		            		<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
		            			<td class="sorting_1"><input type="checkbox" class="checkboxes" value="${item.uid }"></td>
		            			<td class="sorting_1">${stat.index}</td>
		                        <td class=" ">${item.userName }</td>
		                        <td class=" ">${item.type }</td>
		                        <td class=" "><fmt:formatDate value="${item.createtime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		                        <td class=" "><fmt:formatDate value="${item.loginTokenTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		                        <td>
									<c:choose>
										<c:when test="${item.status == 0}">
											<span class="label label-warning">审核不通过</span>
										</c:when>
										<c:when test="${item.status == 1}">
											<span class="label label-warning">等待审核</span>
										</c:when>
										<c:otherwise>
											<span class="label label-success">审核通过</span>
										</c:otherwise>
									</c:choose>
								</td>
		                        <td class=" ">
		                        	<a href="/accounts/editUser.html?id=${item.uid }">通过</a>
		                        	<a href="/accounts/resetPw.html?id=${item.uid }">不通过</a>
		                        </td>
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