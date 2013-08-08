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
		<li><a href="#">广告控制管理</a> <span class="divider">&nbsp;</span></li>
		<li><a href="#">编辑广告推送控制</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<form:form commandName="adPushForm" method="POST" class="form-horizontal form-wizard">
			<div class="widget-header">
				<h5>编辑广告推送控制</h5>
			</div>
			<div class="widget-content no-padding">
				<c:if test="${success != null}">
                <div class="note ${success ? 'note-success' :'note-danger'}" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> 
                    <c:choose>
                    	<c:when test="${success}">
                    		修改广告推送控制成功。
                    	</c:when>
                    	<c:otherwise>
                    		修改广告推送控制失败。
                    	</c:otherwise>
                    </c:choose>
                </div>
                </c:if>
				<div class="form-row">
					<label class="field-name" for="firstPush">是否首推：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:checkbox path="firstPush" class="span12"/>
						</div>
						<form:errors path="firstPush" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="maxPush">设置最大推送量：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="maxPush" class="span12"/> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="maxPush" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="status">开通/关闭该业务：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:checkbox path="status" class="span12"/>
						</div>
						<form:errors path="status" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="money">设置实际收入：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="money" class="span12" maxlength="20"/> 
							<span class="add-on"></span>
						</div>
						<form:errors path="money" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="pushDateStr">推送日期：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="pushDateStr" class="span12"/> 
							<span class="add-on"></span>
						</div>
						<form:errors path="pushDateStr" cssClass="error"/>
					</div>
				</div>
				<div class="form-row" style="padding-left: 180px;">
					<button type="submit" class="button button-blue">保存修改</button>
				</div>
			</div>
		</form:form>
	</div>
</body>