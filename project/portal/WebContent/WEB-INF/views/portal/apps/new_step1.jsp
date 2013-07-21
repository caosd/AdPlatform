<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<ul class="breadcrumb">
		<li><a href="/"><i class="icon-home"></i></a><span
			class="divider">&nbsp;</span></li>
		<li><a href="#">应用管理</a> <span class="divider">&nbsp;</span></li>
		<li><a href="#">创建应用</a><span class="divider-last">&nbsp;</span></li>
	</ul>

	<div class="widget">
		<form method="POST" class="form-horizontal form-wizard" action="/apps/create" enctype="multipart/form-data">
			<div class="widget-header">
				<h5>上传应用</h5>
			</div>
			<div class="widget-content no-padding">
				<div class="navbar steps">
					<div class="navbar-inner">
                        <ul class="row-fluid nav nav-pills">
                            <li class="span3 active"><a href="#tab1" data-toggle="tab"
                                class="step active"> <span class="number">1</span> <span
                                    class="desc"><i class="icon-ok"></i> 分析应用 </span>
                            </a></li>
                            <li class="span3"><a href="#tab2" data-toggle="tab"
                                class="step"> <span class="number">2</span> <span
                                    class="desc"><i class="icon-ok"></i> 修改信息 </span>
                            </a></li>
                            <li class="span3"><a href="#tab3" data-toggle="tab"
                                class="step"> <span class="number">3</span> <span
                                    class="desc"><i class="icon-ok"></i> 下载SDK </span>
                            </a></li>
                            <li class="span3"><a href="#tab4" data-toggle="tab"
                                class="step active"> <span class="number">4</span> <span
                                    class="desc"><i class="icon-ok"></i> 添加成功 </span>
                            </a></li>
                        </ul>
					</div>
				</div>
				<div id="bar" class="progress progress-striped"
					style="margin: 30px 20px;">
					<div class="bar" style="width: 25%;"></div>
				</div>
				<h4 style="margin: 50px 30px 10px 30px;">第一步，上传应用进行应用信息提取</h4>
				<c:if test="${param.packageExisted || param.unpackError || param.emptyFile}">
                <div class="note note-danger" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> 
                    <c:if test="${param.packageExisted}">该包名已经存在。</c:if>
                    <c:if test="${param.unpackError}">无法解析改应用包，请确认是不是合法的android应用。</c:if>
                    <c:if test="${param.emptyFile}">请选择您的应用文件。</c:if>
                </div>
                </c:if>
				<div class="form-row">
					<label class="field-name">应用名称：</label>
					<div class="field">
						<div class="input-prepend input-append">
							<input class="span12" type="text" name="appName" value="" maxlength="20" /> 
							<span class="add-on">不能超过20个字符</span>
						</div>
					</div>
				</div>
				<div class="form-row">
					<label class="field-name" for="password">您的应用：</label>
					<div class="field">
						<input type="file" name="file" id="file">
						<div class="widget" style="width: 248px; margin: 0;">
							<div class="upload-files">
								<div class="uploading-files">
									<div class="uploading">
										<div class="media-type">
											<img src="/img/icon/14x14/light/file.png" alt=""> <span></span>
										</div>
										<div class="action">
											<a href="#" data-toggle="n-tooltip"><img
												src="/img/icon/14x14/light/pause.png" alt=""></a>
										</div>
										<div class="file-info">
											<div class="progress thin progress-striped"
												style="height: 6px; margin-bottom: 0; -webkit-border-radius: 2px; -moz-border-radius: 2px; border-radius: 2px;">
												<div class="bar" style="width: 17%;"></div>
											</div>
										</div>
									</div>
									<div class="uploading-footer">
										<span>文件上传完毕</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-row" style="padding-left: 208px;">
					<button type="submit" class="button button-blue">提取信息</button>
					<div class="progress progress-striped progress-danger" style="display: none;height: 10px;width: 200px; margin-bottom: 0;">
	                    <div style="width: 50%;" class="bar"></div>
	                </div>
				</div>
			</div>
		</form>
	</div>
	<script src="/js/jquery.form.js" charset="utf-8"></script>
	<script>
		
	</script>
</body>