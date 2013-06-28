<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>
  	<title>${Title }</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script type="text/javascript" src="${ctx }/Js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${ctx }/Js/jquery.json-2.4.min.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/common.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/userForm.js"></script>
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
  >>新增用户
  </div>
  <div style="">
  	<form action="${ctx }/user/addUser.html" method="post" onsubmit="return checkForm('${ctx }/hasUser.html');">
  		<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' style="margin-top:8px;margin-left: 10px;">
  			<!-- 用户名 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	用户名：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type='text' name='username' id="username" value='' style='width:250px' />
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 密码 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	密码：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type="password" name='password' id="password" value='' style='width:250px' />
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 确认密码 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	确认密码：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type='password' name='confirmPw' id="confirmPw" value='' style='width:250px' />
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 角色 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	角色：
  				  </div>			
  				  <div style="float: left;">
  				  	<select name="roleId" id="roleId" style="width: 80px;" onchange="changeRole(this);">
  				    	<c:forEach var="rl" items="${roleList}">
  				    	<option value="${rl.id }" >${rl.roleName }</option>
  				    	</c:forEach>
  				    </select>
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 渠道用户 渠道号 渠道名称 折扣 -->
  			
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;" id='channelNoTr'>
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	渠道号：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type='text' name='channelNo' id='channelNo' value='' style='width:250px' />
  				  </div>
  				</td>
  			</tr>
  			
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;" id='channelNameTr'>
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	渠道名称：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type='text' name='channelName' id="channelName" value='' style='width:250px' />
  				  </div>
  				</td>
  			</tr>
  			
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;" id='disTr'>
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	折扣：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type='text' name='discount' id="discount" value='1.0' style='width:250px' />
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
