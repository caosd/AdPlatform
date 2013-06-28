<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>
  	<title>${Title }</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script type="text/javascript" src="${ctx }/Js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/common.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/roleForm.js"></script>
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
  >>新增角色
  </div>
  <div style="">
  	<form action="${ctx }/role/addRole.html" method="post" onsubmit="return checkForm();">
  		<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' style="margin-top:8px;margin-left: 10px;">
  			<!-- 用户名 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	用户名：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type='text' name='roleName' id="roleName" value='' style='width:250px' />
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
