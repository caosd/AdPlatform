<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<h2><fmt:message key="new_app_title"/></h2>
                <c:if test="${param.packageExisted}">
                <div class="protip error">
                    <strong><fmt:message key="tips"/></strong> 该包名已经存在。
                </div>
                </c:if>
                <c:if test="${param.unpackError}">
                <div class="protip error">
                    <strong><fmt:message key="tips"/></strong> 无法解析改应用包，请确认是不是合法的android包。
                </div>
                </c:if>
                <ul id="steps">
                  <li style="z-index: 6;"><a href="javascript:;" id="step-nav-0" class="active">分析应用</a></li>
                  <li style="z-index: 5;"><a href="javascript:;" id="step-nav-1">修改信息</a></li>
                  <li style="z-index: 4;"><a href="javascript:;" id="step-nav-2">下载SDK</a></li>
                  <li style="z-index: 3;"><a href="javascript:;" id="step-nav-3">上传应用</a></li>
                  <li style="z-index: 2;"><a href="javascript:;" id="step-nav-4">添加成功</a></li>
                </ul>
                <form method="POST" class="blueform" action="/apps/create" enctype="multipart/form-data">
                  <ul class="form">
                      <li>
                        <label> 应用名称 </label> 
                        <input type="text" name="appName" value="${appName }" />
                      </li>
                      <li>
                        <label> 上传应用 </label> 
                        <a href="javascript:void(0);" class="file">
	                        <span><em>+</em> 添加您的应用 </span>
                            <input title="<fmt:message key="app_upload_limit"/>" size="3" name="file" type="file" id="fileCtrl">
	                    </a>
                        <span id="fileCtrlVal"></span>
                      </li>
                  </ul>
                  <ul class="form">
                      <li>
                          <button id="btn_sub" type="submit">上传应用</button>
                      </li>
                  </ul>
                </form>
			</div>
			<div class="clear"></div>
		</div>
	</div>
    <jsp:include page="../includes/footer.jsp">
       <jsp:param value="page/upload" name="loader"/>
    </jsp:include>
    <script>
    $(".blueform").submit(function() {
      alert("注意：当上传成功后，我们需要花费15s的时间分析您的应用。");
      $("button[type=submit]").attr("disabled", "disabled");
      return true;
    });
    </script>
</body>
</html>
