<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
<title>反馈信息</title>
<%@include file="/WEB-INF/view/common/taglib.jsp" %>
<link href="<%=basePath %>/static/common/font/iconfont.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=basePath%>/static/weui/weui.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/weui/jquery-weui.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/teacherservice/weixin/book/css/index.css">
<style type="text/css">
	.weui-select{padding-left:0!important;}
	input::-webkit-input-placeholder { /* WebKit browsers */ text-align: left;color:#ccc;font-size:14px;  } 
	input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ text-align: left;color:#ccc;font-size:14px;   } 
	input:-ms-input-placeholder { /* Internet Explorer 10 */ text-align: left; color:#ccc;font-size:14px;  } 
	input::placeholder { text-align: left;color:#ccc;font-size:14px;   }
	textarea::-webkit-input-placeholder { /* WebKit browsers */ text-align: left;color:#ccc;font-size:14px; } 
	textarea:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ text-align: left;color:#ccc;font-size:1px;  } 
	textarea:-ms-input-placeholder { /* Internet Explorer 10 */ text-align: left; color:#ccc; font-size:14px;} 
	textarea::placeholder { text-align: left;color:#ccc; font-size:14px; } 
	.clearfix::after,
	.clearfix::before{
		content: ".";
		line-height: 0;
		height: 0;
		display: block;
		visibility: hidden;
		clear: both;
	}
	body{
	  background:#f5f5f5;
	}
	.top-box{
	  height:50px;
	}
	.top-img{
	 width:90px;
	 height:30px;
	 margin:10px 0;
	 padding:0;
	 margin-left:10px;
	}
	.weui-label{
	  color:#009688;
	  width:80px;
	}
	.weui-input{
	 height:30px;
	 border-radius:4px;
	 background:white;
	 font-size:14px;
	}
	.weui-btn-area{
	  width:86%;
	  background:#009688;
	  margin:0 auto;
	  border-radius:4px;
	  margin-top:40px;
	  
	}
	.weui-btn_primary{	   
      background:#009688 !important;
      border:none; 
          	
	}
	textarea{
	  border-radius:4px;
	  font-size:14px;
	}
	.top-word{
	   font-size:16px;
	   margin-top:15px;
	}
</style>
</head>
<body ontouchstart>
<div class="top-box">
	<img class="top-img" src="<%=basePath %>/static/teacherservice/weixin/book/images/logo.png">
    <div class="clearfix"></div>
</div>
	<div class="weui-cells_form">
		<div class="weui-cell">
			<div class="weui-cell__hd">
			<label class="weui-label">书籍名称:</label>
			</div>
			<div class="weui-cell__bd">
			<input class="weui-input"  style="text-align:left;" name="bookName" id="bookName" placeholder="&nbsp;请输入书籍名称" type="text" />
		   </div>
		</div>
	
		<div class="weui-cell">
			<div class="weui-cell__hd">
			<label class="weui-label">书籍作者:</label>
			</div>
			<div class="weui-cell__bd">
			 <input class="weui-input"  style="text-align:left;" name="bookAuthor"  id="bookAuthor" placeholder="&nbsp;请输入书籍作者" type="text"/>
		    </div>
		</div>
		
		<div class="weui-cell">
			<div class="weui-cell__hd">
			<label class="weui-label">推荐理由:</label>
			</div>
			<div class="weui-cell__bd">
			 <textarea class="weui-textarea" style="text-align:left;" placeholder="&nbsp;请输入推荐理由"  rows="5" name="reason" id="reason"></textarea>
		    </div>
		</div>
		
	   <div class="weui-btn-area">
         <a id="showTooltips" class="weui-btn weui-btn_primary" href="javascript:save()">保存</a>
       </div>	
	</div>
</body>
<script type="text/javascript" src="<%=basePath%>/static/jquery/jquery-weui.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/teacherservice/weixin/book/js/myFeedBack.js"></script>
</html>