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
	 <div class="widget-header">
		<h5><fmt:message key="account_overview_title"/></h5>
	 </div>
	  <div class="widget-body form" style="display: block;">
		<div class="right_content">
					<div class="bluebox">
						<dl>
							<dt><fmt:message key="label.account_name"/>${user.userName}</dt>
                            <dt><fmt:message key="label.email"/>${user.email}</dt>
							<dt><fmt:message key="label.account_type"/>
								<c:if test="${user.type == 1}"><fmt:message key="option.individual"/></c:if>
								<c:if test="${user.type == 2}"><fmt:message key="option.company"/></c:if>
							</dt>
							<c:if test="${user.type == 2 }">
							<dt><fmt:message key="label.company_name"/>${user.company}</dt>
							</c:if>
							<c:if test="${user.type == 1 }">
							<dt><fmt:message key="label.contact_name"/>${user.contactName }</dt>
							</c:if>
                            <dt><fmt:message key="label.contact_tel"/>${user.contactTel}</dt>
                            <dt><fmt:message key="label.qq"/>${user.qq}</dt>
							<dt><fmt:message key="label.website"/>${user.website}</dt>
                            <dt><fmt:message key="label.account_created"/><fmt:formatDate value="${user.createtime}" type="both" pattern="MMM, dd HH:mm:ss z"/></dt>
                            <dt><fmt:message key="label.last_login_time"/><fmt:formatDate value="${user.loginTokenTime}" type="both" pattern="MMM, dd HH:mm:ss z"/></dt>
						</dl>
					</div>
				</div>
	    <!-- END FORM-->
	 </div>
</div>
 </body>