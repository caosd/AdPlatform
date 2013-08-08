<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<style>
table.menus td.h {
width: 14%;
padding-left: 10px;
}
table.menus td {
vertical-align: middle;
border: 1px solid #CBCBCB;
}
label.g{
display: block;
margin: 0 10px;
line-height: 36px;
float: left;
}
</style>
</head>
<body>
    <div class="row-fluid">
        <div class="span12">
            <ul class="breadcrumb">
                <li><a href="/"><i class="icon-home"></i></a><span
                    class="divider">&nbsp;</span></li>
                <li><a href="#">系统管理</a> <span class="divider">&nbsp;</span></li>
                <li><a href="#">修改角色权限</a><span class="divider-last">&nbsp;</span></li>
            </ul>
        </div>
    </div>
    <div class="widget">
        <div class="widget-header">
            <h5>
                修改 <font color="red">${role.roleName }</font> 权限
            </h5>
        </div>
        <div class="widget-body form" style="display: block;">
            <c:if test="${msg != null}">
                <div class="note ${success ? 'note-success' :'note-danger'}" style="margin: 20px 30px;">
                    <button type="button" class="close note-remove">×</button>
                    <strong>提示：</strong> ${msg}
                </div>
            </c:if>
            <!-- BEGIN FORM-->
            <form id="roleMenuForm" method="POST" class="form-horizontal">
                <input type="hidden" name="id" value="${role.id}" />
                <table class="menus">
                    <c:forEach var="menu" items="${menuList }">
                    <tr>
                        <td class="h"><label class="g"><input type="checkbox" class="parents parents-${menu.id }" id="${menu.id}" value="${menu.id}" name="menuIdArr" />&nbsp;&nbsp;${menu.name}</label></td>
                        <td>
                            <c:forEach var="submenu" items="${menu.sunMenu }">
                            <label class="g">${assignationMap["1"] }
                                <input type="checkbox" id="${submenu.id}" value="${submenu.id}" name="menuIdArr" class="sub sub-${menu.id }" data-parents="${menu.id }" />
                                &nbsp;&nbsp;${submenu.name}&nbsp;&nbsp;<span style="color:blue">${not empty submenu.desc? submenu.desc:"" }</span>
                            </label>
                            </c:forEach>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
                <div class="form-actions">
                    <button type="submit" class="button button-blue"> 保  存 </button>
                </div>
            </form>
            <!-- END FORM-->
        </div>
    </div>
	<script type="text/javascript">
    (function() {
        var selected = ${selected };
        var el;
        for (var i=0,len=selected.length; i<len; i++) {
        	el = document.getElementById(selected[i]);
        	if (el) el.checked = "checked";
        }
        
        $("input.parents").click(function() {
        	var list = $(".sub-"+$(this).val());
        	if ($(this).is(":checked")) {
        		list.attr("checked", true);
        		list.parent("span").addClass("checked");
        	} else {
        		list.attr("checked", false);
                list.parent("span").removeClass("checked");
        	}
        });
        $(".sub").click(function() {
        	var pid = $(this).attr("data-parents");
        	var parents = $(".parents-"+pid);
        	var selen = $(".sub-"+pid+":checked").length;
        	if (selen > 0) {
        		parents.attr("checked", true);
        		parents.parent("span").addClass("checked");
        	} else {
        		parents.attr("checked", false);
                parents.parent("span").removeClass("checked");
            }
        });
    })();
    </script>
</body>

