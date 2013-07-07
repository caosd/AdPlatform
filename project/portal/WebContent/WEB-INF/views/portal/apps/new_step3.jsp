<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="new_app_title"/></title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
    <%@include file="../includes/header.jsp"%>
    <div class="inside">
        <div class="container">
            <div id="content">
                <h2>下载嵌入SDK</h2>
                <ul id="steps">
                  <li style="z-index: 6;"><a href="javascript:;" id="step-nav-0" class="active">分析应用</a></li>
                  <li style="z-index: 5;"><a href="javascript:;" id="step-nav-1" class="active">修改信息</a></li>
                  <li style="z-index: 4;"><a href="javascript:;" id="step-nav-2" class="active">下载SDK</a></li>
                  <li style="z-index: 3;"><a href="javascript:;" id="step-nav-3">上传应用</a></li>
                  <li style="z-index: 2;"><a href="javascript:;" id="step-nav-4">添加成功</a></li>
                </ul>
                <form method="GET" class="blueform" action="/apps/${app.key }/upload_app">
                  <ul class="form">
                      <li>
                        <label> 应用Key </label> 
                        <p style="padding-top: 8px;color: #F00;">${app.key }</p>
                      </li>
                      <li>
                        <label> SDK下载 </label> 
                        <div>
                          <a class="btn primary" href="/apps/${app.key}/build_sdk">自动生成</a>
                        </div>
                      </li>
                  </ul>
                  <ul class="form" style="margin-top:30px;">
                      <li>
                          <button type="submit">下一步，上传集成了SDK后的应用</button>
                      </li>
                  </ul>
                </form>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>
