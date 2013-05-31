<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../../includes/html_attributes.jsp" %>
<head>
<%@include file="../../includes/style.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/tablereport.css" media="screen">
</head>
<body>
	<%@include file="../../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
			    <%@include file="../../includes/accounts_sidebar.jsp"%>
			    <div class="right_content">
					<h2 style="margin-bottom: 10px;">每日统计</h2>
					<div id="settings">
                      <div id="date-range" class="ready" style="display: block; opacity: 1; top: 4px; z-index: 1000;position: relative;">
                        起始日期：
                        <span id="start-date-container"><input type="text" name="start" id="start" class="shorter"></span>
                        结束日期：
                        <span id="end-date-container"><input type="text" name="end" id="end" class="shorter"></span>
                        <button class="mini">查询</button>
                        <span id="links" style="padding: 0 10px;">
                            <a class="first active" href="">今天(默认)</a>
                            <a class="" href="">昨天</a>
                            <a class="" href="">前天</a>
                            <a class="" href="">最近7天</a>
                            <a class="last" href="">最近30天</a>
                        </span>
                      </div>
                      <div style="line-height: 27px;height: 40px;text-align: center;margin-top: 10px;">
                        &nbsp;请选择要统计的应用：
                        <select class="mini">
                            <option>全部应用</option>
                        </select>
                        <select class="mini">
                            <option>全部</option>
                            <option value="sm_total_users">总用户数</option>
                            <option value="sm_push_times">推送次数</option>
                            <option value="sm_display_times">展示次数</option>
                            <option value="sm_new_users">新增用户</option>
                            <option value="sm_online_users">在线用户</option>
                            <option value="sm_conversion_rate">转化率</option>
                            <option value="sm_fill_rate">填充率</option>
                            <option value="sm_money_pushes">推送收入</option>
                            <option value="sm_money_advertising">广告收入</option>
                        </select>
                        &nbsp;&nbsp;
                      </div>
                    </div>
                    <div class="box">
                       <table class="data">
                           <thead>
                             <tr>
                               <th width="12%">天数</th>
                               <th>新增用户</th>
                               <th>在线用户</th>
                               <th>推送收入 (元)</th>
                               <th>应用内广告收入 (元)</th>
                               <th>总收入 (元)</th>
                             </tr>
                           </thead>
                           <tbody>
                             <tr>
                               <td>1</td>
                               <td>40</td>
                               <td>2000</td>
                               <td>10.000</td>
                               <td>105.500</td>
                               <td>205.500</td>
                             </tr>
                           </tbody>
                       </table>
                       <table class="data">
                           <thead>
                             <tr>
                               <th width="12%">天数</th>
                               <th>新增用户</th>
                               <th>在线用户</th>
                               <th>推送收入 (元)</th>
                               <th>应用内广告收入 (元)</th>
                               <th>总收入 (元)</th>
                             </tr>
                           </thead>
                           <tbody>
                             <tr>
                               <td>2013-05-27</td>
                               <td>40</td>
                               <td>2000</td>
                               <td>10.000</td>
                               <td>105.500</td>
                               <td>205.500</td>
                             </tr>
                           </tbody>
                       </table>
                       <ul class="pages">
                            <li class="prev"><a href="javascript:void(0);" class="btn mini tertiary disabled" rel="prev">←</a></li>
                            <li class="next"><a href="javascript:void(0);" class="btn mini tertiary disabled" rel="next">→</a></li>
                            <li><a href="javascript:void(0);" class="btn mini tertiary selected">1</a></li>
                        </ul>
                    </div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
    <jsp:include page="../../includes/footer.jsp"></jsp:include>
</body>
</html>
