<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<div class="row-fluid">
   <div class="span12">
       <!-- BEGIN THEME CUSTOMIZER-->
       <div id="theme-change" class="hidden-phone">
           <i class="icon-cogs"></i>
            <span class="settings">
                <span class="text">Theme:</span>
                <span class="colors">
                    <span class="color-default" data-style="default"></span>
                    <span class="color-gray" data-style="gray"></span>
                    <span class="color-purple" data-style="purple"></span>
                    <span class="color-navy-blue" data-style="navy-blue"></span>
                </span>
            </span>
       </div>
       <!-- END THEME CUSTOMIZER-->
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">帐户管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#"><fmt:message key="account_overview_title"/></a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	 <div class="widget-title">
	    <h4><i class="icon-reorder"></i><fmt:message key="account_overview_title"/></h4>
	    <span class="tools">
	       <a href="javascript:;" class="icon-chevron-down"></a>
	       <a href="javascript:;" class="icon-remove"></a>
	    </span>
	 </div>
	  <div class="widget-body form" style="display: block;">
		<div class="right_content">
					<div class="bluebox">
						<dl>
							<dt><fmt:message key="label.account_name"/></dt>
                            <dd>${user.userName}</dd>
                            <dt><fmt:message key="label.email"/></dt>
                            <dd>${user.email}</dd>
							<dt><fmt:message key="label.account_type"/></dt>
							<dd>
							<c:if test="${user.type == 1}"><fmt:message key="option.individual"/></c:if>
							<c:if test="${user.type == 2}"><fmt:message key="option.company"/></c:if>
							</dd>
							<c:if test="${user.type == 2 }">
							<dt><fmt:message key="label.company_name"/></dt>
							<dd>${user.company}</dd>
							</c:if>
							<c:if test="${user.type == 1 }">
							<dt><fmt:message key="label.contact_name"/></dt>
							<dd>${user.contactName }</dd>
							</c:if>
                            <dt><fmt:message key="label.contact_tel"/></dt>
                            <dd>${user.contactTel}</dd>
                            <dt><fmt:message key="label.qq"/></dt>
                            <dd>${user.qq}</dd>
							<dt><fmt:message key="label.website"/></dt>
							<dd>${user.website}</dd>
                            <dt><fmt:message key="label.account_created"/></dt>
                            <dd><fmt:formatDate value="${user.createtime}" type="both" pattern="MMM, dd HH:mm:ss z"/></dd>
                            <dt><fmt:message key="label.last_login_time"/></dt>
                            <dd><fmt:formatDate value="${user.loginTokenTime}" type="both" pattern="MMM, dd HH:mm:ss z"/></dd>
						</dl>
					</div>
				</div>
	    <!-- END FORM-->
	 </div>
</div>
 </body>