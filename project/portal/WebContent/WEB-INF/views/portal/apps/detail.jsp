<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<div class="row-fluid">
   <div class="span12">
       <!-- END THEME CUSTOMIZER-->
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="/apps">应用列表</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#"><fmt:message key="app_overview_title"/></a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	 <div class="widget-header">
		<h5><fmt:message key="app_overview_title"/></h5>
	 </div>
	  <div class="widget-body form" style="display: block;">
		<div class="right_content">
			<h2>
			    <c:if test="${empty app.icon }">
				<div class="app_icon" style="background-image: url(/images/default_app_icon_57x57.png);"></div>
				</c:if>
				<c:if test="${not empty app.icon }">
                      <div class="app_icon" style="background-image: url(${imgServer}${app.icon});background-size: 100% 100%;"></div>
                      </c:if>
				<span>${app.name }</span>
			</h2>
			<div class="bluebox">
				<dl>
					<dt><fmt:message key="label.app_key"/></dt>
					<dd id="app_key">${app.key }</dd>
					<dt><fmt:message key="label.app_package"/></dt>
					<dd id="appPackage">${app.pkg }</dd>
					<dt><fmt:message key="label.created_time"/></dt>
					<dd id="app_itime">${app.createTime}</dd>
                          <dt><fmt:message key="label.last_update_time"/></dt>
                          <dd id="app_itime">${app.lastUpdateTime}</dd>
                          <dt></dt>
                          <dd><br/><fmt:message key="app_overview_delete_prefix"/> <a href="javascript:if (confirm('<fmt:message key="app_overview_delete_confirm"/>')) location.href='/apps/${app.key }/delete';"><fmt:message key="app_overview_delete_middle"/></a> <fmt:message key="app_overview_delete_suffix"/></dd>
				</dl>
			</div>
		</div>
	    <!-- END FORM-->
	 </div>
</div>
 </body>