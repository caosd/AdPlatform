<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="includes/head_config.jsp" %>
		<link rel="stylesheet" type="text/css" href="/css/index.css">
		<fmt:message key="html.en_index_stylesheet"/>
		<title><fmt:message key="home.title"/></title>
	</head>
<body>

<%@include file="includes/body_top_nav.jsp" %>
<div class="banner">
	<div class="flash">
	    <div id="imgPlay">
			<ul class="imgs">
				<li><img alt="" src="/images/banner<fmt:message key="languageFlag"/>_1.jpg"></li>
			</ul>
			<div class="num" id="numInner">
				<ul>
					<li class="current">1</li>
					<li>2</li>
					<li>3</li>
				</ul>
			</div>
	    </div>
    </div>
</div>
<div class="indexmain">
	<div class="indexmain_box clearfix">
		<div class="index_box clearfix">
			<div class="index_leftbox">
				<h1 class="tit_intro"></h1>
		    	<ul class="intro clearfix">
		        	<li>
		        		<div class="desc1"></div>
		            	<p><fmt:message key="home.intro.label1"/></p>
		            </li>
		            <li>
		            	<div class="desc2"></div>
		            	<p><fmt:message key="home.intro.label2"/></p>
		            </li>
		            <li>
		            	<div class="desc3"></div>
		            	<p><fmt:message key="home.intro.label3"/></p>
		            </li>
		            <li>
		            	<div class="desc4"></div>
		            	<p><fmt:message key="home.intro.label4"/></p>
		            </li>
		        </ul>
		        <div class="shortline"></div>
		        <h1 class="tit_platforms"></h1>
		        <ul class="dtk-list">		
					<li >
						<img src="/images/platform_android.png">
					 	<p><fmt:message key="home.platform.android"/></p>
					</li>
					<li>
						<img src="/images/platform_ios.png">
						<p><fmt:message key="home.platform.ios"/></p>
					</li>
					<li>
						<img src="/images/platform_winmobile.png">
						<p><fmt:message key="home.platform.upComming"/></p>
					</li>
					<li>
						<img src="/images/platform_windows.png">
				 		<p><fmt:message key="home.platform.upComming"/></p>
					</li>
					<li>
						<img src="/images/platform_java.png">
				 		<p><fmt:message key="home.platform.upComming"/></p>
					</li>
				</ul>
		    </div>
			<div class="index_rightbox">
				<div class="index_num">
					<p class="index_num_counter"></p>
					<p class="index_num_label1"><fmt:message key="home.datac.label1"/></p>
					<p class="index_num_label2"><fmt:message key="home.datac.label2"/></p>
				</div>
		        <div class="index_list">
		        	<div>
		                <h1 class="news_title"><fmt:message key="home.news"/></h1>
						<a href="/news" class="news_more"></a>
		            </div>
					<ul>
						<li><a href="/news/201211130900"><h2><fmt:message key="home.news.a1"/></h2></a></li>
					</ul>
		        </div>
		    </div>
		</div>
	    <div class="index_bottom">
	    	<div class="longline"></div>
			<h1 class="tit_partner">
				<a href="/partner" class="more"></a>
			</h1>
			<div class="partner-box">
				<div id="partner-list">
					<div id="partner-inner">
						<div id="partnerslt"></div>
						<div id="partnersrt"></div>
					</div>
				</div>
			</div>
	    </div>
    </div>
	<%@include file="includes/body_foot.jsp" %>
</div>
<script>
	$(function() {
		var currShownIdx = 1,
	    	minShownIdx = 1,
	    	maxShownIdx = 3,
	    	timmerHandler = null;
	    function onBannerShown() {
	    	$("#imgPlay .imgs li").fadeOut(function() {
	    		if (currShownIdx > maxShownIdx) {
	    			currShownIdx = minShownIdx;
	    		} else if (currShownIdx < minShownIdx) {
	    			currShownIdx = maxShownIdx;
	    		}
	    		$(this).fadeIn().find("img").attr("src", "/images/banner<fmt:message key="languageFlag"/>_"+(currShownIdx)+".jpg");
	    		$(".banner").css("background-image", "url(/images/banner_"+(currShownIdx)+"_bg.jpg)");
	    		$("#numInner li.current").removeClass("current");
	    		$("#numInner li:nth-child("+currShownIdx+")").addClass("current");
	    	});
	    }
	    $("#numInner li").hover(function() {
	    	if (currShownIdx != $(this).index()+1) {
		    	currShownIdx = $(this).index()+1;
		    	onBannerShown();
		    	resetTask();
	    	}
	    });
	    function resetTask() {
	    	if (timmerHandler) window.clearInterval(timmerHandler);
	    	timmerHandler = setInterval(function() {
	    		currShownIdx++;
	    		onBannerShown();
	    	}, 5000);
	    }
	    resetTask();

	    var listCorp = [{postTitle: "HTC", link: "http://www.htc.com/cn/", picture: "/images/partner/1.jpg"}, {postTitle: "samsung", link: "http://www.samsung.com/cn/", picture: "/images/partner/2.jpg"}, {postTitle: "ZTE", link: "http://www.zte.com.cn/cn", picture: "/images/partner/3.jpg"}, {postTitle: "lenovo", link: "http://www.lenovo.com.cn/", picture: "/images/partner/4.jpg"}, {postTitle: "huawei", link: "http://www.huaweidevice.com/cn/", picture: "/images/partner/5.jpg"}, {postTitle: "Tencent", link: "http://www.qq.com/", picture: "/images/partner/6.jpg"}, {postTitle: "360", link: "http://www.360.cn/", picture: "/images/partner/7.jpg"}, {postTitle: "baidu", link: "http://www.baidu.com/", picture: "/images/partner/8.jpg"}, {postTitle: "豌豆荚", link: "http://www.wandoujia.com/", picture: "/images/partner/9.jpg"}, {postTitle: "sohu", link: "http://www.sohu.com/", picture: "/images/partner/10.jpg"}, {postTitle: "应用汇", link: "http://www.appchina.com/", picture: "/images/partner/11.jpg"}, {postTitle: "天朗", link: "http://www.winclick.net/", picture: "/images/partner/12.jpg"}];
	    
		var _speed = 10;
		var _slide = $("#partner-list");
		var _slideli1 = $("#partnerslt");
		var _slideli2 = $("#partnersrt");
		var _inner = $("#partner-inner");
		var aryHtml = [];
		for(var i=0,cnt=listCorp.length; i<cnt; i++) {
			aryHtml.push('<a target="_blank" href="', listCorp[i].link ,'">');
			aryHtml.push('<img alt="', listCorp[i].postTitle ,'" src="', listCorp[i].picture, '"/>');
			aryHtml.push('</a>');
		}
		_slideli1.html(aryHtml.join(''));
		_slideli2.html(aryHtml.join(''));
		var _innerWidth = 237 * listCorp.length;
		_inner.css("width", _innerWidth*2);
		function aniquee() {
			if (_slide.scrollLeft() >= _innerWidth) {
				_slide.scrollLeft(0);
			} else {
				_slide.scrollLeft(_slide.scrollLeft()+1);
			}
		}	
		var sliding=setInterval(aniquee,_speed);
		_slide.hover(function() {
			clearInterval(sliding);
		}, function(){
			sliding=setInterval(aniquee,_speed);
		});
		
		var startNum = ${pushAdsDisplay};
		var indexNumCounter = $(".index_num_counter");
		var dformat = function(value) {
		    value = value + "";
	        value = value.replace(/^(\d*)$/,"$1.");  
	        value = value.replace(/(\d*)\d*/,"$1");
	        value = value.replace(".",",");  
	        var re=/(\d)(\d{3},)/;  
	        while(re.test(value)) {
	        	value = value.replace(re,"$1,$2");
	        }
	        value = value.replace(/,(\d\d)$/,".$1");  
	        return value.substring(0, value.length-1);
		};
		setInterval(function() {
			var insValue = Math.floor(Math.random() * (1338 - 579) + 579);
			startNum += insValue;
			indexNumCounter.html(dformat(startNum));
		}, 1000);
	});
</script>
</body>
</html>