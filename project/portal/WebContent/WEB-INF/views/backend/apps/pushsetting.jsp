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
                    <div class="bluebox" id="settings">
                        <dl>
                            <dt>
                                <label>广告推送开关:</label>
                            </dt>
                            <dd>
                                <div id="links" style="padding-top: 5px;">
                                    <a class="first active" href="">开启</a>
                                    <a class="last" href="">关闭</a>
                                </div>
                            </dd>
                            <dt>
                                <label>广告托管开关:</label>
                            </dt>
                            <dd>
                                <div id="links" style="padding-top: 5px;">
                                    <a class="first active" href="">开启</a>
                                    <a class="last" href="">关闭</a>
                                </div>
                            </dd>
                        </dl>
                    </div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>
