<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../includes/head_config.jsp" %>
		<title><fmt:message key="aboutus.title"/></title>
	</head>
<body>

<%@include file="../includes/body_top_nav.jsp" %>
<div class="banner_aboutus"></div>
<div class="maincnt aboutus">
	<div class="maincnt_box clearfix">
		<div class="leftcnt_box">
			<div class="leftcnt_title">
				<span><fmt:message key="aboutus"/></span>
			</div>
			<div class="leftcnt">
				<div class="inner">
					<ul class="navmenu">
						<li class="current"><span><fmt:message key="aboutus.lside.menu.i1"/></span></li>
						<li><span><fmt:message key="aboutus.lside.menu.i2"/></span></li>
						<li><span><fmt:message key="aboutus.lside.menu.i3"/></span></li>
						<li><span><fmt:message key="aboutus.lside.menu.i4"/></span></li>
					</ul>
					<%@include file="../includes/body_contacts.jsp" %>
				</div>
			</div>
		</div>
		<div class="rightcnt_box">
			<div class="rightcnt">
				<div class="inner" id="about-0">
					<div class="navmap"><a href="/"><fmt:message key="home"/></a> > <a href="/aboutus"><fmt:message key="aboutus"/></a> > <fmt:message key="aboutus.lside.menu.i1"/></div>
					<div class="dashline"></div>
					<div class="about-content">
						<fmt:message key="aboutus.article.i1"/>
					</div>
				</div>

				<div class="inner" id="about-1" style="display: none;">
					<div class="navmap"><a href="/"><fmt:message key="home"/></a> > <a href="/aboutus"><fmt:message key="aboutus"/></a> > <fmt:message key="aboutus.lside.menu.i2"/></div>
					<div class="dashline"></div>
					<div class="about-content">
						<fmt:message key="aboutus.article.i2"/>
					</div>
				</div>

				<div class="inner" id="about-2" style="display: none;">
					<div class="navmap"><a href="/"><fmt:message key="home"/></a> > <a href="/aboutus"><fmt:message key="aboutus"/></a> > <fmt:message key="aboutus.lside.menu.i3"/></div>
					<div class="dashline"></div>
					<div class="about-content">
						<p>
							<a href="http://j.map.baidu.com/AOgzg" target="_blank" alt="address"><img class="addr-map" src="/images/addr.jpg"/></a>
						</p>
						<fmt:message key="aboutus.article.i3"/>
					</div>
				</div>

				<div class="inner" id="about-3" style="display: none;">
					<div class="navmap"><a href="/"><fmt:message key="home"/></a> > <a href="/aboutus"><fmt:message key="aboutus"/></a> > <fmt:message key="aboutus.lside.menu.i4"/></div>
					<div class="dashline"></div>
					<div class="about-content">
						<fmt:message key="aboutus.article.i4"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../includes/body_foot.jsp" %>
</div>
	<script>
	$(function() {
		$(".navmenu li").click(function() {
			$(this).addClass("current").siblings().removeClass("current");
			$("#about-"+$(this).index()).show().siblings().hide();
		});
	});
	</script>
</body>
</html>