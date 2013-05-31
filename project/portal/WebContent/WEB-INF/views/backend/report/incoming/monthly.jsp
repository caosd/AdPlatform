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
					<h2>每月统计</h2>
					<div id="settings">
                      <div id="date-range" class="ready" style="display: block; opacity: 1; top: 4px; z-index: 1000;">
                        从&nbsp;
                        <span id="start-date-container"><input type="text" name="start" id="start" class="shorter"></span>
                        &nbsp;至&nbsp;
                        <span id="end-date-container"><input type="text" name="end" id="end" class="shorter"></span>
                        <span id="links" style="padding: 0 10px;">
	                        <a class="first active" href="javascript:void(0);" title="概括" id="push_portal">概括</a>
	                        <a class="last" href="javascript:void(0);" title="详情" id="push_api">详情</a>
                        </span>
                        &nbsp;请选择应用：
                        <select class="mini">
                            <option>全部应用</option>
                        </select>
                        &nbsp;&nbsp;
                        <button class="mini">查询</button>
                      </div>
                    </div>
					<div class="box">
					   <table class="data">
					       <thead>
                             <tr>
                               <th width="12%">月份</th>
                               <th>新增用户</th>
                               <th>在线用户</th>
                               <th>推送收入 (元)</th>
                               <th>应用内广告收入 (元)</th>
                               <th>总收入 (元)</th>
                             </tr>
                           </thead>
                           <tbody>
                             <tr>
                               <td>7月份</td>
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
