<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title><decorator:title default="" /></title>
<%@include file="../includes/style.jsp"%>
<link type="text/css" rel="stylesheet" href="/css/main.css" media="screen">
<decorator:head />
</head>
<body class="fixed-top">
	<%@include file="../includes/header.jsp"%>

	<%@include file="../includes/leftside.jsp"%>

	<!-- BEGIN PAGE -->
	<div id="main-content">
		<div class="container-fluid">
			<!-- BEGIN PAGE HEADER-->
			<div class="row-fluid">
				<div class="span12">
					<div id="theme-change" class="hidden-phone">
						<i class="icon-cogs"></i> <span class="settings"> <span
							class="text">Theme:</span> <span class="colors"> <span
								class="color-default" data-style="default"></span> <span
								class="color-gray" data-style="gray"></span> <span
								class="color-purple" data-style="purple"></span> <span
								class="color-navy-blue" data-style="navy-blue"></span>
						</span>
						</span>
					</div>
					<decorator:body />
				</div>
			</div>
		</div>
	</div>
	<!-- END PAGE -->

	<%@include file="../includes/footer.jsp"%>
</body>
</html>