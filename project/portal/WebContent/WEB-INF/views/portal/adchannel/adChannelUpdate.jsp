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
		<li><a href="#">广告渠道管理</a> <span class="divider">&nbsp;</span></li>
		<li><a href="#">修改广告渠道</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<form:form commandName="adChannelForm" method="POST" class="form-horizontal form-wizard">
			<div class="widget-header">
				<h5>修改广告渠道</h5>
			</div>
			<div class="widget-content no-padding">
				<c:if test="${success != null}">
                <div class="note ${success ? 'note-success' :'note-danger'}" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> 
                    <c:choose>
                    	<c:when test="${success}">
                    		修改渠道成功。
                    	</c:when>
                    	<c:otherwise>
                    		修改渠道失败。
                    	</c:otherwise>
                    </c:choose>
                </div>
                </c:if>
                <div class="form-row">
					<label class="field-name" for="id">渠道编号：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="id" class="span12"  maxlength="20" value="${adChannel.id }" disabled="true"/> 
						</div>
						<form:errors path="id" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="channelName">渠道名称：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="channelName" class="span12"  maxlength="20" value="${adChannel.channelName }"/> 
							<span class="add-on">不能超过20个字符</span>
						</div>
						<form:errors path="channelName" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="contactName">联系人：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="contactName" class="span12" maxlength="20" value="${adChannel.contactName }"/> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="contactName" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="contactTel">联系电话：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="contactTel" class="span12" maxlength="20" value="${adChannel.contactTel }"/> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="contactTel" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="qq">QQ：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="qq" class="span12" maxlength="20" value="${adChannel.qq }"/> 
							<span class="add-on"></span>
						</div>
						<form:errors path="qq" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for=description>渠道描述：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<textarea name="description" id="description" class="span12" rows="4" cols="50">${adChannel.description }</textarea>
						</div>
						<form:errors path="description" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="enable">是否启用：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<input type="checkbox" name="enable" class="span12" ${adChannel.enable?'checked="checked"':'' } value="1"/>
						</div>
					</div>
				</div>
				<div class="form-row" style="padding-left: 180px;">
					<button type="submit" class="button button-blue">添加渠道</button>
				</div>
			</div>
		</form:form>
	</div>
</body>