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
  	<script type="text/javascript" src="${ctx }/Js/jquery.json-2.4.min.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/common.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/list.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/user.js"></script>
  </head>
  
  <body leftmargin="8" topmargin="8" background='${ctx}/iframe/skin/images/allbg.gif'>

	<!--  搜索表单  -->
	<form name="searchForm" id="searchForm" action="<c:if test='${flag }==0'>${ctx }/user/listUser.html</c:if><c:if test='${flag }==1'>${ctx }/user/listChannelUser.html</c:if>" method="post">
	<input type="hidden" value="${user.pageNum }" name="pageNum" id="pageNum">
	<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
	  <tr bgcolor='#EEF4EA'>
	    <td background='${ctx}/iframe/skin/images/wbg.gif' align='center'>
	      <table border='0' cellpadding='0' cellspacing='0'>
	        <tr>
	          <td width='70' align='center'>用户名：</td>
	          <td width='120'>
	          	<input type='text' name='username' id="username" value='${user.username }' style='width:100px' />
	          </td>
	        <td width='70' align='center'>
	          角色：
	        </td>
	        <td width='120'>
	        	<select name="roleId">
	        		<c:choose>
						<c:when test="${flag==1}">
							<option value="5" 'selected'/>渠道用户
						</c:when>
						<c:otherwise>
							<option value="-1" ${user.roleId == -1?'selected':''}/>所有
			        		<c:forEach var="rl" items="${roleList}">
		  				    	<option value="${rl.id }"  ${rl.id == user.roleId?'selected':''}>${rl.roleName }</option>
		  				    </c:forEach>
						</c:otherwise>
					</c:choose>
	        	</select>
	        </td>
	        <td width='70' align='center'>
	          状态：
	        </td>
	        <td width='120'>
	        	<select name="status">
	        		<option value="-1" ${user.status == -1?'selected':''}/>所有
	        		<option value="0" ${user.status == 0?'selected':''}/>有效
	        		<option value="1" ${user.status == 1?'selected':''}/>无效
	        	</select>
	        </td>
	        <td width='70' align='center'>
	          录入时间：
	        </td>
	        <td width='350'>
	          	<input type='text' name='startdate' id="startdate" value='${user.startdate }' style='width:150px' onClick="WdatePicker()"/>
	          	-
	          	<input type='text' name='enddate' id="enddate" value='${user.enddate }' style='width:150px' onClick="WdatePicker()"/>
	        </td>
	        <td>
	          <input name="imageField" type="image" src="${ctx}/iframe/skin/images/frame/search.gif" width="45" height="20" border="0" class="np" />
	        </td>
	       </tr>
	      </table>
	    </td>
	  </tr>
	</table>
	</form>
	  
	<!--  内容列表   -->
	<form name="form2">
	
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr bgcolor="#E7E7E7">
		<td height="24" colspan="8" background="${ctx}/iframe/skin/images/tbg.gif">&nbsp;用户列表&nbsp;</td>
	</tr>
	<tr align="center" bgcolor="#FAFAF1" height="22">
		<td width="5%">INDEX</td>
		<td width="10%">用户名</td>
		<td width="15%">角色</td>
		<c:if test="${flag==1}">
			<td width="15%">折扣</td>
		</c:if>
		<td width="15%">录入时间</td>
		<td width="15%">最近一次登录时间</td>
		<td width="5%">状态</td>
		<td width="15%">操作</td>
	</tr>
	
	<c:forEach var="ul" items="${userList}">
	<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
		<td>${ul.index }</td>
		<td >${ul.username }</td>
		<td>${ul.roleName }</td>
		<c:if test="${flag==1}">
			<td >${ul.discount }</td>
		</c:if>
		<td>${ul.createDate }</td>
		<td>${ul.lastLoginDate }</td>
		<td>
			<c:choose>
				<c:when test="${ul.status==0}">
					${ul.statusStr }
				</c:when>
				<c:otherwise>
					<font color="red">${ul.statusStr }</font>
				</c:otherwise>
			</c:choose>
		</td>
		<td>
		 <a href="${ctx }/user/editUser.html?id=${ul.id }">编辑</a>
		 | <a href="javascript:void(0);" onclick="updateUser('${ctx }/ajax/updateUser.html',2,${ul.id });">重置密码</a></td>
	</tr>	
	</c:forEach>
	<page:page pageNum="${user.pageNum }" pageTotal="${pageTotal }"></page:page>
	</table>
	
	</form>
	
  </body>
</html>
