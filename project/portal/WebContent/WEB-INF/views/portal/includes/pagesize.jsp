<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="noSearch">
    <form:select path="pageSize" class="chosen" style="width: 84px;">
        <form:option value="15">显示15条</form:option>
		<form:option value="30">显示30条</form:option>
		<form:option value="50" >显示50条</form:option>
    </form:select>
</div>