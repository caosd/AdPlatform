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
		<li><a href="#">修改厂商</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<form:form commandName="companyForm" method="POST" class="form-horizontal form-wizard">
			<div class="widget-header">
				<h5>修改厂商信息</h5>
			</div>
			<div class="widget-content no-padding">
				<c:if test="${success != null}">
                <div class="note ${success ? 'note-success' :'note-danger'}" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> 
                    <c:choose>
                    	<c:when test="${success}">
                    		修改厂商成功。
                    	</c:when>
                    	<c:otherwise>
                    		添加厂商失败。
                    	</c:otherwise>
                    </c:choose>
                </div>
                </c:if>
				<div class="form-row">
					<label class="field-name" for="name">厂商名称：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="name" class="span12"  maxlength="50" value="${company.name}"/> 
							<span class="add-on">不能超过50个字符</span>
						</div>
						<form:errors path="name" cssClass="error"/>
					</div>
				</div>
			    <div class="form-row">
					<label class="field-name" for=description>厂商介绍：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<textarea name="description" id="description" class="span12" cols="60" rows="6">${company.description }</textarea>
						</div>
						<form:errors path="description" cssClass="error"/>
					</div>
				</div>
				<div class="form-row" style="padding-left: 180px;">
					<button type="submit" class="button button-blue"> 保存 </button>
				</div>
			</div>
		</form:form>
	</div>
</body>