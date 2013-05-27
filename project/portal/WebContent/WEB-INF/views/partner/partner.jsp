<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../includes/head_config.jsp" %>
		<title><fmt:message key="partner.title"/></title>
	</head>
<body>

<%@include file="../includes/body_top_nav.jsp" %>
<div class="banner_partner"></div>
<div class="maincnt partner">
	<div class="maincnt_box clearfix">
		<div class="leftcnt_box">
			<div class="leftcnt_title">
				<span><fmt:message key="partner"/></span>
			</div>
			<div class="leftcnt clearfix">
				<div class="inner">
					<ul class="navmenu">
						<li class="current"><span><fmt:message key="partner.lside.menu.i1"/></span></li>
						<li><span><fmt:message key="partner.lside.menu.i2"/></span></li>
						<li><span><fmt:message key="partner.lside.menu.i3"/></span></li>
					</ul>
					<%@include file="../includes/body_contacts.jsp" %>
				</div>
			</div>
		</div>
		<div class="rightcnt_box">
			<div class="rightcnt clearfix">
				<div class="inner" id="partner-0">
					<div class="navmap"><a href="/"><fmt:message key="home"/></a> > <a href="/partner"><fmt:message key="partner"/></a> > <fmt:message key="partner.lside.menu.i1"/></a></div>
					<div class="dashline"></div>
					<div class="partner-content">
						<h1 class="subtitle"><fmt:message key="partner.media"/></h1>
						<ul class="app-list" id="partner-media"></ul>
						<div class="clearfix"></div>
						<h1 class="subtitle"><fmt:message key="partner.channel"/></h1>
						<ul class="app-list" id="partner-channel"></ul>
					</div>
				</div>

				<div class="inner" id="partner-1" style="display:none;">
					<div class="navmap"><a href="/"><fmt:message key="home"/></a> > <a href="/partner"><fmt:message key="partner"/></a> > <fmt:message key="partner.lside.menu.i2"/></div>
					<div class="dashline"></div>
					<div class="partner-content">
						<ul class="app-list" id="partner-brand"></ul>
					</div>
				</div>

				<div class="inner" id="partner-2" style="display:none;">
					<div class="navmap"><a href="/"><fmt:message key="home"/></a> > <a href="/partner"><fmt:message key="partner"/></a> > <fmt:message key="partner.lside.menu.i3"/></div>
					<div class="dashline"></div>
					<div class="partner-content">
						<ul class="app-list" id="partner-agent"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../includes/body_foot.jsp" %>
</div>
<script>
	$(function() {
		var appNameArr = <fmt:message key="partner.medias.appNameArr"/>;
		$(".navmenu li").click(function() {
			$(this).addClass("current").siblings().removeClass("current");
			$("#partner-"+$(this).index()).show().siblings().hide();
			if ($(this).index() == 0) {
				$(".maincnt .rightcnt").css({"background-image": "url(/images/right_sidebox_large.png)", "height": "1173px"});
			} else {
				$(".maincnt .rightcnt").css({"background-image": "url(/images/right_sidebox.png)", "height": "602px"});
			}
		});
		$(".navmenu li:nth(0)").trigger("click");
		var medias = [];
		var mediaLen = 27;
		var channels = [];
		var channelLen = 12;
		var brands = [];
		var brandLen = 33;
		var agents = [];
		var agentLen = 21;
		for (var i=0; i<mediaLen; i++) {
			medias.push('<li><img class="app-icon" src="/images/media/'+ (i+1) +'.jpg"/><span class="app-name">'+ appNameArr[i] +'</span></li>');
		}
		for (var i=0; i<channelLen; i++) {
			channels.push('<li><a href="javascript:void(0);"><img src="/images/partner/'+ (i+1) +'.jpg"/></a></li>');
		}
		for (var i=0; i<brandLen; i++) {
			brands.push('<li><a href="javascript:void(0);"><img src="/images/brand/pp_'+ (i+1) +'.gif"/></a></li>');
		}
		for (var i=0; i<agentLen; i++) {
			agents.push('<li><a href="javascript:void(0);"><img src="/images/agent/ag_'+ (i+1) +'.gif"/></a></li>');
		}
		$("#partner-media").html(medias.join(""));
		$("#partner-channel").html(channels.join(""));
		$("#partner-brand").html(brands.join(""));
		$("#partner-agent").html(agents.join(""));
	});
</script>
</body>
</html>