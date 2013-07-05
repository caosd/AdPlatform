<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>
  	<title>${Title }</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script type="text/javascript" src="${ctx }/Js/calendar/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx }/Js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/common.js"></script>
    <script type="text/javascript" src="${ctx }/Js/verify/adForm.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/iframe/skin/css/base.css"/>
    <style>
    	textarea { border: 1px solid #ababab; }
        .div1{
        	font-size: 15px;
        	margin-left: 12px;   
        }
    	.font1{
    		margin-right: 5px;
    		width: 90px;
    	}
    </style>
  </head>
  
  <body> 
  <div class="div1">
  >>下载资源展示
  </div>
  <div style="">
  		<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' style="margin-top:8px;margin-left: 10px;">
  			<!-- 资源名称 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	资源名称：
  				  </div>			
  				  <div style="float: left;">
  				  	${adResource.adName }
  				  </div>
  				  <div style="float: right;padding-right: 10px;"><a href="${ctx }/adResource/getAdResource.html?id=${adResource.id }" style="color: blue;">编辑</a></div>
  				</td>
  			</tr>
  			
  			<!-- 广告类型 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	广告类型：
  				  </div>			
  				  <div style="float: left;">
  				  	${adResource.adTypeStr }
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 广告语 -->
  			<tr bgcolor='#EEF4EA'  height="80px;">
  				<td>
  				  <div style="width: 90px;height:80px;float: left;">
  				  	<div style="padding-top: 32px">广告语：</div>
  				  </div>
  				  <div style="height:80px;float: left;">
  				  	${adResource.adText }
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 广告图标 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;height:72px;float: left;">
  				  	<div style="padding-top: 26px">广告图标：</div>
  				  </div>			
  				  <div style="float: left;height:80px;">
  				  	<img src="${adResource.adIcon }"/>
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 广告积分 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	广告积分：
  				  </div>			
  				  <div style="float: left;">
  				  	${adResource.adPoint }
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 状态 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	状态：
  				  </div>			
  				  <div style="float: left;">
  				  	${adResource.statusStr }
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 有效时间 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	有效时间：
  				  </div>			
  				  <div style="float: left;">
  				  	${adResource.startTime }
  				  	-
  				  	${adResource.endTime }
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 应用包名 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	应用包名：
  				  </div>			
  				  <div style="float: left;">
  				  	${adResource.adPackage }
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 应用包 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	应用包：
  				  </div>			
  				  <div style="float: left;">
  				  	<a href="${adResource.apkUrl }">${adResource.apkUrl }</a>
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 应用版本 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	应用版本：
  				  </div>			
  				  <div style="float: left;">
  				  	${adResource.version }
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 应用描述 -->
  			<tr bgcolor='#EEF4EA'  height="100px;">
  				<td>
  				  <div style="width: 90px;height:100px;float: left;">
  				  	<div style="padding-top: 42px;">应用描述：</div>
  				  </div>
  				  <div style="float: left;height:100px;">
  				  	${adResource.description }
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 应用图片 -->
  			<tr bgcolor='#EEF4EA'  height="150px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	<div style="padding-top: 67px;">应用图片：</div>
  				  </div>
  				  <div style="float: left;height:160px;">
  				  	<c:forEach var="ail" items="${adResource.adImagesList}">
  				  		<a href="${ail}" target="_blank"><img src="${ail}" height="160px;"/></a>&nbsp;&nbsp;
  				  	</c:forEach>
  				  </div>
  				</td>
  			</tr>
  		</table>
  </div>  
  </body>
</html>
