<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>
  	<title>${Title }</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script type="text/javascript" src="${ctx }/Js/jquery-1.9.0.min.js"></script>
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
  >>修改用户
  </div>
  <div style="">
  	<form action="${ctx }/user/updateUserRoleAndStatus.html" method="post">
  	    <input type="hidden" name="id" value="${user.id }"/>
  		<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' style="margin-top:8px;margin-left: 10px;">
  			<!-- 用户名 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	用户名：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type='text' disabled="disabled" name='username' id="username" value='${user.username }' style='width:250px' />
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
  				    	<option value="${rl.id }"  ${rl.id == user.roleId?'selected':''}>${rl.roleName }</option>
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
  				  	<input type='text' name='channelNo' id='channelNo' value='${user.channelNo }' style='width:250px' />
  				  </div>
  				</td>
  			</tr>
  			
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;" id='channelNameTr'>
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	渠道名称：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type='text' name='channelName' id="channelName" value='${user.channelName }' style='width:250px' />
  				  </div>
  				</td>
  			</tr>
  			
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;" id='disTr' style="display: none;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	折扣：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type='text' name='discount' id="discount" value='${user.discount }' style='width:250px' />
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
  				  	<input type="radio" name="status" value="0" ${user.status==0?'checked':''}/>有效
  				  	<input type="radio" name="status" value="1" ${user.status==1?'checked':''}/>无效
  				  </div>
  				</td>
  			</tr>
  			
  			<tr bgcolor='#EEF4EA'  height="30px;">
  				<td>
  					<div style="width: 300px;text-align: right;float: left;">
  						<input type="reset" name="reset" value="重置" style="cursor: pointer;background-color: #F1F8B4;">
  					</div>
  					<div style="width: 250px;text-align: center;float: left;">
  						<input type="submit" name="submit" value="提交" style="cursor: pointer;background-color: #F1F8B4;">
  					</div>
  				</td>
  			</tr>
  		</table>
  	</form>
  </div>  
  </body>
  <script type="text/javascript">
  	var role = $("#roleId").val();
	if(role === '5'){
		showDis(true);
	}else{
		showDis(false);
	}
  </script>
</html>
