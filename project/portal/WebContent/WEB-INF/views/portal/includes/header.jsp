<%@ page language="java" pageEncoding="UTF-8"%>
<div id="header" class="navbar navbar-inverse navbar-fixed-top">
    <!-- BEGIN TOP NAVIGATION BAR -->
    <div class="navbar-inner">
        <div class="container-fluid">
            <!-- BEGIN LOGO -->
            <a class="brand" href="/">
                <img src="/img/logo.png" alt="Admin Lab">
            </a>
            <!-- END LOGO -->
            <!-- BEGIN RESPONSIVE MENU TOGGLER -->
            <a class="btn btn-navbar collapsed" id="main_menu_trigger" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="arrow"></span>
            </a>
            <div class="top-nav ">
                <ul class="nav pull-right top-menu">
                    <!-- BEGIN SUPPORT -->
                    <li class="dropdown mtop5">

                        <a class="dropdown-toggle element" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Chat">
                            <i class="icon-comments-alt"></i>
                        </a>
                    </li>
                    <li class="dropdown mtop5">
                        <a class="dropdown-toggle element" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="Help">
                            <i class="icon-headphones"></i>
                        </a>
                    </li>
                    <!-- END SUPPORT -->
                    <!-- BEGIN USER LOGIN DROPDOWN -->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="/img/avatar1_small.jpg" alt="">
                            <span class="username">${user.userName }</span>
                        <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/logout.html"><i class="icon-key"></i> Log Out</a></li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                </ul>
                <!-- END TOP NAVIGATION MENU -->
            </div>
        </div>
    </div>
    <!-- END TOP NAVIGATION BAR -->
</div>
<!-- BEGIN CONTAINER -->
<div id="container" class="row-fluid">