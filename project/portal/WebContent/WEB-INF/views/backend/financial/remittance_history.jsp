<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<%@include file="../includes/style.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/tablereport.css" media="screen">
</head>
<body>
    <%@include file="../includes/header.jsp"%>
    <div class="inside">
        <div class="container">
            <div id="content">
                <%@include file="../includes/accounts_sidebar.jsp"%>
                <div class="right_content">
                    <h2>汇款记录</h2>
            		<div id="settings">
						<form:form commandName="remittanceParamForm" method="POST" action="/financial/remittance_history">
		                      <div id="date-range" class="ready" style="display: block; opacity: 1; top: 4px; z-index: 1000;">
		                        从&nbsp;
		                        <span id="start-date-container"><form:input type="text" path="startDatestr" class="shorter" value=""/></span>
		                        &nbsp;至&nbsp;
		                        <span id="end-date-container"><form:input type="text" path="endDatestr" class="shorter" value=""/></span>
		                        &nbsp;&nbsp;
		                        <button class="mini">查询</button>
		                      </div>
		                </form:form>
                     </div>
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
								<td><fmt:formatDate value="${remittance.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><fmt:formatDate value="${remittance.remittanceTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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
                       ${pager}
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <jsp:include page="../includes/footer.jsp">
    	<jsp:param value="page/ad_report" name="loader"/>
    </jsp:include>
</body>
</html>
