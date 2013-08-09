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
		<li><a href="#">用户渠道管理</a> <span class="divider">&nbsp;</span></li>
		<li><a href="#">添加用户渠道</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<form:form commandName="userChannelForm" method="POST" class="form-horizontal form-wizard">
			<div class="widget-header">
				<h5>添加用户渠道</h5>
			</div>
			<div class="widget-content no-padding">
				<c:if test="${success != null}">
                <div class="note ${success ? 'note-success' :'note-danger'}" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> 
                    <c:choose>
                    	<c:when test="${success}">
                    		添加用户渠道成功。
                    	</c:when>
                    	<c:otherwise>
                    		添加用户渠道失败。
                    	</c:otherwise>
                    </c:choose>
                </div>
                </c:if>
				<div class="form-row">
					<label class="field-name" for="channelNo">渠道编号：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="channelNo" maxlength="20" /> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="channelNo" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="companyId">选择厂商：</label>
					<div class="field">
						<form:select path="companyId" class="chosen">
		                    <c:forEach items="${companyList}" var="item" varStatus="stat">
		                    	<option value="${item.id}">${item.name}</option>
		                    </c:forEach>
		                 </form:select>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="description">渠道描述：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:textarea path="description" class="span12" cols="50" rows="4"/>
						</div>
						<form:errors path="description" cssClass="error"/>
					</div>
				</div>
				<div class="form-row" style="padding-left: 180px;">
					<button type="submit" class="button button-blue">添加渠道</button>
				</div>
			</div>
		</form:form>
	</div>
</body>