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
				<li><a href="#">角色管理</a> <span class="divider">&nbsp;</span></li>
				<li><a href="#">角色列表</a><span class="divider-last">&nbsp;</span></li>
			</ul>
		</div>
	</div>
	<!-- BEGIN ADVANCED TABLE widget-->
	<div class="row-fluid">
		<div class="span12">
			<div class="widget">
				<div class="widget-header">
					<h5>角色列表</h5>
					<form:form id="searchForm" commandName="formParam" method="post" class="form-inline">
                    <form:hidden path="pageNum" id="pageNum"/>
					<ul class="widget-nav">
						<li>
							<%@include file="../includes/pagesize.jsp" %>
						</li>
						<li class="search-col"><form:input path="roleName" type="text" class="search-input" maxlength="20" placeholder="角色名称"/></li>
						<li class="search-col"><button type="submit" class="button button-turquoise small-button">查询</button></li>
					</ul>
					</form:form>
				</div>
				<div class="widget-body table-container">
					<div class="dataTables_wrapper">
						<table class="default-table stripped turquoise dataTable">
							<thead>
								<tr align="left">
									<th class="sorting">#</th>
									<th>角色名称</th>
			                        <th>录入时间</th>
			                        <th>状态</th>
			                        <th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${roleList}" var="item" varStatus="stat">
				            		<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
				                        <td>${stat.index}</td>
				                        <td class=" ">${item.roleName }</td>
				                        <td class=" "><fmt:formatDate value="${item.createDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				                        <td>
											<c:choose>
												<c:when test="${item.status == 0}">
													<span class="label label-warning">无效</span>
												</c:when>
												<c:otherwise>
													<span class="label label-success">有效</span>
												</c:otherwise>
											</c:choose>
										</td>
				                        <td class=" ">
					                        <a href="/role/roleFormpage.html?id=${item.id }">修改权限</a>
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