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
					<h2>小时统计</h2>
					<div id="settings">
                      <div id="date-range" class="ready" style="display: block; opacity: 1; top: 4px; z-index: 1000;">
                        从&nbsp;
                        <span id="start-date-container"><input type="text" name="start" id="start" class="shorter"></span>
                        &nbsp;至&nbsp;
                        <span id="end-date-container"><input type="text" name="end" id="end" class="shorter"></span>
                        &nbsp;请选择应用：
                        <select class="mini">
                            <option>全部应用</option>
                        </select>
                        <select class="mini">
                            <option>全部</option>
                            <option>推送</option>
                            <option>视频</option>
                            <option>酷仔</option>
                            <option>广告条</option>
                            <option>富媒体</option>
                        </select>
                        &nbsp;&nbsp;
                        <button class="mini">查询</button>
                      </div>
                    </div>
                    <div class="box">
                       <table class="data">
                           <thead>
                             <tr>
                               <th>小时</th>
                               <th>推送广告收入 (元)</th>
                               <th>视频广告收入 (元)</th>
                               <th>酷仔收入 (元)</th>
                               <th>广告条收入 (元)</th>
                               <th>富媒体收入 (元)</th>
                               <th>总收入 (元)</th>
                             </tr>
                           </thead>
                           <tbody>
                             <tr>
                               <td>1</td>
                               <td>0.000</td>
                               <td>0.000</td>
                               <td>0.000</td>
                               <td>0.000</td>
                               <td>0.000</td>
                               <td>0.000</td>
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
    <jsp:include page="../../includes/footer.jsp">
        <jsp:param value="page/ad_report" name="loader"/>
    </jsp:include>
</body>
</html>
