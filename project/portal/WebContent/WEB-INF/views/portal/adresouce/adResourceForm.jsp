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
		<li><a href="#">资源管理</a> <span class="divider">&nbsp;</span></li>
		<li><a href="#">资源录入</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<form:form path="adResourceForm" method="POST" class="form-horizontal form-wizard" enctype="multipart/form-data">
			<div class="widget-header">
				<h5>资源录入</h5>
			</div>
			<div class="widget-content no-padding">
				<div class="form-row">
					<label class="field-name">应用名称：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<input class="span12" type="text" name="appName" value="${appName }" maxlength="20" /> 
							<span class="add-on">不能超过20个字符</span>
						</div>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="password">您的应用：</label>
					<div class="field">
						<input type="file" name="file" id="file">
					</div>
				</div>
				<div class="form-row" style="padding-left: 180px;">
					<button type="submit" class="button button-blue">上传应用</button>
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