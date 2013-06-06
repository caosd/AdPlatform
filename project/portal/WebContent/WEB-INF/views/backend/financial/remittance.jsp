<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title>汇款申请</title>
<%@include file="../includes/style.jsp"%>
<style>
.bare-box {
    padding: 15px 30px;
}
.bare-box h3 {
    margin-bottom: 5px;
}
div.bare-box > ul {
margin-left: 35px;
}
div.bare-box > ul > li {
list-style-type: decimal;
}
div.bluebox dl, form.blueform > ul, form.blueform fieldset {
padding: 0 0 5px 110px;
}

div.bluebox, form.blueform {
background: #FFF url(../images/bluebox.tile.small.png) repeat-y 0 0;
}
.protip .close {
float: right;
}
div.agreementlbl > label {
margin: 0;
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
					<h2>汇款申请</h2>

                    <c:if test="${not empty error}">
                    <div class="protip warn">
                      <strong>提示：</strong> <fmt:message key="${error}"></fmt:message>
                    </div>
                    </c:if>
                    <c:if test="${not empty success}">
                    <div class="protip success">
                      <strong>提示：</strong> <fmt:message key="${success}"></fmt:message>
                    </div>
                    </c:if>
                    <div class="protip warn">
                      <a href="javascript:;" class="close" data-dismiss="alert">&times;</a>
                      <strong>好消息!</strong> 2012年全年由酷果代交税款 ( 包括0.5%的手续费 )
                    </div>
					
					<div class="bare-box">
                       <h3>公告: </h3>
                       <ul>
                           <li>账户余额满100元即可申请取款,每次提款最低金额不得低于100元人民币。</li>
                           <li>每周申请取款时间为每周三中午12点前，每周四进行汇款，如遇节假日顺延。</li>
                           <li>确认取款提交成功后3个工作日内将相应款项汇入登记帐户。</li>
                           <li>如果收款方为个人账户，汇款时将代扣0.5%的汇款手续费和5.5%的营业税。<br/>如果收款方为对公账户，需要在汇款之前开具相应金额的发票，免扣税及手续费。</li>
                       </ul>
                    </div>
                    <form method="POST" class="blueform">
                        <ul class="form">
                            <li>
                                <label> 账户余额 </label> 
                                <span style="color:red;line-height: 35px;">${userAccount.balance}元（人民币）</span>
                            </li>
                            <li>
                                <label> 取款金额 </label> 
                                <input name="money" type="text" placeholder="金额最小单位为元"/>
                                <span>元(人民币)</span>
                            </li>
                            <li>
                                <label> 银行账户信息 </label> 
                                <div style="color:red;padding-top: 7px;">
                                <c:if test="${not empty credentials.bankCard }">
                                  ${credentials.bankName}：${credentials.bankCard}
                                </c:if>
                                <c:if test="${empty credentials.bankCard }">
                                  您还未设置账户信息, <a href="/financial/overview">现在就去填写。</a>
                                </c:if>
                                </div>
                            </li>
                            <li>
                                <label> 产品合作<br/>责任协议 </label> 
                                <iframe src="/html/RemittanceAgreement.html" frameborder="0" scrolling="no" style="width: 100%; height: 350px; border: 2px;"></iframe>
                                <div class="agreementlbl">
                                    <label for="yes"><input  name="agree" id="yes" type="radio" value="1">&nbsp;已经阅读并同意</label>
                                    <label for="no"><input name="agree" id="no" type="radio" value="2" checked="checked">&nbsp;我不同意</label>
                                </div>
                            </li>
                        </ul>
                        <ul class="form">
                            <li>
                                <button id="btn_sub" type="submit" disabled="disabled">
                                     取款
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
    <script type="text/javascript">
    $('.agreementlbl input[type=radio]').click(function() {
    	$('#btn_sub').attr("disabled",$(this).val() != 1);
    });
    </script>
</body>
</html>
