<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<div class="row-fluid">
   <div class="span12">
       <!-- END THEME CUSTOMIZER-->
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">帐户管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#"><fmt:message key="change_email_title"/></a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	 <div class="widget-header">
		<h5><fmt:message key="change_email_title"/></h5>
	 </div>
	  <div class="widget-body form" style="display: block;">
		<c:if test="${not empty updated}">
		<div class="protip success">
			<strong><fmt:message key="tips"/></strong> <fmt:message key="change_email_success"/>
		</div>
		</c:if>
		<c:if test="${not empty error}">
		<div class="protip warn">
			<strong><fmt:message key="tips"/></strong> <fmt:message key="change_email_failed"/>
		</div>
		</c:if>
	    <!-- BEGIN FORM-->
	    <form:form commandName="emailForm" method="POST" class="form-horizontal">
	       <div class="control-group">
	          <label class="control-label" for="email"> <fmt:message key="label.new_email_address"/> </label>
	          <div class="controls">
	               <form:input path="email"/>
				   <span class="red">*</span> <br/><form:errors path="email" cssClass="error" />
	          </div>
	       </div>
	       <div class="form-actions">
	          <button type="submit" class="btn btn-success"><fmt:message key="change_your_email_address"/></button>
	       </div>
	    </form:form>
	    <!-- END FORM-->
	 </div>
</div>
 </body>