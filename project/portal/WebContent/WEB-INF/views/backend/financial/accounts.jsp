<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title>账户信息</title>
<%@include file="../includes/style.jsp"%>
<style>

/* date range pickers */
#settings #date-range {
    height: 30px;
    padding: 0;
    display: none;
    position: absolute;
    top: 0;
    right: 0px;
    width: 150px;
    white-space: nowrap;
}
#settings #date-range input[type=text] {
    font-size:12px;
    height:23px;
    line-height:25px;
    padding:0 5px;
    text-align:center;
    width:80px;
}
#settings #date-range button.mini {
    height:25px;
    line-height:25px;
    vertical-align:top;
}
#settings #date-range #start-date-container,
#settings #date-range #end-date-container {
  position:relative;
}
#settings #date-range #start-date-container .date-picker,
#settings #date-range #end-date-container .date-picker {
    position: absolute;
    top: 20px;
    left: 0;
    display: none;
    z-index: 5;
}

#settings select[name="precision"] {
  bottom:15px;
  display:none;
  position:absolute;
  right:0;
}
</style>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
			    <%@include file="../includes/sidebar.jsp"%>
			    <div class="right_content">
					<h2>账户明细</h2>
					<div id="settings">
                      <div id="date-range" class="ready" style="display: block; right: 130px; opacity: 1; top: 4px; z-index: 1000;">
                        从&nbsp;
                        <span id="start-date-container"><input type="text" name="start" id="start" class="shorter"></span>
                        &nbsp;至&nbsp;
                        <span id="end-date-container"><input type="text" name="end" id="end" class="shorter"></span>
                        <button class="mini">查询</button>
                      </div>
                    </div>
					<div class="box">
					   <table class="data">
					       <thead>
					         <tr>
					           <th>序号</th>
					           <th>推送广告</th>
					           <th>视频广告</th>
					           <th>酷仔收入</th>
                               <th>广告条收入</th>
                               <th>富媒体收入</th>
                               <th>余额</th>
                               <th>盈利时间</th>
                               <th>入账时间</th>
                               <th>说明</th>
                             </tr>
					       </thead>
					       <tbody>
					         <tr>
					           <td colspan="10">没有任何可显示的结果</td>
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
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>
