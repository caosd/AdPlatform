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
			    <%@include file="../includes/sidebar.jsp"%>
			    <div class="right_content">
					<h2><fmt:message key="app_upload_title"/></h2>
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
					<form method="POST" class="blueform" enctype="multipart/form-data">
						<ul class="form">
                            <li>
                                <label> 证件类型 </label> 
                                <select>
                                    <option value="">居民身份证</option>
                                    <option value="">个体工商营业执照</option>
                                </select>
                            </li>
                            <li>
                                <label> 证件号 </label> 
                                <input type="text"/>
                            </li>
                            <li>
                                <label> 证件上传 </label>
                                <div>
                                    <img src="/images/identity_front.gif" class="identity_tile"/>
                                    <img src="/images/identity_behind.gif" class="identity_tile"/>
                                    <div>
                                        <a href="javascript:void(0);" class="file">
                                            <span><em>+</em>选择证件照片</span>
                                            <input title="支持jpg,gif,png格式" size="3" name="file1" type="file" id="fileCtrl1">
                                        </a>
                                        <a href="javascript:void(0);" class="file">
                                            <span><em>+</em>选择证件照片</span>
                                            <input title="支持jpg,gif,png格式" size="3" name="file2" type="file" id="fileCtrl2">
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <label> 开户银行 </label> 
                                <select id="cardBank" name="finance.cardBank" style="width:176px;">
				                    <option value="中国工商银行">中国工商银行</option>
				                    <option value="中国农业银行">中国农业银行</option>
				                    <option value="中国建设银行">中国建设银行</option>
				                    <option value="招商银行">招商银行</option>
				                    <option value="中国银行">中国银行</option>
				                    <option value="兴业银行">兴业银行</option>
				                    <option value="交通银行">交通银行</option>
				                    <option value="中信银行">中信银行</option>
				                    <option value="深圳发展银行">深圳发展银行</option>
				                    <option value="浦发银行">浦发银行</option>
				                    <option value="北京农村商业银行">北京农村商业银行</option>
				                    <option value="北京银行">北京银行</option>
				                    <option value="中国民生银行">中国民生银行</option>
				                    <option value="中国光大银行">中国光大银行</option>
				                    <option value="华夏银行">华夏银行</option>
				                    <option value="温州银行">温州银行</option>
				                    <option value="上海农村商业银行">上海农村商业银行</option>
				                    <option value="渤海银行">渤海银行</option>
				                    <option value="晋城市商业银行">晋城市商业银行</option>
				                    <option value="汉口银行">汉口银行</option>
				                    <option value="广东发展银行">广东发展银行</option>
				                    <option value="宁波银行">宁波银行</option>
				                    <option value="浙商银行">浙商银行</option>
				                    <option value="杭州银行">杭州银行</option>
				                    <option value="BEA东亚银行">BEA东亚银行</option>
				                    <option value="南京银行">南京银行</option>
				                    <option value="平安银行">平安银行</option>  
				                    <option value="其他银行">其他银行</option>  
				                </select>
                            </li>
                            <li>
                                <label> 银行卡号 </label> 
                                <input type="text" style="width:200px"/>
                                <span class="info">为确保结算安全，该项信息不能修改，如需变更，请联系客服!<br/>银行卡的户名必须同姓名一致!</span>
                            </li>
                            <li>
                                <label> 开户人姓名 </label> 
                                <input type="text" style="width:200px"/>
                                <span class="info2">办理此银行卡时所用真实姓名，请与身份证保持一致!</span>
                            </li>
                            <li>
                                <label> 银行地址 </label> 
                                <input type="text" style="width:200px"/>
                                <span class="info">格式为：xx省,xx市/县,xx支行/分行　　　请认真核对<br/>为确保结算安全，该项信息不能修改，如需变更，请联系客服!</span>
                            </li>
						</ul>
						<ul class="form">
							<li>
								<button id="btn_sub" type="submit">
									 保 存 
								</button>
							</li>
						</ul>
					</form>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>
