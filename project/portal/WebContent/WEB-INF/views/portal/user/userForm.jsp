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
               <a href="#">用户管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">添加用户</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	 <div class="widget-header">
		<h5>添加用户</h5>
	 </div>
	  <div class="widget-body form" style="display: block;">
	    <c:if test="${success != null}">
            <div class="note ${success ? 'note-success' :'note-danger'}" style="margin: 20px 30px;">
                <button type="button" class="close note-remove">×</button>
                <strong><fmt:message key="tips"/></strong>
                <c:choose>
                	<c:when test="${success}">添加用户成功</c:when>
                	<c:otherwise>添加用户失败</c:otherwise>
                </c:choose>
            </div>
        </c:if>
	    <!-- BEGIN FORM-->
	    <form:form commandName="userForm" action="/accounts/formpage.html" method="POST" class="form-horizontal">
	       <div class="control-group">
	          <label class="control-label" for="userName">用户名:</label>
	          <div class="controls">
	             <form:input path="userName" type="text" class="span6" id="userName"/>
	             <form:errors path="userName" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="password">密码:</label>
	          <div class="controls">
	             <form:password path="password" class="span6" id="password"/>
	             <form:errors path="password" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="confirmPassword">确认密码:</label>
	          <div class="controls">
	             <form:password path="confirmPassword" class="span6" id="confirmPassword"/>
	             <form:errors path="confirmPassword" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="email">E-Mail:</label>
	          <div class="controls">
	             <form:input path="email" type="text" class="span6" id="email"/>
	             <form:errors path="email" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="type">角色:</label>
	          <div class="controls">
	             <form:select path="type" id="type" class="span6 " data-placeholder="角色:" tabindex="1">
                    <c:forEach items="${roleList}" var="item" varStatus="stat">
                    	<option value="${item.id}">${item.roleName}</option>
                    </c:forEach>
                 </form:select>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="contactName">联系人:</label>
	          <div class="controls">
	             <form:input path="contactName" type="text" class="span6" id="contactName"/>
	             <form:errors path="contactName" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="contactTel">联系电话:</label>
	          <div class="controls">
	             <form:input path="contactTel" type="text" class="span6" id="contactTel"/>
	             <form:errors path="contactTel" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="website">website:</label>
	          <div class="controls">
	             <form:input path="website" type="text" class="span6" id="website"/>
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