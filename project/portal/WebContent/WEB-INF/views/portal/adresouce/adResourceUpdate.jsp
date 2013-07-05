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
  >>下载资源修改
  </div>
  <div style="">
  	<form action="${ctx }/adResource/updateAdResource.html" method="post" enctype="multipart/form-data" onsubmit="return checkForm(false,'${ctx }/hasPackage.html','${adResource.adPackage}');">
  		<input type="hidden" name="id" value="${adResource.id }"/>
  		<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' style="margin-top:8px;margin-left: 10px;">
  			<!-- 资源名称 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	资源名称：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type='text' name='adName' id="adName" value='${adResource.adName }' style='width:250px' />
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 广告类型 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	广告类型：
  				  </div>			
  				  <div style="float: left;">
  				  	<select name="adType" id="adType" style="width: 80px;">
  				  		<option value="0" ${adResource.adType == 0?'selected':''}>热门</option>
  				    	<option value="1" ${adResource.adType == 1?'selected':''}>应用</option>
  				    	<option value="2" ${adResource.adType == 2?'selected':''}>游戏</option>
  				    </select>
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 广告语 -->
  			<tr bgcolor='#EEF4EA'  height="80px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	<div style="padding-top: 32px">广告语：</div>
  				  </div>
  				  <div style="float: left;">
  				  	<textarea name='adText' id="adText" style='width:500px;height:80px;overflow-y:auto;resize:none;'>${adResource.adText }</textarea>
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 广告图标 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	广告图标：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type="file" name='adIconFile' id="adIconFile" value='' style='width:350px' />
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
  				  	<input type="text" name='adPoint' id="adPoint" value='${adResource.adPoint }' style='width:50px' />
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
  				  	<input type="radio" name="status" value='0' style='width:50px;border: none;' ${adResource.status == 0?'checked':''} />有效
  				  	<input type="radio" name="status" value='1' style='width:50px;border: none;' ${adResource.status == 1?'checked':''}/>无效
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
  				  	<input type="text" name="startTime" id="startTime" onClick="WdatePicker()" value="${adResource.startTime }" style='width:100px' />
  				  	-
  				  	<input type="text" name="endTime" id="endTime" onClick="WdatePicker()" value="${adResource.endTime }" style='width:100px' />
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
  				  	<input type="text" name=adPackage id="adPackage" value='${adResource.adPackage }' style='width:500px' />
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
  				  	<input type="file" name='adPackageFile' id="adPackageFile" value='' style='width:350px' />
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
  				  	<input type="text" name=version id="version" value='${adResource.version }' style='width:100px' />
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 应用描述 -->
  			<tr bgcolor='#EEF4EA'  height="100px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	<div style="padding-top: 42px;">应用描述：</div>
  				  </div>
  				  <div style="float: left;">
  				  	<textarea name='description' id="description" style='width:500px;height:100px;overflow-y:auto;resize:none;'>${adResource.description }</textarea>
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 应用图片 -->
  			<tr bgcolor='#EEF4EA'  height="150px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	<div style="padding-top: 67px;">应用图片：</div>
  				  </div>
  				  <div style="float: left;">
  				    <br/>
  				  	<input type="file" name='adImagea' id="adImagea" value='' style='width:350px' /><br/><br/>
  				  	<input type="file" name='adImageb' id="adImageb" value='' style='width:350px' /><br/><br/>
  				  	<input type="file" name='adImagec' id="adImagec" value='' style='width:350px' /><br/><br/>
  				  	<input type="file" name='adImaged' id="adImaged" value='' style='width:350px' /><br/><br/>
  				  </div>
  				</td>
  			</tr>
  			
  			<tr bgcolor='#EEF4EA'  height="30px;">
  				<td>
  					<div style="width: 300px;text-align: right;float: left;">
  						<input type="reset" name="reset" value="重置" style="cursor: pointer;background-color: #F1F8B4;">
  					</div>
  					<div style="width: 250px;text-align: center;float: left;">
  						<input type="submit" name="submit" id="submit" value="提交" style="cursor: pointer;background-color: #F1F8B4;">
  					</div>
  				</td>
  			</tr>
  		</table>
  	</form>
  </div>  
  </body>
</html>
