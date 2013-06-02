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
                <%@include file="../includes/accounts_sidebar.jsp"%>
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
                           <c:forEach items="${remittanceList}" var="remittance" varStatus="stat">
								<tr>
								<th>${remittance.bankAccount }</th>
								<td>${remittance.bankCard }</td>
								<td>${remittance.money }</td>
								<td>${remittance.createTime }</td>
								<td>${remittance.remittanceTime }</td>
								<td>
									<c:choose>
										<c:when test="${remittance.status == 0}">
										申请中
										</c:when>
										<c:otherwise>
										汇款成功
										</c:otherwise>
									</c:choose>
								<td>${remittance.remark }</td>
								</tr>
							</c:forEach>
							<c:if test="${fn:length(remittanceList) == 0 }">
	                             <tr>
	                               <td colspan="7">没有任何可显示的结果</td>
	                             </tr>
							</c:if>
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
