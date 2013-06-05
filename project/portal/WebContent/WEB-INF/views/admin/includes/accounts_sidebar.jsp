<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String uri = request.getRequestURI();
boolean isFinancialRemittanceHistory = uri.indexOf("/admin/financial/remittance_list") > 0;
%>
<div class="left_content">

	<div id="financial_sidebar" class="sidebar">
        <h2>
            <span><fmt:message key="side.financial"/></span>
        </h2>
        <ul>
            <li class="<%=isFinancialRemittanceHistory?"current":"" %>"><a href="/admin/financial/remittance_list"> <span> <fmt:message key="side.financial.remittance_history"/> </span></a></li>
        </ul>
    </div>
</div>
