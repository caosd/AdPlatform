<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<div style="position: relative; width: 700px; height: 440px; margin: 0 auto; margin-top: 100px;">
		<%String success = request.getParameter("success"); 
		  String _goto = request.getParameter("_goto"); 
		  if(success != null){ 
		 %>
           <div class="note note-success" style="margin: 20px 30px;">
               <button type="button" class="close note-remove">×</button>
               <strong><fmt:message key="tips"/></strong> 
               <% if(success.equals("del")){  %>
               		删除成功。
               <%}else{ %>
               		未知操作结果。
               <%} %>
           </div>
          <%} %>
		 <%if(_goto != null){  %>
		 	<a href="<%=_goto%>">返回</a>
		 <%} %>
	</div>
</body>
