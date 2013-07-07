<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
       <ul class="breadcrumb">
           <li>
               <a href="/"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
           </li>
           <li>
               <a href="#">财务管理</a> <span class="divider">&nbsp;</span>
           </li>
           <li><a href="#">申请汇款</a><span class="divider-last">&nbsp;</span></li>
       </ul>
   </div>
</div>
<div class="widget">
	 <div class="widget-title">
	    <h4><i class="icon-reorder"></i>申请汇款</h4>
	    <span class="tools">
	       <a href="javascript:;" class="icon-chevron-down"></a>
	       <a href="javascript:;" class="icon-remove"></a>
	    </span>
	 </div>
	  <div class="widget-body form" style="display: block;">
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
	    <!-- BEGIN FORM-->
	    <form  method="POST" class="form-horizontal">
	       <div class="control-group">
	          <label class="control-label" for="balance"> 账户余额 </label>
	          <div class="controls">
	             <span style="color:red;line-height: 35px;">${userAccount.balance}元（人民币）</span>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" for="money"> 取款金额 </label>
	          <div class="controls">
	             <input name="money" type="text" placeholder="金额最小单位为元"/>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label"> 银行账户信息  </label>
	          <div class="controls">
                  <div style="color:red;padding-top: 7px;">
                     <c:if test="${not empty credentials.bankCard }">
                       ${credentials.bankName}：${credentials.bankCard}
                     </c:if>
                     <c:if test="${empty credentials.bankCard }">
                                                                                                           您还未设置账户信息, <a href="/financial/overview">现在就去填写。</a>
                     </c:if>
                  </div>
	          </div>
	       </div>
	       <div class="control-group">
	          <label class="control-label" > 产品合作<br/>责任协议 </label>
	          <div class="controls">
	             <iframe src="/html/RemittanceAgreement.html" frameborder="0" scrolling="no" style="width: 100%; height: 350px; border: 2px;"></iframe>
                 <div class="agreementlbl">
                     <label for="yes"><input  name="agree" id="yes" type="radio" value="1">&nbsp;已经阅读并同意</label>
                     <label for="no"><input name="agree" id="no" type="radio" value="2" checked="checked">&nbsp;我不同意</label>
                 </div>
	          </div>
	       </div>
	       <div class="form-actions">
	          <button type="submit" class="btn btn-success">保存</button>
	          <button type="button" class="btn">取消</button>
	       </div>
	    </form>
	    <!-- END FORM-->
	 </div>
</div>
<script type="text/javascript">
$('.agreementlbl input[type=radio]').click(function() {
	$('#btn_sub').attr("disabled",$(this).val() != 1);
});
</script>
 </body>