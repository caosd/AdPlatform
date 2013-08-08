<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
<div class="row-fluid">
   <div class="span12">
      <h3 class="page-title">
           	添加角色
         <small>表单</small>
      </h3>
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">系统管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">添加角色</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	  <div class="widget-header">
		<h5>添加角色</h5>
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
	    <form:form commandName="roleForm" action="/role/formpage.html" method="POST" class="form-horizontal">
	       <div class="control-group">
	          <label class="control-label" for="roleName">角色名称:</label>
	          <div class="controls">
	             <form:input path="roleName" type="text" class="span6" id="roleName"/>
	             <form:errors path="roleName" cssClass="error"/>
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