<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.stomato.domain.AppType"%>
<head><style type="text/css">.navbar .span2{width:14%;}</style></head>
<body>
	<ul class="breadcrumb">
		<li><a href="/"><i class="icon-home"></i></a><span
			class="divider">&nbsp;</span></li>
		<li><a href="#">资源管理</a> <span class="divider">&nbsp;</span></li>
		<li><a href="#">资源录入</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<form:form commandName="adResourceForm" method="POST" class="form-horizontal form-wizard" enctype="multipart/form-data">
			<div class="widget-header">
				<h5>资源录入</h5>
			</div>
			<c:if test="${success != null}">
                <div class="note note-danger" style="margin: 20px 30px;">
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
			<div class="widget-content no-padding">
				<div class="form-row">
					<label class="field-name" for="channelId">选择渠道：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:select path="channelId" class="span12">
			                    <c:forEach items="${adChannerlList}" var="item" varStatus="stat">
			                    	<option value="${item.id}">${item.channelName}</option>
			                    </c:forEach>
			                 </form:select>
						</div>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="adName">资源名称：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="adName" class="span12" maxlength="20" /> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="adName" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="adTitle">投放标题：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="adTitle" class="span12" maxlength="20" /> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="adTitle" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="adIconFile">Icon图片：</label>
					<div class="field">
						<input type="file" name="adIconFile" id="file">
						<form:errors path="adIconFile" cssClass="error"/>
					</div>
				</div>
			    <div class="form-row">
					<label class="field-name" for="adBannerFile">Banner图片：</label>
					<div class="field">
						<input type="file" name="adBannerFile" id="file">
						<form:errors path="adBannerFile" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="desktopIconFile">桌面快捷方式图片：</label>
					<div class="field">
						<input type="file" name="desktopIconFile" id="file">
						<form:errors path="desktopIconFile" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name">广告截图(4个)：</label>
					<div class="field">
						<input type="file" name="adImagea" id="file">
						<input type="file" name="adImageb" id="file">
						<input type="file" name="adImagec" id="file">
						<input type="file" name="adImaged" id="file">
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="appPackage">应用包名：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="appPackage" class="span12" maxlength="20" /> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="appPackage" cssClass="error"/>
					</div>
				</div>
		        <div class="form-row">
					<label class="field-name" for="fileSize">应用大小MB：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="fileSize" class="span12" maxlength="20" /> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="fileSize" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="version">应用版本：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="version" class="span12" maxlength="20" /> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="version" cssClass="error"/>
					</div>
				</div>
			    <div class="form-row">
					<label class="field-name" for="supportPlatform">平台版本要求：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="supportPlatform" class="span12" maxlength="20" /> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="supportPlatform" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="appTypeId">应用分类：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:select path="appTypeId" class="span12">
								<form:option value="0">请选择..</form:option>
								<%
								List<AppType> appTypeList = (List<AppType>)request.getAttribute("appTypeList");
								for(AppType appType : appTypeList){
									%>
									<form:option value="<%=appType.getId() %>"><%=appType.getTypeName() %></form:option><%
									for(AppType sunAppType : appType.getSunTypeList()){
										%>
										<form:option value="<%=sunAppType.getId() %>">----<%=sunAppType.getTypeName() %></form:option>
										<%
									}
								}
								%>
			                 </form:select>
						</div>
						<form:errors path="appTypeId" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="chargeType">收费类型：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:select path="chargeType" class="span12">
								<form:option value="0">免费</form:option>
								<form:option value="1">收费</form:option>
							</form:select>
						</div>
						<form:errors path="chargeType" cssClass="error"/>
					</div>
				</div>
			    <div class="form-row">
					<label class="field-name" for="price">单价：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="price" class="span12" maxlength="20" /> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="price" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="clearingForm">结算方式：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:select path="clearingForm" class="span12">
								<form:option value="CPA">CPA</form:option>
								<form:option value="CPS">CPS</form:option>
							</form:select>
						</div>
						<form:errors path="clearingForm" cssClass="error"/>
					</div>
				</div>
			    <div class="form-row">
					<label class="field-name" for="description">资源描述：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:textarea path="description" class="span12" rows="5" cols="70"/> 
						</div>
						<form:errors path="description" cssClass="error"/>
					</div>
				</div>
				<div class="form-row" style="padding-left: 180px;">
					<button type="submit" class="button button-blue">添加资源</button>
				</div>
			</div>
		</form:form>
	</div>
    <!-- <script>
    (function() {
      $("form").submit(function() {
        var v = $("#file").val();
        if (v.lastIndexOf(".apk") == v.length - 4) {
            return true;
        } else {
            alert("请选择正确的APK文件");
        }
        return false;
      });
    })();
    </script> -->
</body>