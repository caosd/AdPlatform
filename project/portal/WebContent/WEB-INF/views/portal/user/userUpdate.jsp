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
           <li><a href="#">编辑用户</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	  <div class="widget-header">
		  <h5>编辑用户</h5>
	  </div>
	  <div class="widget-body form" style="display: block;">
	  	<c:if test="${success != null}">
            <div class="note ${success ? 'note-success' :'note-danger'}" style="margin: 20px 30px;">
                <button type="button" class="close note-remove">×</button>
                <strong><fmt:message key="tips"/></strong>
                <c:choose>
                	<c:when test="${success}">编辑用户成功</c:when>
                	<c:otherwise>编辑用户失败</c:otherwise>
                </c:choose>
            </div>
        </c:if>
	    <!-- BEGIN FORM-->
	    <form:form commandName="profileForm" method="POST" class="form-horizontal">
	       <div class="control-group">
	          <label class="control-label" for="userName">用户名:</label>
	          <div class="controls">
	          	 <form:hidden path="uid" id="uid" value="${editUser.uid}"/>
	             ${editUser.userName}
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="company">公司名称:</label>
	          <div class="controls">
	             <form:input path="company" type="text" class="span6" id="company" value="${editUser.company }"/>
	             <form:errors path="company" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="type">角色:</label>
	          <div class="controls">
	             <form:select path="type" class="span6 " data-placeholder="角色:" tabindex="1">
                    <c:forEach items="${roleList}" var="item" varStatus="stat">
                    	<option value="${item.id}" ${editUser.type == item.id ? "selected=\"selected\"":"" }>${item.roleName}</option>
                    </c:forEach>
                 </form:select>
                 <form:errors path="type" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="contactName">联系人:</label>
	          <div class="controls">
	             <form:input path="contactName" type="text" class="span6" id="contactName" value="${editUser.contactName}"/>
	             <form:errors path="contactName" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="contactTel">联系电话:</label>
	          <div class="controls">
	             <form:input path="contactTel" type="text" class="span6" id="contactTel" value="${editUser.contactTel}"/>
	             <form:errors path="contactTel" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="website">网址:</label>
	          <div class="controls">
	             <form:input path="website" type="text" class="span6" id="website" value="${editUser.website}"/>
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