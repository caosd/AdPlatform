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
                <c:if test="${appKeyError}">
                <div class="protip error">
                    <strong><fmt:message key="tips"/></strong> appKey不存在
                </div>
                </c:if>
                <div class="protip error" id="formerror" style="display: none;"></div>
                <div style="text-align:center;">
                    <img src="/images/step2.png" />
                </div>
                <form method="POST" class="blueform" action="/apps/create/${app.key}" style="margin-left: 95px;width: 812px;">
                  <ul class="form">
                      <li>
                        <label> 应用名称 </label> 
                        <input type="text" name="appName" value="${app.name }" />
                      </li>
                      <li>
                        <label> 包名 </label> 
                        <input type="text" name="packageName" value="${app.pkg }" readonly="readonly" />
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
                  </ul>
                  <ul class="form">
                      <li>
                          <button id="btn_sub2" type="submit">创建应用</button>
                      </li>
                  </ul>
                </form>
			</div>
			<div class="clear"></div>
		</div>
	</div>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
    <script>
    (function() {
      $(".blueform").submit(function() {
        var err = $("#formerror");
        if ($("input[name=appIcon]:checked").length == 1) {
          err.hide();
          return true;
        }
        err.html("请选择一个图标").show();
        return false;
      });
    })();
    </script>
</body>
</html>
