<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/config.jsp"%>
<head>
<style type="text/css">
.navbar .span2{width:14%;}
.input-append input{width: 235px;}
select{width:250px;}
textarea {width:600px;}
.add-on{color: red;}
</style>
</head>
<body>
	<ul class="breadcrumb">
		<li><a href="/"><i class="icon-home"></i></a><span
			class="divider">&nbsp;</span></li>
		<li><a href="#">资源管理</a> <span class="divider">&nbsp;</span></li>
		<li><a href="#">修改资源信息</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<form:form commandName="adResourceForm" method="POST" class="form-horizontal form-wizard" enctype="multipart/form-data">
			<div class="widget-header">
				<h5>修改资源信息</h5>
			</div>
			<c:if test="${success != null}">
                <div class="note ${success ? 'note-success' :'note-danger'}" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> 
                    <c:choose>
                    	<c:when test="${success}">
                    		修改资源信息成功。
                    	</c:when>
                    	<c:otherwise>
                    		修改资源信息失败。
                    	</c:otherwise>
                    </c:choose>
                </div>
            </c:if>
			<div class="widget-content no-padding">
				<div class="form-row">
					<label class="field-name" for="channelId">选择渠道：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:select path="channelId" class="chosen">
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
							<form:hidden path="id" value="${adResource.id}"/> 
							<form:input path="adName" maxlength="50" value="${adResource.adName}"/> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="adName" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="adTitle">投放标题：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="adTitle" maxlength="100" value="${adResource.adTitle}"/> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="adTitle" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="adIconFile">Icon图片：</label>
					<div class="field">
						<img width="50px" src="${imgServer}${adResource.adIcon}"/>
						<input type="file" name="adIconFile" id="file">
						<form:errors path="adIconFile" cssClass="error"/>
					</div>
				</div>
			    <div class="form-row">
					<label class="field-name" for="adBannerFile">Banner图片：</label>
					<div class="field">
						<img width="20px" src="${imgServer}${adResource.adBanner}"/>
						<input type="file" name="adBannerFile" id="file">
						<form:errors path="adBannerFile" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="desktopIconFile">桌面快捷方式图片：</label>
					<div class="field">
						<img width="50px" src="${imgServer}${adResource.desktopIcon}"/>
						<input type="file" name="desktopIconFile" id="file">
						<form:errors path="desktopIconFile" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name">广告截图(4个)：</label>
					<div class="field">
						<c:forEach items="${adResource.adImagesList}" var="iconStr" varStatus="status">
							<c:if test="${status.index % 2 == 0}">
								<p/>
							</c:if>
							<img width="250px" src="${imgServer}${iconStr}"/>
						</c:forEach>
					</div>
					<div class="field">
						<input type="file" name="adImagea" id="file"/>
						<input type="file" name="adImageb" id="file"/><br/><br/>
						<input type="file" name="adImagec" id="file"/>
						<input type="file" name="adImaged" id="file"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="adPackage">应用包名：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="adPackage" maxlength="50" value="${adResource.adPackage}"/> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="adPackage" cssClass="error"/>
					</div>
				</div>
		        <div class="form-row">
					<label class="field-name" for="fileSize">应用大小：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="fileSize" maxlength="50" value="${adResource.fileSize}"/> 
							<span class="add-on">* 单位（MB）</span>
						</div>
						<form:errors path="fileSize" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="version">应用版本：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="version" maxlength="50" value="${adResource.version}"/> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="version" cssClass="error"/>
					</div>
				</div>
			    <div class="form-row">
					<label class="field-name" for="supportPlatform">平台版本要求：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="supportPlatform" maxlength="3000" value="${adResource.supportPlatform}"/> 
							<span class="add-on">*</span>
						</div>
						<form:errors path="supportPlatform" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="appTypeId">应用分类：</label>
					<div class="field">
						<form:select path="appTypeId" data-placeholder="请选择一个分类" class="chosen" tabindex="-1">
                        <c:forEach var="appType" items="${appTypeList }">
                            <optgroup label="${appType.typeName }">
                            <c:forEach var="appType2" items="${appType.sunTypeList }">
                                <option value="${appType2.id }">${appType2.typeName }</option>
                            </c:forEach>
                            </optgroup>
                        </c:forEach>
                        </form:select>
						<form:errors path="appTypeId" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="chargeType">收费类型：</label>
					<div class="field">
						<form:select path="chargeType" class="chosen">
							<option value="0" ${adResource.chargeType==0?'selected':'' }>免费</option>
							<option value="1" ${adResource.chargeType==1?'selected':'' }>收费</option>
						</form:select>
						<form:errors path="chargeType" cssClass="error"/>
					</div>
				</div>
			    <div class="form-row">
					<label class="field-name" for="price">单价：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<form:input path="price" maxlength="20" value="${adResource.price}"/> 
							<span class="add-on">* 单位（元）</span>
						</div>
						<form:errors path="price" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="clearingForm">结算方式：</label>
					<div class="field">
						<form:select path="clearingForm" class="chosen">
							<option value="CPA" ${adResource.clearingForm=="CPA" ? "selected":""}>CPA</option>
							<option value="CPS" ${adResource.clearingForm=="CPS" ? "selected":""}>CPS</option>
						</form:select>
						<form:errors path="clearingForm" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="language">语言：</label>
					<div class="field noSearch">
						<form:select path="language" class="chosen">
							<option value="en" ${adResource.language=="en" ? "selected":""}>英文</option>
							<option value="zh" ${adResource.language=="zh" ? "selected":""}>中文</option>
						</form:select>
						<form:errors path="language" cssClass="error"/>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="displayPosition">显示位置：</label>
					<div class="field noSearch">
						<form:select path="displayPosition" class="chosen">
							<option value="0" ${adResource.displayPosition=="0" ? "selected":""}>横屏</option>
							<option value="1" ${adResource.displayPosition=="1" ? "selected":""}>竖屏</option>
						</form:select>
						<form:errors path="displayPosition" cssClass="error"/>
					</div>
				</div>
			    <div class="form-row">
					<label class="field-name" for="description">资源描述：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<textarea name="description" id="description" rows="5" cols="70" maxlength="3000">${adResource.description}</textarea>
						</div>
						<form:errors path="description" cssClass="error"/>
					</div>
				</div>
				<div class="form-row" style="padding-left: 208px;">
					<button type="submit" class="button button-blue">修改资源</button>
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