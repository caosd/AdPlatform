<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title> 富广告推送 </title>
<%@include file="../includes/style.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/rich-push.css?139885534" media="screen" />
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../includes/sidebar.jsp"%>
				<div class="right_content">
                    
                    
                    
                    <div class="rich-push-composer">
						<ul id="rich-push-steps">
						  <li style="z-index: 6;"><a href="#" id="step-nav-0" class="active">开始创建</a></li>
						  <li style="z-index: 5;"><a href="#" id="step-nav-1">创建消息</a></li>
						  <li style="z-index: 4;"><a href="#" id="step-nav-2">创建通知</a></li>
						  <li style="z-index: 3;"><a href="#" id="step-nav-3">接收者</a></li>
						  <li style="z-index: 2;"><a href="#" id="step-nav-4">预览</a></li>
						  <li style="z-index: 1;"><a href="#" id="step-nav-5">完成</a></li>
						</ul>
						<div class="module" id="step-container">
						  <form action="/apps/${app.key }/rich-push/" method="post" id="rich-push-form">
						    <div class="step" id="step-0" >
						      <h2>选择一个样式</h2>
						      <div id="template-selection">
						        <div id="template-1" link-data='/html/templates/rich.html' class="template selected"><span>Rich</span></div>
						        <input type="hidden" name="template" id="template" value="template-1" />
						      </div>
						      <div class="action">
						        <span class="alert"></span>
						        <img src="/images/circle-loader.gif" class="loader" />
						        <button id="rp-step1-next" rel="next" type="button">开始创建推送消息<span class="next"></span></button>
						      </div>
						    </div>
						    <div class="step" id="step-1">
						      <h2>创建消息</h2>
						      <fieldset>
						        <textarea name="display_message" id="display_message" rows="10" cols="100" class="editor"></textarea>
						        <div class="preview">
						          <h4>预览</h4>
						          <ul>
						              <li><a href="#" class="iphone">iPhone</a></li>
						              <!-- <li><a href="#" class="ipad">iPad</a></li> -->
						          </ul>
						        </div>
						      </fieldset>
						      <div class="action">
						        <span class="alert"></span>
						        <img src="/images/circle-loader.gif" class="loader" />
						        <button rel="back" type="button">返回</button>
						        <button id="rp-step2-next" rel="next" type="button">保存并继续<span class="next"></span></button>
						      </div>
						    </div>
						    <div class="step" id="step-2">
						      <h2>创建通知<span class="sub message_title"></span></h2>
                              <fieldset>
                                <div class="module">
                                    <label for="title">给您的通知一个标题<span class="red">*</span></label>
                                    <input type="text" name="title" id="id_title" value="" placeholder="输入通知标题" maxlength="255" />
                                    <p style="font-size: 12px;font-style: italic;color: #8A8A8A;margin: 10px 0 0 5px">还剩下 <span id="title-preview-chars"></span> 个字可以输入。</p>
                                </div>
                              </fieldset>
                              <fieldset>
							      <div class="module" id="previews">
					                <a href="javascript:;" id="preview-scroller-prev">Previous</a>
					                <div id="preview-scroller">
					                  <div id="preview-android" class="preview">
					                    <span style="display: block;"></span>
					                      <h3>${empty app.name?"你的应用":app.name }</h3>
					                      <p></p>
					                      <h6></h6>
					                  </div>
					                </div>
					                <a href="javascript:;" id="preview-scroller-next">Next</a>
					                <div id="preview-position"><span class="active">•</span></div>
					              </div>
						      </fieldset>
						      <div class="action">
						        <span class="alert"></span>
						        <img src="/images/circle-loader.gif" class="loader" />
						        <button rel="back" type="button">返回</button>
						        <button id="rp-step3-next" rel="next" type="button">保存并继续<span class="next"></span></button>
						      </div>
						    </div>
						    <div class="step" id="step-3">
						      <h2>选择接收者</h2>
						      <div class="selection">
						        <h3><input type="radio" name="is_broadcast" value="1" id="select-recipient-all"checked="checked" /> <label for="select-recipient-all">所有用户 (广播)</label></h3>
						        <p class="note">所有的注册广告的用户都会接收到。</p>
						      </div>
						      <div class="action">
						        <span class="alert"></span>
						        <img src="/images/circle-loader.gif" class="loader" />
						        <button rel="back" type="button">返回</button>
						        <button id="rp-step4-next" rel="next" type="button">保存并预览<span class="next"></span></button>
						      </div>
						    </div>
						    <div class="step" id="step-4">
						      <h2>预览</h2>
						      <div class="review-item">
						        <button rel="change" type="button">修改</button>
						        <h3>富广告推送</h3>
						        <p><strong>通知标题:</strong> <span id="display-title"></span></p>
						        <div class="preview">
						        <h4>预览</h4>
						            <ul>
						                <li><a href="#" class="iphone">iPhone</a></li>
						                <!-- <li><a href="#" class="ipad">iPad</a></li> -->
						            </ul>
						        </div>
						      </div>
						      <div class="review-item">
						        <button rel="change" type="button">修改</button>
						        <h3>推送</h3>
						        <p>推送已经关闭</p>
						      </div>
						      <div class="review-item">
						        <button rel="change" type="button">修改</button>
						        <h3>接收者</h3>
						        <p id="display-recipients"></p>
						      </div>
						      <div class="action">
						        <img src="/images/circle-loader.gif" class="loader" />
						        <button rel="back" type="button">返回</button>
						        <button id="rp-step5-next" rel="later" type="button">保存</button>
						      </div>
						      <input type="hidden" name="payload" id="id_payload" value="" />
						      <input type="hidden" name="rich_push_history_id" id="id_rich_push_history_id" value="" />
						      <input type="hidden" name="message" id="id_message" value="" />
						      <input type="hidden" name="ready_to_deliver" id="id_ready_to_deliver" value="" />
						      <input type="hidden" name="save_for_later" id="id_save_for_later" value="" />
						      <input type="hidden" name="custom_keys" id="id_custom_keys" value="" />
						    </div>
						  </form>
						  <div class="step" id="step-5">
						    <h2>Done</h2>
						  </div>
						</div>
						</div>
                    
                    
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/js/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript" src="/js/page/rich-push.js?139885534"></script>
</body>
</html>
