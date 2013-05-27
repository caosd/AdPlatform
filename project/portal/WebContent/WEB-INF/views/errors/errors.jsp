<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int code = response.getStatus();
if (code == 404) {
	response.sendRedirect("404.jsp");
} else if (code >= 500) {
	response.sendRedirect("50x.jsp");
}
%>