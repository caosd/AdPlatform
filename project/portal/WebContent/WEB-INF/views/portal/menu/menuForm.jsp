<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
<div class="row-fluid">
   <div class="span12">
       <!-- BEGIN THEME CUSTOMIZER-->
       <div id="theme-change" class="hidden-phone">
           <i class="icon-cogs"></i>
            <span class="settings">
                <span class="text">Theme:</span>
                <span class="colors">
                    <span class="color-default" data-style="default"></span>
                    <span class="color-gray" data-style="gray"></span>
                    <span class="color-purple" data-style="purple"></span>
                    <span class="color-navy-blue" data-style="navy-blue"></span>
                </span>
            </span>
       </div>
       <!-- END THEME CUSTOMIZER-->
      <h3 class="page-title">
           	添加菜单
         <small>表单</small>
      </h3>
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">系统管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">添加菜单</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	 <div class="widget-title">
	    <h4><i class="icon-reorder"></i>添加菜单</h4>
	    <span class="tools">
	       <a href="javascript:;" class="icon-chevron-down"></a>
	       <a href="javascript:;" class="icon-remove"></a>
	    </span>
	 </div>
	  <div class="widget-body form" style="display: block;">
	  	<div class="alert alert-success">
	         <strong>${content}</strong>
	    </div>
	    <!-- BEGIN FORM-->
	    <form:form commandName="menuForm" action="/menu/formpage.html" method="POST" class="form-horizontal">
	       <div class="control-group">
	          <label class="control-label" for="name">菜单名称:</label>
	          <div class="controls">
	             <form:input path="name" type="text" class="span6" id="name"/>
	             <span class="help-inline">*必须项</span>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="desc">菜单描述:</label>
	          <div class="controls">
	             <form:input path="desc" type="text" class="span6" id="desc"/>
	             <span class="help-inline">*必须项</span>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="path">菜单路径:</label>
	          <div class="controls">
	             <form:input path="path" type="text" class="span6" id="path"/>
	             <span class="help-inline">*必须项</span>
	          </div>
	       </div>
	       <div class="control-group">
              <label class="control-label" for="">父级菜单:</label>
              <div class="controls">
                 <form:select path="parent" id="parent" class="span6 " data-placeholder="父级菜单:" tabindex="1">
                    <option value="0">Select...</option>
                    <c:forEach items="${parentMenus}" var="item" varStatus="stat">
                    	<option value="${item.id}">${item.name}</option>
                    </c:forEach>
                 </form:select>
              </div>
           </div>
	       <div class="control-group">
              <label class="control-label">是否可见:</label>
              <div class="controls">
                 <form:checkbox path="visible" value="1"/>
              </div>
           </div>
	       <div class="control-group">
	          <label class="control-label" for="orderNo">排序标识:</label>
	          <div class="controls">
	             <form:input path="orderNo" type="text" class="span6" id="orderNo" value="0"/>
	             <span class="help-inline"></span>
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
