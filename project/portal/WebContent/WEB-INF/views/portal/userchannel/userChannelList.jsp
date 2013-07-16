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
		<li><a href="#">用户渠道管理</a> <span class="divider">&nbsp;</span></li>
		<li><a href="#">用户渠道列表</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<div class="widget-header">
			<h5>用户渠道列表</h5>
		</div>
		<div class="widget-content">
		   <div class="row-fluid">
	          		<form:form id="searchForm" commandName="userChannel" method="post">
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
		                    <label>渠道编号: <form:input path="channelNo" type="text" aria-controls="role_table" class="input-medium"/></label>
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
	                       <th>渠道编号</th>
	                       <th>厂商名</th>
	                       <th>描述</th>
	                       <th>添加时间</th>
	                       <th>推送开关</th>
	                       <th>操作</th>
	                   </tr>
	               </thead>
	               <tbody>
	               	<c:forEach items="${userChannelList}" var="item" varStatus="stat">
		            		<tr class="gradeX ${(stat.index%2) == 0 ? 'odd':'even' }">
		            			
		            			<td class="sorting_1">${stat.index}</td>
		                        <td>${item.channelNo }</td>
		                        <td>${item.companyName }</td>
		                        <td>${item.description }</td>
		                        <td><fmt:formatDate value="${item.createDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		                        <td>
									<c:choose>
										<c:when test="${item.status==1}">
											<span class="label label-success">打开</span>
										</c:when>
										<c:otherwise>
											<span class="label label-warning">关闭</span>
										</c:otherwise>
									</c:choose>
								</td>
		                        <td class=" ">
		                        	<a href="javascript:void(0)" onclick="openPushBtn(${item.id },'${item.channelNo }')"> 打开 </a>
		                        	<a href="javascript:void(0)" onclick="closePushBtn(${item.id },'${item.channelNo }')"> 关闭 </a>
		                        	<a href="javascript:void(0)" onclick="deleteData('/userchannel/deleteUserChannel.html?id=${item.id }')"> 删除 </a>
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
<script type="text/javascript">
  /*
  *打开推送
  */
  function openPushBtn(id,channelNo) {
  		if(confirm("确认打开["+channelNo+"]推送吗？")){
     		window.location.href = "/userchannel/openPushChannel.html?id="+id;
     	}
  };
  /*
  *关闭推送
  */
  function closePushBtn(id,channelNo) {
  		if(confirm("确认关闭["+channelNo+"]推送吗？")){
     		window.location.href = "/userchannel/closePushChannel.html?id="+id;
     	}
  };
</script>
</body>