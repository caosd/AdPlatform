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
        <form method="POST" class="form-horizontal form-wizard" enctype="multipart/form-data">
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
                            <li class="span2"><a href="#tab4" data-toggle="tab"
                                class="step"> <span class="number">5</span> <span
                                    class="desc"><i class="icon-ok"></i> 添加成功 </span>
                            </a></li>
                        </ul>
                    </div>
                </div>
                <div id="bar" class="progress progress-striped"
                    style="margin: 30px 20px;">
                    <div class="bar" style="width: 80%;"></div>
                </div>
                <h4 style="margin: 50px 30px 10px 30px;">第四步，上传集成了广告SDK后的应用</h4>
                <c:if test="${param.failed}">
                <div class="note note-danger" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> <fmt:message key="app_upload_failed"/>
                </div>
                </c:if>
                <c:if test="${param.success}">
                <div class="note note-success" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> <fmt:message key="app_upload_success"/>
                </div>
                </c:if>
                <div class="form-row">
                    <label class="field-name" for="password">您的应用：</label>
                    <div class="field">
                        <input type="file" name="file" id="file">
                    </div>
                    <div style="padding-top: 8px;"><span style="color:red">*</span><fmt:message key="app_upload_attention"/></div>
                </div>
                <div class="form-row" style="padding-left: 180px;">
                    <button type="submit" class="button button-blue">集成SDK完毕，上传应用</button>
                </div>
            </div>
        </form>
    </div>
    <script>
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
    </script>
</body>