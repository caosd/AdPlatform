<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
<div class="row-fluid">
   <div class="span12">
       <!-- BEGIN THEME CUSTOMIZER-->
       <div id="theme-change" class="hidden-phone">
           <i class="icon-cogs"></i>
            <span class="settings">
                <span class="text">Theme:</span>
                <span class="colors">
                    <span class="color-default" data-style="default"></span>
                    <span class="color-gray" data-style="gray"></span>
                    <span class="color-purple" data-style="purple"></span>
                    <span class="color-navy-blue" data-style="navy-blue"></span>
                </span>
            </span>
       </div>
       <!-- END THEME CUSTOMIZER-->
      <h3 class="page-title">
           	菜单列表
         <small>表单</small>
      </h3>
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">系统管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">菜单列表</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="row-fluid">
    <div class="span12">
        <!-- BEGIN EXAMPLE TABLE widget-->
        <div class="widget">
            <div class="widget-title">
                <h4><i class="icon-reorder"></i>Managed Table</h4>
                <span class="tools">
                    <a href="javascript:;" class="icon-chevron-down"></a>
                    <a href="javascript:;" class="icon-remove"></a>
                </span>
            </div>
            <div class="widget-body">
                <div id="sample_1_wrapper" class="dataTables_wrapper form-inline" role="grid"><div class="row-fluid"><div class="span6"><div id="sample_1_length" class="dataTables_length"><label><select size="1" name="sample_1_length" aria-controls="sample_1" class="input-mini"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> records per page</label></div></div><div class="span6"><div class="dataTables_filter" id="sample_1_filter"><label>Search: <input type="text" aria-controls="sample_1" class="input-medium"></label></div></div></div><table class="table table-striped table-bordered dataTable" id="sample_1" aria-describedby="sample_1_info">
                <thead>
                    <tr role="row"><th style="width: 24px;" class="sorting_disabled" role="columnheader" rowspan="1" colspan="1" aria-label=""><div class="checker" id="uniform-undefined"><span class=""><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" style="opacity: 0;"></span></div></th><th class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Username: activate to sort column ascending" style="width: 206px;">Username</th><th class="hidden-phone sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending" style="width: 386px;">Email</th><th class="hidden-phone sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Points: activate to sort column ascending" style="width: 137px;">Points</th><th class="hidden-phone sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Joined: activate to sort column ascending" style="width: 207px;">Joined</th><th class="hidden-phone sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=": activate to sort column ascending" style="width: 235px;"></th></tr>
                </thead>
                
            <tbody role="alert" aria-live="polite" aria-relevant="all"><tr class="gradeX odd">
                        <td class="  sorting_1"><div class="checker" id="uniform-undefined"><span class=""><input type="checkbox" class="checkboxes" value="1" style="opacity: 0;"></span></div></td>
                        <td class=" ">Jhone doe</td>
                        <td class="hidden-phone "><a href="mailto:jhone-doe@gmail.com">jhone-doe@gmail.com</a></td>
                        <td class="hidden-phone ">10</td>
                        <td class="center hidden-phone ">02.03.2013</td>
                        <td class="hidden-phone "><span class="label label-success">Approved</span></td>
                    </tr><tr class="gradeX even">
                        <td class="  sorting_1"><div class="checker" id="uniform-undefined"><span class=""><input type="checkbox" class="checkboxes" value="1" style="opacity: 0;"></span></div></td>
                        <td class=" ">gada</td>
                        <td class="hidden-phone "><a href="mailto:gada-lal@gmail.com">gada-lal@gmail.com</a></td>
                        <td class="hidden-phone ">34</td>
                        <td class="center hidden-phone ">08.03.2013</td>
                        <td class="hidden-phone "><span class="label label-warning">Suspended</span></td>
                    </tr><tr class="odd gradeX">
                        <td class="  sorting_1"><div class="checker" id="uniform-undefined"><span class=""><input type="checkbox" class="checkboxes" value="1" style="opacity: 0;"></span></div></td>
                        <td class=" ">soa bal</td>
                        <td class="hidden-phone "><a href="mailto:soa bal@yahoo.com">soa bal@yahoo.com</a></td>
                        <td class="hidden-phone ">33</td>
                        <td class="center hidden-phone ">1.12.2013</td>
                        <td class="hidden-phone "><span class="label label-success">Approved</span></td>
                    </tr><tr class="odd gradeX even">
                        <td class="  sorting_1"><div class="checker" id="uniform-undefined"><span class=""><input type="checkbox" class="checkboxes" value="1" style="opacity: 0;"></span></div></td>
                        <td class=" ">ram sag</td>
                        <td class="hidden-phone "><a href="mailto:soa bal@gmail.com">soa bal@gmail.com</a></td>
                        <td class="hidden-phone ">33</td>
                        <td class="center hidden-phone ">7.2.2013</td>
                        <td class="hidden-phone "><span class="label label-inverse">Blocked</span></td>
                    </tr><tr class="odd gradeX">
                        <td class="  sorting_1"><div class="checker" id="uniform-undefined"><span class=""><input type="checkbox" class="checkboxes" value="1" style="opacity: 0;"></span></div></td>
                        <td class=" ">durlab</td>
                        <td class="hidden-phone "><a href="mailto:soa bal@gmail.com">test@gmail.com</a></td>
                        <td class="hidden-phone ">33</td>
                        <td class="center hidden-phone ">03.07.2013</td>
                        <td class="hidden-phone "><span class="label label-success">Approved</span></td>
                    </tr><tr class="odd gradeX even">
                        <td class="  sorting_1"><div class="checker" id="uniform-undefined"><span class=""><input type="checkbox" class="checkboxes" value="1" style="opacity: 0;"></span></div></td>
                        <td class=" ">durlab</td>
                        <td class="hidden-phone "><a href="mailto:soa bal@gmail.com">lorem-ip@gmail.com</a></td>
                        <td class="hidden-phone ">33</td>
                        <td class="center hidden-phone ">05.04.2013</td>
                        <td class="hidden-phone "><span class="label label-success">Approved</span></td>
                    </tr><tr class="odd gradeX">
                        <td class="  sorting_1"><div class="checker" id="uniform-undefined"><span class=""><input type="checkbox" class="checkboxes" value="1" style="opacity: 0;"></span></div></td>
                        <td class=" ">sumon</td>
                        <td class="hidden-phone "><a href="mailto:soa bal@gmail.com">lorem-ip@gmail.com</a></td>
                        <td class="hidden-phone ">33</td>
                        <td class="center hidden-phone ">05.04.2013</td>
                        <td class="hidden-phone "><span class="label label-success">Approved</span></td>
                    </tr><tr class="odd gradeX even">
                        <td class="  sorting_1"><div class="checker" id="uniform-undefined"><span class=""><input type="checkbox" class="checkboxes" value="1" style="opacity: 0;"></span></div></td>
                        <td class=" ">bombi</td>
                        <td class="hidden-phone "><a href="mailto:soa bal@gmail.com">lorem-ip@gmail.com</a></td>
                        <td class="hidden-phone ">33</td>
                        <td class="center hidden-phone ">05.04.2013</td>
                        <td class="hidden-phone "><span class="label label-success">Approved</span></td>
                    </tr><tr class="odd gradeX">
                        <td class="  sorting_1"><div class="checker" id="uniform-undefined"><span class=""><input type="checkbox" class="checkboxes" value="1" style="opacity: 0;"></span></div></td>
                        <td class=" ">ABC ho</td>
                        <td class="hidden-phone "><a href="mailto:soa bal@gmail.com">lorem-ip@gmail.com</a></td>
                        <td class="hidden-phone ">33</td>
                        <td class="center hidden-phone ">05.04.2013</td>
                        <td class="hidden-phone "><span class="label label-success">Approved</span></td>
                    </tr><tr class="odd gradeX even">
                        <td class="  sorting_1"><div class="checker" id="uniform-undefined"><span class=""><input type="checkbox" class="checkboxes" value="1" style="opacity: 0;"></span></div></td>
                        <td class=" ">test</td>
                        <td class="hidden-phone "><a href="mailto:soa bal@gmail.com">lorem-ip@gmail.com</a></td>
                        <td class="hidden-phone ">33</td>
                        <td class="center hidden-phone ">05.04.2013</td>
                        <td class="hidden-phone "><span class="label label-success">Approved</span></td>
                    </tr></tbody></table><div class="row-fluid"><div class="span6"><div class="dataTables_info" id="sample_1_info">Showing 1 to 10 of 25 entries</div></div><div class="span6"><div class="dataTables_paginate paging_bootstrap pagination"><ul><li class="prev disabled"><a href="#">← Prev</a></li><li class="active"><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li class="next"><a href="#">Next → </a></li></ul></div></div></div></div>
            </div>
        </div>
        <!-- END EXAMPLE TABLE widget-->
    </div>
</div>
</body>