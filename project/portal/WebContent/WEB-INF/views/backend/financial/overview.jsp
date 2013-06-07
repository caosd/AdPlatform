<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title>财务信息</title>
<%@include file="../includes/style.jsp"%>
<style>
.bare-box {
    padding: 15px 30px;
}
.bare-box h3 {
    margin-bottom: 5px;
}
div.bluebox dl, form.blueform > ul, form.blueform fieldset {
padding: 0 0 5px 110px;
}
div.bluebox, form.blueform {
background: #FFF url(../images/bluebox.tile.small.png) repeat-y 0 0;
}
.info {
padding-left: 10px;
position: absolute;
font-style: italic;
color: #999;
}
.info2 {
padding-left: 8px;
font-style: italic;
color: #999;
}
.identity_tile {
width: 240px;
margin-right: 20px;
max-height: 320px;
}
form.blueform a.file {
width: 238px;
margin-right: 20px;
}
</style>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
			    <%@include file="../includes/accounts_sidebar.jsp"%>
			    <div class="right_content">
					<h2><fmt:message key="side.financial.overview"/></h2>
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
					<form:form commandName="credentialForm" method="POST" class="blueform" enctype="multipart/form-data">
						<ul class="form">
                            <li>
                                <label for="credentialsType"> 证件类型 </label> 
                                <form:select path="credentialsType">
                                    <form:option value="1" selected="${credentials.credentialsType == 1 ? 'selected':'' }">居民身份证</form:option>
                                    <form:option value="2" selected="${credentials.credentialsType == 2 ? 'selected':'' }">个体工商营业执照</form:option>
                                </form:select>
                            </li>
                            <li>
                                <label for="credentialsNo"> 证件号 </label> 
                                <form:input type="text" path="credentialsNo" value="${credentials.credentialsNo }"/>
                                <form:errors path="credentialsNo" cssClass="error"/>
                            </li>
                            <li>
                                <label> 证件上传 </label>
                                <div>
                                    <img src="${empty credentials.credentialsPhoto1?"":imgServer}${empty credentials.credentialsPhoto1? '/images/identity_front.gif':credentials.credentialsPhoto1 }" class="identity_tile"/>
                                    <img src="${empty credentials.credentialsPhoto2?"":imgServer}${empty credentials.credentialsPhoto2? '/images/identity_behind.gif':credentials.credentialsPhoto2 }" class="identity_tile"/>
                                    <div>
                                        <a href="javascript:void(0);" class="file">
                                            <span><em>+</em>选择证件照片</span>
                                            <input title="仅支持jpg,gif,png,jpeg格式" size="3" name="file1" type="file" id="fileCtrl1" value=""/>
                                        </a>
                                        <a href="javascript:void(0);" class="file">
                                            <span><em>+</em>选择证件照片</span>
                                            <input title="仅支持jpg,gif,png,jpeg格式" size="3" name="file2" type="file" id="fileCtrl2" value=""/>
                                        </a>
                                    </div>
                                    <div>
                                        <div id="fileCtrlVal1" style="float: left;width: 240px;text-align: center;height: 20px;"><form:errors path="file1" cssClass="error"/></div>
                                        <div id="fileCtrlVal2" style="float: left;width: 240px;margin-left: 25px;text-align: center;height: 20px;"><form:errors path="file2" cssClass="error"/></div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <label for="bankName"> 开户银行 </label> 
                                <form:select id="cardBank" path="bankName" style="width:176px;">
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
                            </li>
                            <li>
                                <label for="bankCard"> 银行卡号 </label> 
                                <form:input type="text" path="bankCard" style="width:200px" value="${credentials.bankCard }"/>
                                <span class="info">为确保结算安全，该项信息不能修改，如需变更，请联系客服!<br/>银行卡的户名必须同姓名一致!</span>
                                <form:errors path="bankCard" cssClass="error"/>
                            </li>
                            <li>
                                <label for="bankAccount"> 开户人姓名 </label> 
                                <form:input type="text" path="bankAccount" style="width:200px" value="${credentials.bankAccount }"/>
                                <span class="info2">办理此银行卡时所用真实姓名，请与身份证保持一致!</span>
                                <form:errors path="bankAccount" cssClass="error"/>
                            </li>
                            <li>
                                <label for="bankAddress"> 银行地址 </label> 
                                <form:input type="text" path="bankAddress" style="width:200px" value="${credentials.bankAddress }"/>
                                <span class="info">格式为：xx省,xx市/县,xx支行/分行　　　请认真核对<br/>为确保结算安全，该项信息不能修改，如需变更，请联系客服!</span>
                                <form:errors path="bankAddress" cssClass="error"/>
                            </li>
						</ul>
						<ul class="form">
							<li>
								<button id="btn_sub" type="submit">
									 保 存 
								</button>
							</li>
						</ul>
					</form:form>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
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
</html>
