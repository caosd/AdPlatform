<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>
  	<title>${Title }</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script type="text/javascript" src="${ctx }/Js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/common.js"></script>
	<script type="text/javascript" src="${ctx }/Js/verify/menuForm.js"></script>
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
  >>菜单修改
  </div>
  <div style="">
  	<form action="${ctx }/menu/updateMenu.html" method="post" onsubmit="return checkForm();">
  	    <input type="hidden" name="id" value="${menu.id }"/>
  		<table width='98%'  border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' style="margin-top:8px;margin-left: 10px;">
  			<!-- 菜单名称 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	菜单名称：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type='text' name='name' id="name" value='${menu.name }' style='width:250px' />
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 菜单描述 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	菜单描述：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type='text' name='desc' id="desc" value='${menu.desc }' style='width:250px' />
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 菜单路径 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	菜单路径：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type="text" name='path' id="path" value='${menu.path }' style='width:250px' />
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 父级菜单 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	父级菜单：
  				  </div>			
  				  <div style="float: left;">
  				  	<select name="parent" id="parent" style="width: 80px;">
  				    	<option value="0">--</option>
  				    	<c:forEach var="ms" items="${menuSys}">
  				    		<option value="${ms.id }" ${menu.parent == ms.id?'selected':''}>${ms.name }</option>
  				    	</c:forEach>
  				    </select>
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 是否显示 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	是否显示：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type="checkbox" value="1" name="visible" ${menu.visible == 1?'checked':''}/>可见
  				  </div>
  				</td>
  			</tr>
  			
  			<!-- 排序标识 -->
  			<tr bgcolor='#EEF4EA' background='${ctx}/iframe/skin/images/wbg.gif' height="30px;">
  				<td>
  				  <div style="width: 90px;float: left;">
  				  	排序标识：
  				  </div>			
  				  <div style="float: left;">
  				  	<input type="text" name='orderNo' id="orderNo" value='${menu.orderNo }' style='width:250px' />
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
