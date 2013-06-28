<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/page" prefix="page" %> 
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  	<link rel="stylesheet" type="text/css" href="${ctx}/iframe/skin/css/base.css"/>
  	<link rel="stylesheet" type="text/css" href="${ctx}/css/adResourceList.css"/>
  	<script type="text/javascript" src="${ctx }/Js/calendar/WdatePicker.js"></script>
  	<script type="text/javascript" src="${ctx }/Js/jquery-1.9.0.min.js"></script>
  	<script type="text/javascript" src="${ctx }/Js/jquery.json-2.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/common.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/list.js"></script>
  </head>
  
  <body leftmargin="8" topmargin="8" background='${ctx}/iframe/skin/images/allbg.gif'>
	<!--  搜索表单  -->
	<form name="searchForm" id="searchForm" action="${ctx }/role/listRole.html" method="post">
		<input type="hidden" value="${role.pageNum }" name="pageNum" id="pageNum">
	</form>
	
	<!--  内容列表   -->
	<form name="form2">
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr bgcolor="#E7E7E7">
		<td height="24" colspan="5" background="${ctx}/iframe/skin/images/tbg.gif">&nbsp;角色列表&nbsp;</td>
	</tr>
	<tr align="center" bgcolor="#FAFAF1" height="22">
		<td width="8%">INDEX</td>
		<td width="15%">角色</td>
		<td width="17%">录入时间</td>
		<td width="8%">状态</td>
		<td width="17%">操作</td>
	</tr>
	
	<c:forEach var="rl" items="${roleList}">
	<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
		<td>${rl.index }</td>
		<td >${rl.roleName }</td>
		<td>${rl.createDate }</td>
		<td>
			<c:choose>
				<c:when test="${rl.status==0}">
					${rl.statusStr }
				</c:when>
				<c:otherwise>
					<font color="red">${rl.statusStr }</font>
				</c:otherwise>
			</c:choose>
		</td>
		<td>
		  <a href="${ctx }/role/roleFormpage.html?id=${rl.id }">修改权限</a>
		</td>
	</tr>	
	</c:forEach>
	<page:page pageNum="${role.pageNum }" pageTotal="${pageTotal }"></page:page>
	</table>
	
	</form>
	
  </body>
</html>
