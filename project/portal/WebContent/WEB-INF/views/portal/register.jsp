<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>注册</title>
<%@ include file="includes/style.jsp"%>
<link type="text/css" rel="stylesheet" href="/css/main.css" media="screen">
<style>
body {
	background: url("/img/bg-denim.png") !important
}

.register {
	margin-top: 50px;
	text-align: center;
	color: #C6C6C6;
}

.container {
	width: 600px;
	margin: 0 auto;
}

h1.title {
	border-bottom: 1px solid #2fbfca;
	text-align: left;
	padding-bottom: 10px;
}

h1 label {
	color: #2FBFCA;
	display: inline;
	font-size: 40px;
}

h1.link {
	color: #2FBFCA !important
}
form {
margin: 50px 0;
}
form .form-row .lbl {font-size: 16px; line-height: 37px; text-align: left;}
form .form-row .error {font-size: 14px;color: #F00;float: right;}
input {height: 37px !important; width: 100%;}
form .form-tab {height:50px;width: 315px; margin: 0 auto;}
.carousel-indicators {
position: relative;
text-align: center;
z-index: 5;
left: 0;
list-style: none;
}
.carousel-indicators li {
width: 140px;
height: 8px;
border: 1px solid #D2D2D2;
display: inline-block;
background: #F8F8F8;
background: -moz-linear-gradient(top, #F8F8F8 0%, #ECECEC 100%);
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#F8F8F8), color-stop(100%,#ECECEC));
background: -webkit-linear-gradient(top, #F8F8F8 0%,#ECECEC 100%);
background: -o-linear-gradient(top, #F8F8F8 0%,#ECECEC 100%);
background: -ms-linear-gradient(top, #F8F8F8 0%,#ECECEC 100%);
background: linear-gradient(to bottom, #F8F8F8 0%,#ECECEC 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f8f8f8', endColorstr='#ececec',GradientType=0 );
cursor: pointer;
text-indent: -9999px;
border-radius: 0;
-webkit-border-radius: 0;
-moz-border-radius: 0;
-ms-border-radius: 0;
position: relative;
}
.carousel-indicators .active {
background: #09C;
border: 1px solid #09C;
cursor: default;
filter: none !important;
}
.carousel-indicators li em {
position: absolute;
top: -25px;
font-size: 18px;
text-indent: 0;
display: block;
width: 100px;
padding-left: 18px;
font-style: normal;
}
.carousel-indicators li.active em {
color: #FACC5F;
}
div.uploader {width:292px;max-width:292px;}
#register-btn {display: inline; width: 40%;}
.red {color:red;}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body>
	<div class="lock-header">
		<!-- BEGIN LOGO -->
		<a href="index.html" id="logo" class="center"> <img
			src="/img/logo.png" alt="logo" class="center">
		</a>
		<!-- END LOGO -->
	</div>

	<div class="register">
		<div class="container">
			<h1 class="title">
				<label>注册</label>

				<span style="font-size: 14px; float: right;">
					已经拥有帐号？前去<a href="login.html" class="twt-color">登录</a>
				</span>
			</h1>

			<form:form commandName="regForm" method="post" enctype="multipart/form-data" onsubmit="return checkform();">
			    <div class="form-tab">
                    <form:hidden path="type" id="type" value="3" style="display: none;"/>
	                <ol class="carousel-indicators clearfix" id="rtype">
		                <li data-rid="3" class="active"><em>个人开发者</em></li>
		                <li data-rid="4" style="margin-left: 20px;"><em>公司</em></li>
		            </ol>
                </div>
			    
			    <div class="row-fluid">
					<div class="form-row span6">
						<label class="lbl">登录帐户<span class="red">*</span>：<span class="error"><form:errors path="userName"></form:errors></span></label>
						<form:input path="userName" id="userName" placeholder="输入您的用户名" />
					</div>
					
					<div class="form-row span6">
	                    <label class="lbl">邮箱地址<span class="red">*</span>：<span class="error"><form:errors path="email"></form:errors></span></label>
	                    <form:input path="email" id="email" placeholder="输入您的邮箱地址" />
	                </div>
                </div>
                
                <div class="row-fluid">
	                <div class="form-row span6">
	                    <label class="lbl">登录密码<span class="red">*</span>：<span class="error"><form:errors path="password"></form:errors></span></label>
	                    <form:password path="password" />
	                </div>
	                
	                <div class="form-row span6">
	                    <label class="lbl">确认密码<span class="red">*</span>：<span class="error"><form:errors path="confirmPassword"></form:errors></span></label>
	                    <form:password path="confirmPassword" />
	                </div>
                </div>
                
                <div class="row-fluid">
	                <div class="form-row span6">
	                    <label class="lbl">公司名称：<span class="error"><form:errors path="company"></form:errors></span></label>
	                    <form:input path="company" />
	                </div>
	                
	                <div class="form-row span6">
	                    <label class="lbl">联系人员：<span class="error"><form:errors path="contactName"></form:errors></span></label>
	                    <form:input path="contactName" placeholder="" />
	                </div>
                </div>
                
                <div class="row-fluid">
	                <div class="form-row span6">
	                    <label class="lbl">联系电话：<span class="error"><form:errors path="contactTel"></form:errors></span></label>
	                    <form:input path="contactTel" />
	                </div>
	                
	                <div class="form-row span6">
	                    <label class="lbl">QQ号码：<span class="error"><form:errors path="qq"></form:errors></span></label>
	                    <form:input path="qq" />
	                </div>
                </div>
                
                <div class="form-row">
                    <label class="lbl">网站地址：<span class="error"><form:errors path="website"></form:errors></span></label>
                    <form:input path="website" />
                </div>
                
                <div class="row-fluid" id="extrafields" style="display:none;">
	                <div class="form-row">
	                    <label class="lbl">证件号码：</label>
	                    <input type="text" name="credentialsNo"/>
	                </div>
	                
	                <div class="form-row">
	                    <label class="lbl">证件照片：<span class="error"></span></label>
	                    <div class="row-fluid">
		                    <div class="span6"><input type="file" name="file1" id="file1"/></div>
		                    <div class="span6"><input type="file" name="file2" id="file2"/></div>
	                    </div>
	                </div>
                </div>
                
                <div class="form-row" style="margin-top: 30px;text-align: center;">
                    <input type="submit" id="register-btn" class="btn btn-block login-btn" value="注    册">
                </div>
			</form:form>
		</div>
	</div>
	<script src="/js/jquery-1.8.3.min.js"></script>
	<script src="/js/uniform/jquery.uniform.js"></script>
	<script>
        $('input[type="file"]').uniform();
	    $("#rtype li").click(function() {
	    	var rid = $(this).attr("data-rid");
	    	$(this).addClass("active").siblings().removeClass("active");
	    	$("#type").val(rid);
	    	if (rid == "3") {
	    		$("#extrafields").hide();
	    	} else {
	    		$("#extrafields").show();
	    	}
	    });
	    var ftype = "gif|jpg|png";
	    $("#file1,#file2").change(function() {
	    	var surfix = $(this).val().substring($(this).val().length - 3);
	    	if (ftype.indexOf(surfix) < 0) {
	    		alert("只允许上传"+ftype+"类型的文件");
	    		$(this).val("");
	    		$(this).next(".filename").html("还没有选择文件");
	    	}
	    });
	    var errors = {};
	    $("#userName,#email").blur(function() {
            var that = $(this);
            var err = that.prev().find(".error");
            if (that.attr("id") == "email") {
            	if (!/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test(that.val())) {
            		err.html("不是有效的EMAIL地址").css("color", "red");
            		return false;
            	}
            } else {
            	if (that.val().length < 5) {
            		err.html("个数必须在5到20个字符").css("color", "red");
            		return false;
            	}
            }
            $.ajax({
                url: "/checkreg.html",
                data: {
                    email: $(this).val(),
                    userName: $(this).val()
                },
                success: function(data) {
                    if (data === false) {
                        err.html("还没有被注册，可以使用").css("color", "green");
                        errors[that.attr("id")] = false;
                    } else if (data === true) {
                        err.html("已经存在，请再换一个试试！").css("color", "red");
                        errors[that.attr("id")] = true;
                    }
                }
            });
        });
	    function checkform() {
	    	for (var err in errors) {
	    		if (errors[err] === true) {
	    			return false;
	    		}
	    	}
	    	return true;
	    }
        <c:if test="${type == 3}">$("#rtype li:first-child").trigger("click");</c:if>
        <c:if test="${type == 4}">$("#rtype li:last-child").trigger("click");</c:if>
	</script>
</body>
</html>