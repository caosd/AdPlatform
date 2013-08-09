<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
<div class="row-fluid">
   <div class="span12">
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">用户管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">驳回理由</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	 <div class="widget-header">
		<h5>用户审核不通过驳回理由</h5>
	 </div>
	  <div class="widget-body form" style="display: block;">
	    <c:if test="${success != null}">
            <div class="note ${success ? 'note-success' :'note-danger'}" style="margin: 20px 30px;">
                <button type="button" class="close note-remove">×</button>
                <strong><fmt:message key="tips"/></strong> 
                <c:choose>
                	<c:when test="${success}">
                		发送驳回理由成功。
                	</c:when>
                	<c:otherwise>
                		发送驳回理由失败。
                	</c:otherwise>
                </c:choose>
            </div>
        </c:if>
	    <!-- BEGIN FORM-->
	    <form method="POST" class="form-horizontal">
	       <div class="control-group">
	          <label class="control-label" for="userName">用户名:</label>
	          <div class="controls">
	          	  <input type="hidden" name="id" value="${user.uid }"/>
	              ${user.userName }
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="describe">理由描述:</label>
	          <div class="controls">
	             <textarea name="describe" class="span6" rows="6" cols="30"></textarea>
	             <form:errors path="describe" cssClass="error"/>
	          </div>
	       </div>
	       <div class="form-row" style="padding-left: 180px;">
				<button type="submit" class="button button-blue">发送</button>
	         	<button type="button" class="button" onclick="javascript:document.location.href='/accounts/userReviewList.html'">取消</button>
		   </div>
	    </form>
	    <!-- END FORM-->
	 </div>
</div>
 </body>