<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="footer">
	<div>
		<span class="right_nav">
			<span>
				<label class="snslbl"><fmt:message key="html.foot.snslabel"/>:&nbsp;&nbsp;</label>
				<a class="sns-tw" target="_blank" href="https://twitter.com/SmileTomato_PRC"></a>
				<a class="sns-fb" target="_blank" href="http://www.facebook.com/tomatochina.smile"></a>
				<a class="sns-wb" target="_blank" href="http://weibo.com/u/3193321097"></a>
				<!-- 
				<a class="sns-in"></a>
				<a class="sns-qqwb"></a>
				 -->
			</span>
			<br/>
			<span>
				<label>Language: </label>
				<select onchange="if(newUrl=this.options[this.selectedIndex].value){location.href=newUrl;}">
					<option value="/zh"<fmt:message key="languageSelectZH"/>>简体中文</option>
					<option value="/en"<fmt:message key="languageSelectEN"/>>English</option>
				</select>
			</span>
		</span>
		
		<div class="footer_nav">
			<a href="/aboutus"><fmt:message key="aboutus"/></a>
			<span> | </span>
			<a href="/helpcenter"><fmt:message key="faq"/></a>
		</div>
		<div class="copyright">
			<label>Copyright © 2012 SmileTomato Inc. All Rights Reserved. <fmt:message key="beian"/></label>
		</div>
	</div>
</div>
<script src="/js/thirdparty/jquery.js"></script>