<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title>汇款记录</title>
<%@include file="../includes/style.jsp"%>
</head>
<body>
    <%@include file="../includes/header.jsp"%>
    <div class="inside">
        <div class="container">
            <div id="content">
                <%@include file="../includes/sidebar.jsp"%>
                <div class="right_content">
                    <h2>汇款记录</h2>
                    <div class="box">
                       <table class="data">
                           <thead>
                             <tr>
                               <th>姓名</th>
                               <th>卡号</th>
                               <th>金额</th>
                               <th>取款时间</th>
                               <th>汇款时间</th>
                               <th>状态</th>
                               <th>备注</th>
                             </tr>
                           </thead>
                           <tbody>
                             <tr>
                               <td colspan="7">没有任何可显示的结果</td>
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
