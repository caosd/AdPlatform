<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="header">
	<div class="container">
		<a href="${not empty user.userName?"/apps":"/" }" title="Smile Tomato" class="logo"><span>Smile Tomato</span></a>
		<c:if test="${not empty user.userName }">
		<div class="appselect">
			<a href="" title="" class="appselect_button">
				<c:if test="${empty app.name}"><fmt:message key="head.searchctrl.label"/></c:if>
				<c:if test="${not empty app.name}">${app.name }</c:if>
				<span class="arrow"></span>
			</a>
			<div style="display: none;" class="popover">
				<div class="search">
					<!-- <input name="appselect_search" id="appselect_search"
						placeholder="Type your search" type="text"> <span
						class="icon"></span> -->
					<span style="color:white"><fmt:message key="head.searchctrl.rbel"/></span>
				</div>
				<ul id="id_menu_app_list">
					<c:forEach items="${lastedApps }" var="app">
					<li onclick="location.href='/apps/${app.key }/detail'">
						<div class="app_icon" style="background-image:url(/images/default_app_icon_57x57.png);"></div>
						<h3>${app.name }</h3>
					</li>
					</c:forEach>
				</ul>
				<div class="buttons">
					<a href="/apps/create"><fmt:message key="head.create_app"/></a> <a href="/apps"><fmt:message key="head.view_all_app"/></a>
				</div>
			</div>
		</div>
		<ul class="nav">
            <li><a class="" href=""> ${user.userName}<span class="arrow"></span></a>
                <div class="popover">
                    <ul>
                        <li><a href="/accounts/overview"><fmt:message key="head.account"/></a></li>
                        <li><a href="/accounts/sign-out"><fmt:message key="head.signout"/></a></li>
                    </ul>
                </div>
            </li>
            <li><a class="" href=""> SDK <span class="arrow"></span></a>
                <div class="popover">
                    <ul>
                        <li><a href="/sdk/download"><fmt:message key="head.download"/> SDK</a></li>
                    </ul>
                </div>
            </li>
		</ul>
		</c:if>
	</div>
</div>