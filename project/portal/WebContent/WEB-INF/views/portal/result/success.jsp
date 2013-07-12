<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<div style="position: relative; width: 700px; height: 440px; margin: 0 auto; margin-top: 100px;">
		 <c:if test="${success != null}">
           <div class="note note-danger" style="margin: 20px 30px;">
               <button type="button" class="close note-remove">×</button>
               <strong><fmt:message key="tips"/></strong> 
               <c:choose>
               	<c:when test="${success=='del'}">
               		删除成功。
               	</c:when>
               	<c:otherwise>
               		未知操作结果。
               	</c:otherwise>
               </c:choose>
           </div>
           </c:if>
		 <fmt:message key=""/>
		 <c:if test="${goto != null}">
		 	<a href="${goto}">返回</a>
		 </c:if>
	</div>
</body>
