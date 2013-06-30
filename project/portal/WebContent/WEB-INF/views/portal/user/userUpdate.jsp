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
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">用户管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">编辑用户</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	 <div class="widget-title">
	    <h4><i class="icon-reorder"></i>编辑用户</h4>
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
	    <form:form commandName="userForm" method="POST" class="form-horizontal">
	       <div class="control-group">
	          <label class="control-label" for="userName">用户名:</label>
	          <div class="controls">
	          	 <form:hidden path="uid" id="uid" value="${user.uid}"/>
	             <form:input path="userName" type="text" class="span6" id="userName" value="${user.userName}"/>
	             <form:errors path="userName" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="company">公司名称:</label>
	          <div class="controls">
	             <form:input path="company" type="text" class="span6" id="company" value="${user.company }"/>
	             <form:errors path="company" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="roleId">角色:</label>
	          <div class="controls">
	             <form:select path="type" id="roleId" class="span6 " data-placeholder="角色:" tabindex="1">
                    <c:forEach items="${roleList}" var="item" varStatus="stat">
                    	<option value="${item.id}" ${user.type == item.id ? "selected=\"selected\"":"" }>${item.roleName}</option>
                    </c:forEach>
                 </form:select>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="contactName">contactName:</label>
	          <div class="controls">
	             <form:input path="contactName" type="text" class="span6" id="contactName" value="${user.contactName}"/>
	             <form:errors path="contactName" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="contactTel">contactTel:</label>
	          <div class="controls">
	             <form:input path="contactTel" type="text" class="span6" id="contactTel" value="${user.contactTel}"/>
	             <form:errors path="contactTel" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="website">网址:</label>
	          <div class="controls">
	             <form:input path="website" type="text" class="span6" id="website" value="${user.website}"/>
	             <form:errors path="website" cssClass="error"/>
	          </div>
	       </div>
	       <div class="form-actions">
	          <button type="submit" class="btn btn-success">保存</button>
	          <button type="button" class="btn">取消</button>
	       </div>
	    </form:form>
	    <!-- END FORM-->
	 </div>
</div>
 </body>