<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
               <a href="#">帐户管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#"><fmt:message key="change_password_title"/></a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	 <div class="widget-title">
	    <h4><i class="icon-reorder"></i><fmt:message key="change_password_title"/></h4>
	    <span class="tools">
	       <a href="javascript:;" class="icon-chevron-down"></a>
	       <a href="javascript:;" class="icon-remove"></a>
	    </span>
	 </div>
	  <div class="widget-body form" style="display: block;">
		<c:if test="${not empty updated}">
		<div class="protip success">
			<strong><fmt:message key="tips"/></strong> <fmt:message key="change_password_success"/>
		</div>
		</c:if>
		<c:if test="${not empty passwordError}">
		<div class="protip warn">
			<strong><fmt:message key="tips"/></strong> <fmt:message key="change_password_failed"/>
		</div>
		</c:if>
	    <!-- BEGIN FORM-->
	    <form:form commandName="pwdForm" method="POST" class="form-horizontal">
	       <div class="control-group">
	          <label class="control-label" for="password"> <fmt:message key="label.origin_password"/> </label>
	          <div class="controls">
					<form:password path="password"/>
					<span class="red">*</span> <br/><form:errors path="password" cssClass="error" />
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="newpassword"> <fmt:message key="label.new_password"/> </label>
	          <div class="controls">
					<form:password path="newpassword"/>
					<span class="red">*</span> <br/><form:errors path="newpassword" cssClass="error" />
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="cfmpassword"> <fmt:message key="label.new_password_again"/> </label>
	          <div class="controls">
					<form:password path="cfmpassword"/>
					<span class="red">*</span> <br/><form:errors path="cfmpassword" cssClass="error" />
	          </div>
	       </div>
	       <div class="form-actions">
	          <button type="submit" class="btn btn-success"><fmt:message key="change_my_password"/></button>
	       </div>
	    </form:form>
	    <!-- END FORM-->
	 </div>
</div>
 </body>