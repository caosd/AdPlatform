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
	<script type="text/javascript" src="${ctx }/Js/verify/common.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/list.js"></script>
  </head>
  
  <body leftmargin="8" topmargin="8" background='${ctx}/iframe/skin/images/allbg.gif'>

	<!--  搜索表单  -->
	<form name="searchForm" id="searchForm" action="${ctx }/adResource/adResourceList.html" method="post">
	<input type="hidden" value="${adResource.pageNum }" name="pageNum" id="pageNum">
	<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
	  <tr bgcolor='#EEF4EA'>
	    <td background='${ctx}/iframe/skin/images/wbg.gif' align='center'>
	      <table border='0' cellpadding='0' cellspacing='0'>
	        <tr>
	          <td width='90' align='center'>资源名称：</td>
	          <td width='160'>
	          	<input type='text' name='adName' id="adName" value='${adResource.adName }' style='width:150px' />
	          </td>
	        <td width='90' align='center'>
	          应用包名：
	        </td>
	        <td width='160'>
	          	<input type='text' name='adPackage' id="adPackage" value='${adResource.adPackage }' style='width:150px' />
	        </td>
	        <td width='90' align='center'>
	          录入时间：
	        </td>
	        <td width='350'>
	          	<input type='text' name='startdate' id="startdate" value='${adResource.startdate }' style='width:150px' onClick="WdatePicker()"/>
	          	-
	          	<input type='text' name='enddate' id="enddate" value='${adResource.enddate }' style='width:150px' onClick="WdatePicker()"/>
	        </td>
	        
	        <td>
	        <!-- 
	          <input name="imageField" type="image" src="${ctx}/iframe/skin/images/frame/search.gif" width="45" height="20" border="0" class="np" />
	          --> 
	          <input name="imageField" type="submit" value="" style="background: url('${ctx}/iframe/skin/images/frame/search.gif');width:45;height:20;cursor: pointer;" width="45" height="20" border="0" class="np" />
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
		<td height="24" colspan="12" background="${ctx}/iframe/skin/images/tbg.gif">&nbsp;下载资源列表&nbsp;</td>
	</tr>
	<tr align="center" bgcolor="#FAFAF1" height="22">
		<td width="20" style="display: none;">ID</td>
		<td width="40">INDEX</td>
		<td width="150">资源名称</td>
		<td width="200">应用包名</td>
		<td width="40">积分</td>
		<td width="60">应用版本</td>
		<td width="80">安装包大小</td>
		<td width="80">广告类型</td>
		<td width="100">录入时间</td>
		<td width="200">有效日期</td>
		<td width="40">状态</td>
		<td width="100">操作</td>
	</tr>
	<!--  
	<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
		<td style="display: none;">3</td>
		<td>5</td>
		<td>测试阿灿</td>
		<td align="left">com.aa.bb</td>
		<td>10</td>
		<td>1.0</td>
		<td>300</td>
		<td>默认类型</td>
		<td>2013-03-28</td>
		<td>2013/03/28 - 2013/03/28</td>
		<td>有效</td>
		<td><a href="101">编辑</a> | <a href="101">预览</a></td>
	</tr>
	-->
	<c:forEach var="adr" items="${adResourceList}">
	<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
		<td style="display: none;">${adr.id }</td>
		<td>${adr.index }</td>
		<td>${adr.adName }</td>
		<td align="left">${adr.adPackage }</td>
		<td>${adr.adPoint }</td>
		<td>${adr.version }</td>
		<td>${adr.fileSize }</td>
		<td>${adr.adTypeStr }</td>
		<td>${adr.itime }</td>
		<td>${adr.startTime } - ${adr.endTime }</td>
		<td>
			<c:choose>
				<c:when test="${adr.status==0}">
					${adr.statusStr }
				</c:when>
				<c:otherwise>
					<font color="red">${adr.statusStr }</font>
				</c:otherwise>
			</c:choose>
		</td>
		<td><a href="${ctx }/adResource/getAdResource.html?id=${adr.id }" >编辑</a> | <a href="${ctx }/adResource/showAdResource.html?id=${adr.id }">预览</a></td>
	</tr>	
	</c:forEach>
	
	<!-- 分页 -->
	<page:page pageNum="${adResource.pageNum }" pageTotal="${pageTotal }"></page:page>
	
	<!--  
	<tr align="right" bgcolor="#EEF4EA">
		<td height="36" colspan="12" align="right">
			<div class="pageLabel">
			<c:choose>
				<c:when test="${pageTotal}==0">
					<span style="float: right;">没有记录</span>
				</c:when>
				<c:otherwise>
					<span>第${adResource.pageNum }/${pageTotal }页</span>
					<c:choose>
						<c:when test="${adResource.pageNum==1}">
							<span style="color: #8D8D8D;">[上一页]</span>
						</c:when>
						<c:otherwise>
							[<a href="javascript:void(0);" onclick="perPage();">上一页</a>]
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${adResource.pageNum==pageTotal}">
							<span style="color: #8D8D8D;">[下一页]</span>
						</c:when>
						<c:otherwise>
							[<a href="javascript:void(0);" onclick="nextPage();">下一页</a>]
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			</div>
		</td>
	</tr>
	-->
	</table>
	
	</form>
	
  </body>
</html>
