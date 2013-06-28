<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/menu" prefix="m" %>
<div id="sidebar" class="nav-collapse collapse">
    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
    <div class="sidebar-toggler hidden-phone"></div>
    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->

    <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
    <div class="navbar-inverse">
        <form class="navbar-search visible-phone">
            <input type="text" class="search-query" placeholder="Search">
        </form>
    </div>
    <!-- 菜单开始 -->
	<m:menu></m:menu>
	<!-- 菜单结束 -->
</div>