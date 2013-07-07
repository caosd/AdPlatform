<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/config.jsp"%>
<body>
    <ul class="breadcrumb">
        <li><a href="/"><i class="icon-home"></i></a><span
            class="divider">&nbsp;</span></li>
        <li><a href="#">应用管理</a> <span class="divider">&nbsp;</span></li>
        <li><a href="#">创建应用</a><span class="divider-last">&nbsp;</span></li>
    </ul>

    <div class="widget">
        <form method="POST" class="form-horizontal form-wizard" action="/apps/${app.key }/upload_app">
            <div class="widget-header">
                <h5>上传应用</h5>
            </div>
            <div class="widget-content no-padding">
                <div class="navbar steps">
                    <div class="navbar-inner">
                        <ul class="row-fluid nav nav-pills">
                            <li class="span2 active"><a href="#tab1" data-toggle="tab"
                                class="step active"> <span class="number">1</span> <span
                                    class="desc"><i class="icon-ok"></i> 分析应用 </span>
                            </a></li>
                            <li class="span2 active"><a href="#tab2" data-toggle="tab"
                                class="step active"> <span class="number">2</span> <span
                                    class="desc"><i class="icon-ok"></i> 修改信息 </span>
                            </a></li>
                            <li class="span2 active"><a href="#tab3" data-toggle="tab"
                                class="step active"> <span class="number">3</span> <span
                                    class="desc"><i class="icon-ok"></i> 下载SDK </span>
                            </a></li>
                            <li class="span2 active"><a href="#tab4" data-toggle="tab"
                                class="step active"> <span class="number">4</span> <span
                                    class="desc"><i class="icon-ok"></i> 上传应用 </span>
                            </a></li>
                            <li class="span2 active"><a href="#tab4" data-toggle="tab"
                                class="step active"> <span class="number">5</span> <span
                                    class="desc"><i class="icon-ok"></i> 添加成功 </span>
                            </a></li>
                        </ul>
                    </div>
                </div>
                <div id="bar" class="progress progress-striped"
                    style="margin: 30px 20px;">
                    <div class="bar" style="width: 100%;"></div>
                </div>
                <h4 style="margin: 50px 30px 10px 30px;">添加成功</h4>
                <c:if test="${param.success}">
                <div class="note note-success" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> 应用创建成功。
                </div>
                </c:if>
                <div class="form-row">
                    <label class="field-name">应用名称：</label>
                    <div class="field">
                        <input class="span12" type="text" value="${app.name }" disabled="disabled"/> 
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name">应用Key：</label>
                    <div class="field">
                        <input class="span12" type="text" value="${app.key }" disabled="disabled"/> 
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name">应用Icon：</label>
                    <div class="field">
                        <img width="65" src='${imgServer }${iconDir}${fn:replace(app.icon, "#", "%23")}'/> 
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>