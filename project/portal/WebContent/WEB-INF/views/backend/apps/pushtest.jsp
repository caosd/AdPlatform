<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/html_attributes.jsp"%>
<head>
<title><fmt:message key="push_title" /></title>
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
					<h2>
						<fmt:message key="push_title" />
					</h2>
					<form class="blueform">
						<ul>
							<li><label>test key:</label><input type="text" name="testKey"></li>
							<li><label>描述:</label><input type="text" name="desc"></li>
						</ul>
						<ul>
							<li><button type="button" class="add">测试广告</button>
								&nbsp;&nbsp; <a href="javascript:void(0)" class="cancel">取消</a></li>
							<li><span class="error"></span></li>
						</ul>
					</form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>
