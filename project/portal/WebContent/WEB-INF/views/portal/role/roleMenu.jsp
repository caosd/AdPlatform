<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.stomato.domain.Menu"%>
<html>
  <head>
	<title>${Title }</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/iframe/skin/css/base.css"/>
    <script type="text/javascript" src="${ctx }/Js/jquery-1.9.0.min.js"></script>
    <script>
       <%
	  	List<Integer> roleMenuIdList = (List<Integer>)request.getAttribute("roleMenuIdList");
	  	List<Menu> menuList = (List<Menu>)request.getAttribute("menuList");
	  	int length = roleMenuIdList.size();
	   %>
       function init(){
          var data =new Array(<%=length%>);
          <%
          for(int i = 0; i < length ;i++){
          %>
            data[<%=i%>]=<%=roleMenuIdList.get(i)%>
          <%   
          }
          %>
          var j= data.length;
          while(j--){
             document.getElementById(data[j]).checked = true ;
          }
       }
    </script>
  </head>
  
  <body leftmargin="8" topmargin="8" background='${ctx}/iframe/skin/images/allbg.gif' onload="javascript:init();">
  	<form action="${ctx }/role/setRoleMenu.html" method="post">
  	<input type="hidden" name="id" value="${role.id }"/>
	<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7">
			<td height="24" colspan="5" background="${ctx}/iframe/skin/images/tbg.gif">&nbsp;给<font color="red">${role.roleName }</font>设置菜单权限&nbsp;</td>
		</tr>
		<!--
	    <c:forEach var="ms" items="${menuSys}">
	    <tr>
	    	<td>+ ---- <input type="checkbox" id="${ms.id }" value="${ms.id }" name="menuIdArr" />&nbsp;&nbsp;${ms.name }</td>
	    </tr>
		    <c:forEach var="sunm" items="${ms.sunMenu}">
		    <tr>
		    	<td>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| <input type="checkbox" id="${sunm.id }" value="${sunm.id }" name="menuIdArr"/>&nbsp;&nbsp;${sunm.name }</td>
		    </tr>
		    </c:forEach>
	    </c:forEach>
	    -->
	    <%for(Menu menu:menuList){ %>
	    <tr>
	    	<td>+ ---- <input type="checkbox" id="<%=menu.getId() %>" value="<%=menu.getId() %>" name="menuIdArr" />&nbsp;&nbsp;<%=menu.getName() %></td>
	    </tr>
	    	<%for(Menu sunMenu:menu.getSunMenu()){%>
	    	<tr>
		    	<td>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| <input type="checkbox" id="<%=sunMenu.getId() %>" value="<%=sunMenu.getId() %>" name="menuIdArr"/>&nbsp;&nbsp;<%=sunMenu.getName() %><% if(sunMenu.getDesc()!= null && !"".equals(sunMenu.getDesc().trim())){ %><font color="blue">(<%=sunMenu.getDesc() %>)</font><%} %></td>
		    </tr>
	    <%    }
	    }
	    %>
	    <tr>
		    <td>
			    <div style="margin-left: 300px;">
	  				<input type="submit" name="submit" value="提交" style="cursor: pointer;background-color: #F1F8B4;">
	  			</div>
		    </td>
	    </tr>
	</table>
	</form>
  </body>
</html>
