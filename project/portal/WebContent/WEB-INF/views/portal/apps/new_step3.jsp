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
        <form method="POST" class="form-horizontal form-wizard">
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
                            <li class="span3 active"><a href="#tab2" data-toggle="tab"
                                class="step active"> <span class="number">2</span> <span
                                    class="desc"><i class="icon-ok"></i> 修改信息 </span>
                            </a></li>
                            <li class="span3 active"><a href="#tab3" data-toggle="tab"
                                class="step active"> <span class="number">3</span> <span
                                    class="desc"><i class="icon-ok"></i> 下载SDK </span>
                            </a></li>
                            <li class="span3"><a href="#tab4" data-toggle="tab"
                                class="step"> <span class="number">4</span> <span
                                    class="desc"><i class="icon-ok"></i> 添加成功 </span>
                            </a></li>
                        </ul>
                    </div>
                </div>
                <div id="bar" class="progress progress-striped"
                    style="margin: 30px 20px;">
                    <div class="bar" style="width: 75%;"></div>
                </div>
                <h4 style="margin: 50px 30px 10px 30px;">第三步，获取广告SDK并集成到应用里</h4>
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
                    <label class="field-name">应用Key：</label>
                    <div class="field">
                        <input class="span12" type="text" value="${app.key }" readonly="readonly"/> 
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name" for="password">SDK下载：</label>
                    <div class="field">
                        <a class="button button-turquoise" href="/apps/${app.key}/build_sdk">自动生成</a>
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name">推送广告：</label>
                    <div class="field">
                        <input type="checkbox" name="allowPush" class="toggle" value="true"/>
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name">富媒体广告：</label>
                    <div class="field">
                        <input type="checkbox" name="allowRichPush" class="toggle" value="true"/>
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name">LBS线下广告：</label>
                    <div class="field">
                        <input type="checkbox" name="allowLBS" class="toggle" value="true"/>
                    </div>
                </div>
                <div class="form-row" style="padding-left: 208px;">
                    <button type="submit" class="button button-blue">开通业务</button>
                </div>
            </div>
        </form>
    </div>
</body>