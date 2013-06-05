<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title><fmt:message key="push_title"/></title>
<%@include file="../includes/style.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/tablereport.css" media="screen">
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../includes/sidebar.jsp"%>
				<div class="right_content">
					<h2>推送设置</h2>
                    <form method="POST" class="blueform" action="/apps/${app.key}/push/setting">
                        <div style="display: none;">
	                        <input type="hidden" value="${app.allowPush }" name="allow-push"/>
	                        <input type="hidden" value="${app.allowTrustee }" name="allow-trustee"/>
                        </div>
                        <ul id="settings" class="form">
                            <li>
                                <label>广告托管开关:</label>
                                <div id="links" style="padding-top: 5px;" class="allow-trustee">
                                    <a class="first ${app.allowTrustee?"active":"" }" href="javascript:;" data-mode="true">开启</a>
                                    <a class="last ${app.allowTrustee?"":"active" }" href="javascript:;" data-mode="false">关闭</a>
                                </div>
                            </li>
                            <li style="margin: 20px 10px 20px 0">
                                <label>广告推送开关:</label>
                                <div id="links" style="padding-top: 5px;" class="allow-push">
                                    <a class="first ${app.allowPush?"active":"" }" href="javascript:;" data-mode="true">开启</a>
                                    <a class="last ${app.allowPush?"":"active" }" href="javascript:;" data-mode="false">关闭</a>
                                </div>
                            </li>
                            <c:if test="${not app.allowPush}">
                            <li>
                                <label>广告推送延迟:</label>
                                <input type="text" name="delay_push_interval" id="delay_push_interval" value="${app.delayPushInterval }" style="width: 50px;"/>&nbsp;天&nbsp;<span class="error" id="delay_push_interval_error"></span>
                                <p style="font-style: italic;color: #A2A2A2;margin: 5px 0;">所有该应用的注册用户都会在注册生效后的设置天数后再收到广告。0为永久不推送。</p>
                                <input type="submit" value="保存"/>
                            </li>
                            </c:if>
                        </ul>
                    </form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp">
	   <jsp:param value="page/push_setting" name="loader"/>
	</jsp:include>
</body>
</html>
