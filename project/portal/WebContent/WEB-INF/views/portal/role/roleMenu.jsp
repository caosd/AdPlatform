<%@page import="com.stomato.domain.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
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
    	 try{
         	document.getElementById(data[j]).checked = true ;
    	 }catch(err){
    	 }
      }
   }
</script>
<div class="row-fluid">
   <div class="span12">
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">系统管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">修改角色权限</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	 <div class="widget-header">
		<h5>修改<font color="red">${role.roleName }</font>权限</h5>
	 </div>
	  <div class="widget-body form" style="display: block;">
	  	<c:if test="${content != null}">
            <div class="note note-danger" style="margin: 20px 30px;">
                <button type="button" class="close note-remove">×</button>
                <strong><fmt:message key="tips"/></strong> 
                ${content}
            </div>
        </c:if>
	    <!-- BEGIN FORM-->
	    <form id="roleMenuForm" method="POST" class="form-horizontal">
	    	<input type="hidden" name="id" value="${role.id}"/>
			    <ul>
			    <%for(Menu menu:menuList){ %>
			    	<li><input type="checkbox" id="<%=menu.getId() %>" value="<%=menu.getId() %>" name="menuIdArr" />&nbsp;&nbsp;<%=menu.getName() %>
			    	</li>
			    	<ul>
				    	<%for(Menu sunMenu:menu.getSunMenu()){%>
				    	<li>
					    	<input type="checkbox" parent="<%=sunMenu.getParent() %>" id="<%=sunMenu.getId() %>" value="<%=sunMenu.getId() %>" name="menuIdArr"/>&nbsp;&nbsp;<%=sunMenu.getName() %><% if(sunMenu.getDesc()!= null && !"".equals(sunMenu.getDesc().trim())){ %><font color="blue">(<%=sunMenu.getDesc() %>)</font><%} %>
					    </li>
				    <%    }%>
			    	</ul>
			    <%
			    }
			    %>
			    <ul>
	       <div class="form-actions">
	          <button type="submit" class="btn btn-success">Save</button>
	          <button type="button" class="btn">Cancel</button>
	       </div>
	    </form>
	    <!-- END FORM-->
	 </div>
</div>
<script>
/*
 *初始化多选框 
 */
init();
</script>
 </body>
 
