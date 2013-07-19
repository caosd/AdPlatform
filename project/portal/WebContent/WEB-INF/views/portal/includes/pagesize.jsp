<%@ page language="java" pageEncoding="UTF-8"%>
<div class="noSearch">
	<select name="pageSize" class="chosen" style="width: 84px;">
		<option value="15" ${pageBean.pageSize==15 ? "selected":"" }>显示15条</option>
		<option value="30" ${pageBean.pageSize==30 ? "selected":"" }>显示30条</option>
		<option value="50" ${pageBean.pageSize==50 ? "selected":"" }>显示50条</option>
	</select>
</div>