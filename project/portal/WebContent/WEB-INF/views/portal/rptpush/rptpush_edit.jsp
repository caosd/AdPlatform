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
		<li><a href="#">广告收入报表</a> <span class="divider">&nbsp;</span></li>
		<li><a href="#">编辑广告收入</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<form:form commandName="rptPushForm" method="POST" class="form-horizontal form-wizard">
			<div class="widget-header">
				<h5>编辑广告收入</h5>
			</div>
			<div class="widget-content no-padding">
				<c:if test="${success != null}">
                <div class="note ${success ? 'note-success' :'note-danger'}" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> 
                    <c:choose>
                    	<c:when test="${success}">
                    		修改广告收入成功。
                    	</c:when>
                    	<c:otherwise>
                    		修改广告收入失败。
                    	</c:otherwise>
                    </c:choose>
                </div>
                </c:if>
				<div class="form-row">
					<label class="field-name" for="adId">广告：</label>
					<div class="field">
					    <form:select path="adId" class="chosen" tabindex="-1">
                        <c:forEach var="adresource" items="${adresourceList }">
                              <option value="${adresource.id }">${adresource.adName }</option>
                        </c:forEach>
                        </form:select>
						<form:errors path="adId" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="idate">日期：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="idate" class="span12"/> 
						</div>
						<form:errors path="idate" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="revenue">收入：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="revenue" class="span12" maxlength="20"/> 
							<span class="add-on">元</span>
						</div>
						<form:errors path="revenue" cssClass="error"/>
					</div>
				</div>
				<div class="form-row" style="padding-left: 180px;">
					<button type="submit" class="button button-blue">保存修改</button>
				</div>
			</div>
		</form:form>
	</div>
</body>