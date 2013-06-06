<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/html_attributes.jsp" %>
<head>
<title> ... </title>
<%@include file="../includes/style.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/rich-push.css" media="screen" />
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="inside">
		<div class="container">
			<div id="content">
				<%@include file="../includes/sidebar.jsp"%>
				<div class="right_content">
					<h2><fmt:message key="push_title"/></h2>
                    
                    
                    
                    
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
						          <h4>Preview on</h4>
						          <ul>
						              <li><a href="#" class="iphone">iPhone</a></li>
						              <!-- <li><a href="#" class="ipad">iPad</a></li> -->
						          </ul>
						        </div>
						      </fieldset>
						      <div class="action">
						        <span class="alert"></span>
						        <img src="/images/circle-loader.gif" class="loader" />
						        <button rel="back" type="button">Back</button>
						        <button id="rp-step2-next" rel="next" type="button">保存并继续<span class="next"></span></button>
						      </div>
						    </div>
						    <div class="step" id="step-2">
						      <h2>创建通知<span class="sub message_title"></span></h2>
                              <fieldset>
                                <div class="module">
                                    <label for="title">Give Your Message a Title <span class="red">*</span></label>
                                    <input type="text" name="title" id="id_title" value="" placeholder="输入通知标题" maxlength="255" />
                                    You have <span id="title-preview-chars"></span> bytes left.
                                </div>
                              </fieldset>
						      
						      <div class="action">
						        <span class="alert"></span>
						        <img src="/images/circle-loader.gif" class="loader" />
						        <button rel="back" type="button">Back</button>
						        <button id="rp-step3-next" rel="next" type="button">保存并继续<span class="next"></span></button>
						      </div>
						    </div>
						    <div class="step" id="step-3">
						      <h2>Select Recipients <span class="sub message_title"></span></h2>
						      <div class="selection">
						        <h3><input type="radio" name="is_broadcast" value="1" id="select-recipient-all"checked="checked" /> <label for="select-recipient-all">All Users (Broadcast)</label></h3>
						        <p class="note">All users registered with this application will receive this message.</p>
						        <h3><input type="radio" name="is_broadcast" value="0" id="select-recipient-some" /> <label for="select-recipient-some">Some Users (By Tag)</label></h3>
						        <div class="module disabled" id="recipient-some">
						          <fieldset id="tag-search-box">
						            <input type="text" name="tag_search" id="tag_search" placeholder="Enter tag" disabled="disabled" />
						            <span id="tag_loader">
						             <span class="spinner"></span>
						            </span>
						            <ul id="tag-list">
						            </ul>
						          </fieldset>
						          <input type="hidden" name="tags" id="id_tags" value="" />
						          <div id="selected-tags"></div>
						        </div>
						      </div>
						      <div class="action">
						        <span class="alert"></span>
						        <img src="/images/circle-loader.gif" class="loader" />
						        <button rel="back" type="button">Back</button>
						        <button id="rp-step4-next" rel="next" type="button">Save and Review <span class="next"></span></button>
						      </div>
						    </div>
						    <div class="step" id="step-4">
						      <h2>Review <span class="sub message_title"></span></h2>
						      <div class="review-item">
						        <button rel="change" type="button">Change</button>
						        <h3>Rich Push</h3>
						        <p><strong>Title:</strong> <span id="display-title"></span></p>
						        <div class="preview">
						        <h4>Preview on</h4>
						            <ul>
						                <li><a href="#" class="iphone">iPhone</a></li>
						                <!-- <li><a href="#" class="ipad">iPad</a></li> -->
						            </ul>
						        </div>
						      </div>
						      <div class="review-item">
						        <button rel="change" type="button">Change</button>
						        <h3>Push Notification</h3>
						        <p>Push Notifications are Disabled</p>
						      </div>
						      <div class="review-item">
						        <button rel="change" type="button">Change</button>
						        <h3>Recipients</h3>
						        <p id="display-recipients"></p>
						        <p class="static error"><strong>Note</strong>: This application does not have any rich push users.</p>
						      </div>
						      <div class="action">
						        <img src="/images/circle-loader.gif" class="loader" />
						        <button rel="back" type="button">Back</button>
						        <button id="rp-step5-next" rel="later" type="submit">Save For Later</button>
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
						    <h2>Done <span class="sub message_title"></span></h2>
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
    <script type="text/javascript" src="/js/page/rich-push.js"></script>
</body>
</html>
