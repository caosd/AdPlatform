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
        <form method="POST" class="form-horizontal form-wizard" action="/apps/create/${app.key}">
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
                            <li class="span3 active "><a href="#tab2" data-toggle="tab"
                                class="step active"> <span class="number">2</span> <span
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
                    <div class="bar" style="width: 50%;"></div>
                </div>
                <h4 style="margin: 50px 30px 10px 30px;">第二步，补充应用信息</h4>
                <c:if test="${appNameEmpty}">
                <div class="note note-danger" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> 应用名称不能为空。
                </div>
                </c:if>
                <c:if test="${appTypeError}">
                <div class="note note-danger" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> 应用类型不能为空。
                </div>
                </c:if>
                <c:if test="${iconError}">
                <div class="note note-danger" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong><fmt:message key="tips"/></strong> 应用图片不存在。
                </div>
                </c:if>
                <div class="form-row">
                    <label class="field-name">应用名称：</label>
                    <div class="field">
                        <div class="input-prepend input-append">
                            <input class="span12" type="text" name="appName" value="${app.name }" maxlength="20" /> 
                            <span class="add-on">不能超过20个字符</span>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name">应用包名：</label>
                    <div class="field">
                        <input class="span12" type="text" name="packagename" value="${app.pkg }" readonly="readonly" /> 
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name">应用类型：</label>
                    <div class="field">
	                    <select name="type" data-placeholder="请选择一个分类" class="chosen span6" tabindex="-1">
	                        <option value="">请选择一个分类</option>
	                    <c:forEach var="appType" items="${appTypeList }">
	                        <optgroup label="${appType.typeName }">
	                        <c:forEach var="appType2" items="${appType.sunTypeList }">
	                            <option value="${appType2.id }">${appType2.typeName }</option>
	                        </c:forEach>
	                        </optgroup>
	                    </c:forEach>
	                    </select>
                    </div>
                </div>
                <div class="form-row">
                    <label class="field-name" for="password">应用图标：</label>
                    <div class="field">
                        <ul class="thumbnails" style="margin-bottom: 0;">
                        <%-- <c:forEach items="${icons}" var="icon">
                            <li class="span3">
                                <div class="thumbnail well" style="background-color: #F1F1F1">
                                    <img src="${imgServer }${icon }" />
	                                <div class="caption">
	                                    <p style="text-align:center;">${fn:replace(fn:split(icon, "/")[fn:length(fn:split(icon, "/"))-1], "%23", "/") }</p>
	                                    <p style="text-align:center;">
	                                        <button type="button" class="button button-turquoise thumbnail-choose">选&nbsp;&nbsp;&nbsp;&nbsp;择</button>
	                                        <input type="radio" name="appIcon" value="${icon }" style="display: none;" />
	                                    </p>
	                                </div>
                                </div>
                            </li>
                        </c:forEach> --%>
                        <li class="span3">
                            <div class="thumbnail well" style="background-color: #F1F1F1">
                                <img src="${imgServer }${icon }" width="60" />
                                <div class="caption">
                                    <p style="text-align:center;">${fn:replace(fn:split(icon, "/")[fn:length(fn:split(icon, "/"))-1], "%23", "/") }</p>
                                    <input type="radio" name="appIcon" value="${icon }" checked="checked" style="display: none;" />
                                </div>
                            </div>
                        </li>
                        </ul>
                    </div>
                </div>
                <div class="form-row" style="padding-left: 208px;">
                    <button type="submit" class="button button-blue">提交信息</button>
                </div>
            </div>
        </form>
    </div>

    <script>
    (function() {
      /* $(".thumbnail-choose").click(function() {
    	$(".thumbnail").css({'border': 'none', 'background': 'none'});
    	$(this).next().find("input[name=appIcon]").attr("checked", "checked");
    	$(this).parent().parent().parent('.thumbnail').css({'background': '#B3D9F7'});
      });
      $("form").submit(function() {
        if ($("input[name=appIcon]:checked").length == 1) {
          return true;
        } else {
        	$(".thumbnail").css({border: '1px solid #FFF400'});
        }
        return false;
      }); */
    })();
    </script>
</body>