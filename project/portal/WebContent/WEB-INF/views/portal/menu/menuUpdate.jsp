<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
<div class="row-fluid">
   <div class="span12">
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">系统管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">编辑菜单</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
      <div class="widget-header">
		<h5>编辑菜单</h5>
	  </div>
	  <div class="widget-body form" style="display: block;">
	  	<c:if test="${msg != null}">
            <div class="note ${success ? 'note-success' :'note-danger'}" style="margin: 20px 30px;">
                <button type="button" class="close note-remove">×</button>
                <strong><fmt:message key="tips"/></strong> 
                ${msg}
            </div>
        </c:if>
	    <!-- BEGIN FORM-->
	    <form:form commandName="menuForm" action="/menu/editMenu.html?id=${menu.id}" method="POST" class="form-horizontal">
	       <div class="control-group">
	          <label class="control-label" for="name">菜单名称:</label>
	          <div class="controls">
	          	 <form:hidden path="id" class="span6" id="name" value="${menu.id}"/>
	             <form:input path="name" type="text" class="span6" id="name" value="${menu.name}"/>
	             <form:errors path="name" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="desc">菜单描述:</label>
	          <div class="controls">
	             <form:input path="desc" type="text" class="span6" id="desc" value="${menu.desc}"/>
	             <form:errors path="desc" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="path">菜单路径:</label>
	          <div class="controls">
	             <form:input path="path" type="text" class="span6" id="path" value="${menu.path}"/>
	             <form:errors path="path" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
              <label class="control-label" for="parent">父级菜单:</label>
              <div class="controls">
                 <form:select path="parent" id="parent" class="span6 " data-placeholder="父级菜单:" tabindex="1">
                    <option value="0">Select...</option>
                    <c:forEach items="${parentMenus}" var="item" varStatus="stat">
                    	<option value="${item.id}" ${menu.parent == item.id ? "selected=\"selected\"":"" }>${item.name}</option>
                    </c:forEach>
                 </form:select>
              </div>
           </div>
	       <div class="control-group">
              <label class="control-label">是否可见:</label>
              <div class="controls">
              	 <input type="checkbox" name="visible" value="1" ${menu.visible == 1? 'checked=\"checked\"':''}/>
              </div>
           </div>
	       <div class="control-group">
	          <label class="control-label" for="orderNo">排序标识:</label>
	          <div class="controls">
	             <form:input path="orderNo" type="text" class="span6" id="orderNo" value="${menu.orderNo}" />
	             <form:errors path="orderNo" cssClass="error"/>
	          </div>
	       </div>
	       <div class="form-actions">
	          <button type="submit" class="btn btn-success">Save</button>
	          <button type="button" class="btn">Cancel</button>
	       </div>
	    </form:form>
	    <!-- END FORM-->
	 </div>
</div>
 </body>
