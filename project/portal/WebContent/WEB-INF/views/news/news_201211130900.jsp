<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../includes/head_config.jsp" %>
		<title><fmt:message key="news.title"/></title>
	</head>
<body>

<%@include file="../includes/body_top_nav.jsp" %>
<div class="banner_news"></div>
<div class="maincnt news">
	<div class="maincnt_box clearfix">
		<div class="leftcnt_box">
			<div class="leftcnt_title">
				<span><fmt:message key="news"/></span>
			</div>
			<div class="leftcnt">
				<div class="inner">
					<ul class="navmenu">
						<li class="current"><span><fmt:message key="news.lside.menu.i1"/></span></li>
					</ul>
					<%@include file="../includes/body_contacts.jsp" %>
				</div>
			</div>
		</div>
		<div class="rightcnt_box">
			<div class="rightcnt">
				<div class="inner">
					<div class="navmap"><a href="/"><fmt:message key="home"/></a> > <a href="/news"><fmt:message key="news"/></a> > <fmt:message key="news.lside.menu.i1"/></div>
					<div class="dashline"></div>
					<div class="news-content">
						<div class="news-detail">
							<fmt:message key="news.articles.page1"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../includes/body_foot.jsp" %>
</div>
</body>
</html>