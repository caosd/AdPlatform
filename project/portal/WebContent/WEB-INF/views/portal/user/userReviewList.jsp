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
				<li><a href="#">用户管理</a> <span class="divider">&nbsp;</span></li>
				<li><a href="#">用户列表</a><span class="divider-last">&nbsp;</span></li>
			</ul>
		</div>
	</div>
	<!-- BEGIN ADVANCED TABLE widget-->
	<div class="row-fluid">
		<div class="span12">
			<div class="widget">
				<div class="widget-header">
					<h5>用户列表</h5>
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
						<li class="search-col"><form:input path="userName" type="text" class="search-input" maxlength="20" placeholder="用户名"/></li>
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
			                        <th>注册时间</th>
			                        <th>角色</th>
			                        <th>用户名</th>
			                        <th>电子邮件</th>
			                        <th>公司名称</th>
			                        <th>联系人</th>
			                        <th>联系电话</th>
			                        <th>QQ号码</th>
			                        <th>网站地址</th>
			                        <th>状态</th>
			                        <th>操作</th>	
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList}" var="item" varStatus="stat">
					            		<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
					                        <td class=" ">${stat.index+1}</td>
					                        <td class=" "><fmt:formatDate value="${item.createtime }" pattern="yyyy-MM-dd" /></td>
					            			<td class=" ">
												<c:choose>
													<c:when test="${item.type == 2}">
														运营管理员
													</c:when>
													<c:when test="${item.type == 3}">
														个人开发者
													</c:when>
													<c:when test="${item.type == 4}">
														公司
													</c:when>
													<c:otherwise>
														游客
													</c:otherwise>
												</c:choose>
											</td>
					                        <td class=" ">${item.userName }</td>
					                        <td class=" ">${item.email }</td>
					                        <td class=" ">${item.company }</td>
					                        <td class=" ">${item.contactName }</td>
					                        <td class=" ">${item.contactTel }</td>
					                        <td class=" ">${item.qq }</td>
					                        <td class=" ">${item.website }</td>
					                        <td>
												<c:choose>
													<c:when test="${item.status == 0}">
														<span class="label label">审核不通过</span>
													</c:when>
													<c:when test="${item.status == 1}">
														<span class="label label-success">审核通过</span>
													</c:when>
													<c:otherwise>
														<span class="label label-warning">等待审核</span>
													</c:otherwise>
												</c:choose>
											</td>
					                        <td class=" ">
					                        	<a href="javascript:void(0)" onclick="approvedBtn(${item.uid },'${item.userName }')"> 通过 </a>
					                        	<a href="javascript:void(0)" onclick="noPassBtn(${item.uid },'${item.userName }')"> 不通过 </a>
					                        	<a href="javascript:void(0)" onclick="rebutBtn(${item.uid },'${item.userName }')"> 驳回 </a>
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
<script type="text/javascript">
  /*
  *审核通过
  */
  function approvedBtn(id,userName) {
  		if(confirm("确认用户["+userName+"]审核通过？")){
     		window.location.href = "/accounts/"+id+"/userApproved.html";
     	}
  };
  /*
  *审核不通过
  */
  function noPassBtn(id,userName) {
  		if(confirm("确认用户["+userName+"]审核不通过？")){
     		window.location.href = "/accounts/"+id+"/userNoPass.html";
     	}
  };
  /*
   *审核不通过驳回
   */
   function rebutBtn(id) {
      	window.location.href = "/accounts/"+id+"/userRebut.html";
   };
</script>
</body>