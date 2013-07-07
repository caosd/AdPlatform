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
               <a href="#">资源管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">资源录入</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	 <div class="widget-header">
		<h5>资源录入</h5>
	 </div>
	  <div class="widget-body form" style="display: block;">
	  	<c:if test="${content != null}">
		  	<div class="alert alert-success">
		         <strong>${content}</strong>
		    </div>
	    </c:if>
	    <!-- BEGIN FORM-->
	    <form:form commandName="adResourceForm" method="POST" class="form-horizontal">
	       <div class="control-group">
	          <label class="control-label" for="adName"> 资源名称 </label>
	          <div class="controls">
	             <form:input path="adName" type="text" class="span6"/>
	             <SPAN class="red">*</SPAN><br><form:errors path="adName" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="adType"> 广告类型 </label>
	          <div class="controls">
	             <form:select path="adType" class="span6">
	             	<form:option value="0" selected="selected">热门</form:option>
	             	<form:option value="1">应用</form:option>
	             	<form:option value="2">游戏</form:option>
	             </form:select>
	             <SPAN class="red">*</SPAN><br><form:errors path="adType" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="adText"> 广告语 </label>
	          <div class="controls">
	             <form:textarea path="adText" class="span6" />
	             <SPAN class="red">*</SPAN><br><form:errors path="adText" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
              <label class="control-label" for="adIconFile"> 广告图标 </label>
              <div class="controls">
                 <input type="file" name='adIconFile' class="span6"/>
                 <SPAN class="red">*</SPAN><br><form:errors path="adIconFile" cssClass="error"/>
              </div>
           </div>
	       <div class="control-group">
              <label class="control-label" for="adPoint"> 广告积分 </label>
              <div class="controls">
                 <form:input path="adPoint" class="span6"/>
                 <SPAN class="red">*</SPAN><br><form:errors path="adPoint" cssClass="error"/>
              </div>
           </div>
	       <div class="control-group">
	          <label class="control-label" for="startTime"> 有效时间 </label>
	          <div class="controls">
	             <form:input path="startTime" class="span3" /> - <form:input path="endTime" class="span3" />
	             <SPAN class="red">*不填，默认有效时间为一个月，开始日期为系统当前日期</SPAN><br>
	             <form:errors path="startTime" cssClass="error"/>
	             <form:errors path="endTime" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
              <label class="control-label" for="adPackage"> 应用包名 </label>
              <div class="controls">
                 <form:input path="adPackage" class="span6"/>
                 <SPAN class="red">*</SPAN><br><form:errors path="adPackage" cssClass="error"/>
              </div>
           </div>
           <div class="control-group">
              <label class="control-label" for="adPackageFile"> 应用包 </label>
              <div class="controls">
                 <form:input path="adPackageFile" class="span6"/>
                 <SPAN class="red">*</SPAN><br><form:errors path="adPackageFile" cssClass="error"/>
              </div>
           </div>
     	   <div class="control-group">
              <label class="control-label" for="version"> 应用版本 </label>
              <div class="controls">
                 <form:input path="version" class="span6"/>
                 <SPAN class="red">*</SPAN><br><form:errors path="version" cssClass="error"/>
              </div>
           </div>
           <div class="control-group">
              <label class="control-label" for="description"> 应用描述 </label>
              <div class="controls">
                 <form:input path="description" class="span6"/>
                 <SPAN class="red">*</SPAN><br><form:errors path="description" cssClass="error"/>
              </div>
           </div>
           <div class="control-group">
              <label class="control-label" for="adImagea"> 应用图片 </label>
              <div class="controls">
                 <input type="file" name='adImagea' class="span6"/><br/>
			  	 <input type="file" name='adImageb' class="span6"/><br/>
			  	 <input type="file" name='adImagec' class="span6"/><br/>
			  	 <input type="file" name='adImaged' class="span6"/><br/>
              </div>
           </div>
	       <div class="form-actions">
	          <button type="submit" class="btn btn-success">Save</button>
	          <button type="reset" class="btn">Reset</button>
	       </div>
	    </form:form>
	    <!-- END FORM-->
	 </div>
</div>
 </body>
