<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/config.jsp"%>
<head>
<style>
div.uploader{margin-right: 4px;}
input{width:235px;}
select{width:250px;}
.file {
display: inline-block;
width: 250px;
height: 35px;
*zoom: 1;
*display: inline;
}
</style>
</head>
<body>
<div class="row-fluid">
   <div class="span12">
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">财务管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">账户信息</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	 <div class="widget-header">
		<h5>账户信息</h5>
	 </div>
	  <div class="widget-body form" style="display: block;">
		<c:if test="${param.failed}">
              <div class="protip error">
                  <strong><fmt:message key="tips"/></strong> <fmt:message key="app_upload_failed"/>
              </div>
              </c:if>
              <c:if test="${param.success}">
              <div class="protip success">
                  <strong><fmt:message key="tips"/></strong> <fmt:message key="app_upload_success"/>
              </div>
              </c:if>
              <div class="bare-box">
                 <h3>公告: </h3>
                 <ul>
                        <li>1) 上传的照片需要图像和文字清晰.</li>
                        <li>2) 如果公司注册，上传营业执照扫描件即可.</li>
                        <li>3) 如果是一代身份证，正面即可，如果是二代身份证，需要上传证件的正反面.</li>
                        <li>4) 正反面文件一次上传. </li>
                        <li>5) 姓名和身份证号与您银行收款人姓名和身份证号相同. </li>
                        <li>6) 客服QQ：2359097716.</li>
                 </ul>
              </div>
		<c:if test="${not empty success}">
		<div class="protip success">
			<strong><fmt:message key="tips"/></strong> <fmt:message key="${success}"/>
		</div>
		</c:if>
		<c:if test="${not empty error}">
		<div class="protip warn">
			<strong><fmt:message key="tips"/></strong> <fmt:message key="${error}"/>
		</div>
		</c:if>
	    <!-- BEGIN FORM-->
	    <form:form commandName="credentialForm" method="POST" class="form-horizontal" enctype="multipart/form-data">
	       <div class="control-group">
	          <label class="control-label" for="credentialsType"> 证件类型 </label>
	          <div class="controls noSearch">
	             <form:select path="credentialsType" id="credentialsType" class="chosen">
                     <form:option value="1" selected="${credentials.credentialsType == 1 ? 'selected':'' }">居民身份证</form:option>
                     <form:option value="2" selected="${credentials.credentialsType == 2 ? 'selected':'' }">个体工商营业执照</form:option>
                 </form:select>
	             <form:errors path="credentialsType" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="credentialsNo"> 证件号 </label>
	          <div class="controls">
	             <form:input type="text" path="credentialsNo" value="${credentials.credentialsNo }"/>
                 <form:errors path="credentialsNo" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label"> 证件上传 </label>
	          <div class="controls">
                  <img width="250px" src="${empty credentials.credentialsPhoto1?"":imgServer}${empty credentials.credentialsPhoto1? '/img/identity_front.gif':credentials.credentialsPhoto1 }" class="identity_tile"/>
                  <img width="250px" src="${empty credentials.credentialsPhoto2?"":imgServer}${empty credentials.credentialsPhoto2? '/img/identity_behind.gif':credentials.credentialsPhoto2 }" class="identity_tile" style="margin-left: 30px;"/>
                  <div>
                      <a href="javascript:void(0);" class="file">
                          <input title="仅支持jpg,gif,png格式" name="file1" type="file" id="fileCtrl1" value=""/>
                      </a>
                      <a href="javascript:void(0);" class="file" style="margin-left: 30px;">
                          <input title="仅支持jpg,gif,png格式" name="file2" type="file" id="fileCtrl2" value=""/>
                      </a>
                  </div>
                  <div>
                      <div id="fileCtrlVal1" style="float: left;width: 240px;text-align: center;height: 20px;"><form:errors path="file1" cssClass="error"/></div>
                      <div id="fileCtrlVal2" style="float: left;width: 240px;margin-left: 25px;text-align: center;height: 20px;"><form:errors path="file2" cssClass="error"/></div>
                  </div>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="cardBank"> 开户银行 </label>
	          <div class="controls">
	             <form:select id="cardBank" path="bankName" class="chosen">
                    <option value="中国工商银行" <c:out value="${credentials.bankName eq '中国工商银行' ? 'selected':'' }"/>>中国工商银行</option>
                    <option value="中国农业银行" <c:out value="${credentials.bankName eq '中国农业银行' ? 'selected':'' }"/>>中国农业银行</option>
                    <option value="中国建设银行" <c:out value="${credentials.bankName eq '中国建设银行' ? 'selected':'' }"/>>中国建设银行</option>
                    <option value="招商银行" <c:out value="${credentials.bankName eq '招商银行' ? 'selected':'' }"/>>招商银行</option>
                    <option value="中国银行" <c:out value="${credentials.bankName eq '中国银行' ? 'selected':'' }"/>>中国银行</option>
                    <option value="兴业银行" <c:out value="${credentials.bankName eq '兴业银行' ? 'selected':'' }"/>>兴业银行</option>
                    <option value="交通银行" <c:out value="${credentials.bankName eq '交通银行' ? 'selected':'' }"/>>交通银行</option>
                    <option value="中信银行" <c:out value="${credentials.bankName eq '中信银行' ? 'selected':'' }"/>>中信银行</option>
                    <option value="深圳发展银行" <c:out value="${credentials.bankName eq '深圳发展银行' ? 'selected':'' }"/>>深圳发展银行</option>
                    <option value="浦发银行" <c:out value="${credentials.bankName eq '浦发银行' ? 'selected':'' }"/>>浦发银行</option>
                    <option value="北京农村商业银行" <c:out value="${credentials.bankName eq '北京农村商业银行' ? 'selected':'' }"/>>北京农村商业银行</option>
                    <option value="北京银行" <c:out value="${credentials.bankName eq '北京银行' ? 'selected':'' }"/>>北京银行</option>
                    <option value="中国民生银行" <c:out value="${credentials.bankName eq '中国民生银行' ? 'selected':'' }"/>>中国民生银行</option>
                    <option value="中国光大银行" <c:out value="${credentials.bankName eq '中国光大银行' ? 'selected':'' }"/>>中国光大银行</option>
                    <option value="华夏银行" <c:out value="${credentials.bankName eq '华夏银行' ? 'selected':'' }"/>>华夏银行</option>
                    <option value="温州银行" <c:out value="${credentials.bankName eq '温州银行' ? 'selected':'' }"/>>温州银行</option>
                    <option value="上海农村商业银行" <c:out value="${credentials.bankName eq '上海农村商业银行' ? 'selected':'' }"/>>上海农村商业银行</option>
                    <option value="渤海银行" <c:out value="${credentials.bankName eq '渤海银行' ? 'selected':'' }"/>>渤海银行</option>
                    <option value="晋城市商业银行" <c:out value="${credentials.bankName eq '晋城市商业银行' ? 'selected':'' }"/>>晋城市商业银行</option>
                    <option value="汉口银行" <c:out value="${credentials.bankName eq '汉口银行' ? 'selected':'' }"/>>汉口银行</option>
                    <option value="广东发展银行" <c:out value="${credentials.bankName eq '广东发展银行' ? 'selected':'' }"/>>广东发展银行</option>
                    <option value="宁波银行" <c:out value="${credentials.bankName eq '宁波银行' ? 'selected':'' }"/>>宁波银行</option>
                    <option value="浙商银行" <c:out value="${credentials.bankName eq '浙商银行' ? 'selected':'' }"/>>浙商银行</option>
                    <option value="杭州银行" <c:out value="${credentials.bankName eq '杭州银行' ? 'selected':'' }"/>>杭州银行</option>
                    <option value="BEA东亚银行" <c:out value="${credentials.bankName eq 'BEA东亚银行' ? 'selected':'' }"/>>BEA东亚银行</option>
                    <option value="南京银行" <c:out value="${credentials.bankName eq '南京银行' ? 'selected':'' }"/>>南京银行</option>
                    <option value="平安银行" <c:out value="${credentials.bankName eq '平安银行' ? 'selected':'' }"/>>平安银行</option>  
                    <option value="其他银行" <c:out value="${credentials.bankName eq '其他银行' ? 'selected':'' }"/>>其他银行</option>  
                </form:select>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="bankCard"> 银行卡号 </label>
	          <div class="controls">
	             <form:input type="text" path="bankCard" value="${credentials.bankCard }"/>
                 <span class="info">银行卡的户名必须同姓名一致!</span>
                 <form:errors path="bankCard" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="bankAccount"> 开户人姓名 </label>
	          <div class="controls">
	             <form:input type="text" path="bankAccount" value="${credentials.bankAccount }"/>
                 <span class="info2">办理此银行卡时所用真实姓名，请与身份证保持一致!</span>
                 <form:errors path="bankAccount" cssClass="error"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="bankAddress"> 银行地址 </label>
	          <div class="controls">
	             <form:input type="text" path="bankAddress" value="${credentials.bankAddress }"/>
                 <span class="info">格式为：xx省,xx市/县,xx支行/分行</span>
                 <form:errors path="bankAddress" cssClass="error"/>
	          </div>
	       </div>
	       <div class="form-actions">
	          <button type="submit" class="button button-blue">保存信息</button>
	       </div>
	    </form:form>
	    <!-- END FORM-->
	 </div>
</div>
<script>
$('#fileCtrl1').change(function() {
	checkFile($(this), $("#fileCtrlVal1"));
});
$('#fileCtrl2').change(function() {
    checkFile($(this), $("#fileCtrlVal2"));
});
function checkFile(el, tipCtrl) {
	var filePath = el.val();
    var surfix = filePath.substring(filePath.indexOf("."));
    if (".jpg" != surfix && ".gif" != surfix && ".png" != surfix && ".jpeg" != surfix) {
      tipCtrl.html('<span style="color:red">' + el.attr('title') + '</span>');
      el.val('');
    } else {
      tipCtrl.html(filePath);
    }
}
</script>
 </body>