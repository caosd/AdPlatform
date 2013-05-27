<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
private static final String TITLE_INDEX = "index";
private static final String TITLE_PARTNER = "partner";
private static final String TITLE_ABOUTUS = "aboutus";
private static final String TITLE_NEWS = "news";
private static final String TITLE_HELPCENTER = "helpcenter";
%>
<%
	String servletPath = request.getServletPath();
	String pageType = TITLE_INDEX;
	if (servletPath.indexOf("/partner") >= 0) {
		pageType = TITLE_PARTNER;
	} else if (servletPath.indexOf("/aboutus") >= 0) {
		pageType = TITLE_ABOUTUS;
	} else if (servletPath.indexOf("/news") >= 0) {
		pageType = TITLE_NEWS;
	} else if (servletPath.indexOf("helpcenter") >= 0) {
		pageType = TITLE_HELPCENTER;
	}
%>
<div class="header">
    <div class="header_width">
		<div id="fancymenu">
			<ul>
				<li<%=TITLE_INDEX.equals(pageType)?" class=\"current\"":"" %>><a href="/"><fmt:message key="home"/></a></li>
				<li<%=TITLE_PARTNER.equals(pageType)?" class=\"current\"":"" %>><a href="/partner"><fmt:message key="partner"/></a></li>
				<li<%=TITLE_HELPCENTER.equals(pageType)?" class=\"current\"":"" %>><a href="/helpcenter"><fmt:message key="helpcenter"/></a></li>
				<li<%=TITLE_ABOUTUS.equals(pageType)?" class=\"current\"":"" %>><a href="/aboutus"><fmt:message key="aboutus"/></a></li>
			</ul>
		</div>
		<div class="logo">
			<a target="_top" href="/" title="Smile Tomato"><img src="/images/logo.png" alt="Smile Tomato"></a>
		</div>
		<div class="login_panel">
			<ul>
				<li class="login"><a href="/accounts/sign-in"><fmt:message key="login" /></a></li>
				<!-- <li class="register"><a href="/helpcenter/how-to-register"><fmt:message key="register" /></a></li> -->
			</ul>
		</div>
    </div>
</div>