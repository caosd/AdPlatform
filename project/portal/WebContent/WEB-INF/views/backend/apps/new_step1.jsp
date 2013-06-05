<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="new_app_title"/></title>
<%@include file="../includes/style.jsp"%>
<style>
form.blueform ul.icons li {
float: left;
text-align:center;
margin-right: 20px;
}
form.blueform ul.icons li img {
width:45px;
}
form.blueform ul.icons li .desc {
display:block;
}
</style>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<h2><fmt:message key="new_app_title"/></h2>
                <c:if test="${packageExisted}">
                <div class="protip error">
                    <strong><fmt:message key="tips"/></strong> 该包名已经存在。
                </div>
                </c:if>
                <c:if test="${unpackError}">
                <div class="protip error">
                    <strong><fmt:message key="tips"/></strong> 无法解析改应用包，请确认是不是合法的android包。
                </div>
                </c:if>
                <div style="text-align:center;">
                    <img src="/images/step1.png" />
                </div>
                <form method="POST" class="blueform" action="/apps/create" enctype="multipart/form-data" style="margin-left: 95px;width: 812px;">
                  <ul class="form">
                      <li>
                        <label> 应用名称 </label> 
                        <input type="text" name="appName" value="${appName }" />
                      </li>
                      <c:if test="${not empty packageName}">
                      <li>
                        <label> 包名 </label> 
                        <input type="hidden" name="appKey" value="${appKey }"/>
                        <input type="text" name="packageName" value="${packageName }" readonly="readonly" />
                      </li>
                      <li>
                        <label> 应用图标<br/>(来源于上传应用中) </label> 
                        <ul class="icons">
                        <c:forEach items="${icons}" var="icon">
                            <li>
                              <img src="http://localhost:10000${icon }" />
                              <span class="desc">${fn:replace(fn:split(icon, "/")[fn:length(fn:split(icon, "/"))-1], "%23", "/") }</span>
                              <input type="radio" name="appIcon" value="${icon }" />
                            </li>
                        </c:forEach>
                        </ul>
                      </li>
                      </c:if>
                      <c:if test="${empty packageName}">
                      <li>
                        <label> 上传应用 </label> 
                        <a href="javascript:void(0);" class="file">
	                        <span><em>+</em> 添加您的应用 </span>
	                        <input title="支持jpg,gif,png格式" size="3" name="file" type="file">
	                    </a>
                      </li>
                      </c:if>
                  </ul>
                  <ul class="form">
                      <li>
                          <c:if test="${empty packageName}">
                          <button id="btn_sub" type="submit">上传应用</button>
                          </c:if>
                          <c:if test="${not empty packageName}">
                          <button id="btn_sub2" type="submit">提交信息</button>
                          </c:if>
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
