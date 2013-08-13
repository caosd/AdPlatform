<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head><style type="text/css">.navbar .span2{width:14%;}</style></head>
<body>
	<ul class="breadcrumb">
		<li><a href="/"><i class="icon-home"></i></a><span
			class="divider">&nbsp;</span></li>
		<li><a href="#">开发者应用</a> <span class="divider">&nbsp;</span></li>
		<li><a href="/apps/">应用列表</a><span class="divider">&nbsp;</span></li>
		<li><a href="#">编辑应用</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<form:form commandName="appForm" method="POST" class="form-horizontal form-wizard">
			<div class="widget-header">
				<h5>编辑应用</h5>
			</div>
			<div class="widget-content no-padding">
				<c:if test="${success != null}">
                <div class="note ${success ? 'note-success' :'note-danger'}" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> 
                    <c:choose>
                    	<c:when test="${success}">
                    		修改应用成功。
                    	</c:when>
                    	<c:otherwise>
                    		未知操作。
                    	</c:otherwise>
                    </c:choose>
                </div>
                </c:if>
                <div class="form-row">
                    <label class="field-name" for="name">应用名称：</label>
                    <div class="field">
                        <div class="input-prepend input-append">
                        <form:input path="name" class="span12" value="${app.name }" maxlength="25"/>
							<span class="add-on">不能超过25个字符</span>
						</div>
						<form:errors path="name" cssClass="error"/>
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name" for="key">应用Key：</label>
                    <div class="field">
                       <input class="span12" id="key" size="30" type="text" value="${app.key }" readonly="readonly"/> 
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name">推送广告：</label>
                    <div class="field">
                        <input type="checkbox" name="allowPush" class="toggle" ${appBusiness.allowPush ?"checked='checked'" :"" } value="true"/>
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name">富媒体广告：</label>
                    <div class="field">
                        <input type="checkbox" name="allowRichPush" class="toggle" ${appBusiness.allowRichPush ?"checked='checked'" :"" } value="true"/>
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name">LBS线下广告：</label>
                    <div class="field">
                        <input type="checkbox" name="allowLBS" class="toggle" ${appBusiness.allowLBS ?"checked='checked'" :"" } value="true"/>
                    </div>
                </div>
				<div class="form-row" style="padding-left: 180px;">
					<button type="submit" class="button button-blue">保存修改</button>
				</div>
			</div>
		</form:form>
	</div>
</body>