<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
		<title></title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<%@include file="/WEB-INF/view/common/taglib.jsp" %>
</head>
	<body>
		<div class="alertFrom">
			<form class="layui-form" id="addForm" action="" method="post">
			 <input type="hidden" name="ruleId" id="ruleId" value="${ruleId}">				
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 150px;">发件服务器地址</label>
					<div class="layui-input-inline">
						<input type="text" name="sendServerHost" id="sendServerHost" lay-verify="required"  placeholder="例如:mailbj.xdf.cn" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux"><font color="red">*</font></div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 150px;">用户账号</label>
					<div class="layui-input-inline">
					<input type="text" id="mailUser" name="mailUser" lay-verify="required" placeholder="例如:liuwei63" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux"><font color="red">*</font></div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 150px;">用户密码</label>
					<div   class="layui-input-inline">
					<input type="password" id="mailPassword" name="mailPassword" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux"><font color="red">*</font></div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label"  style="width: 150px;">域名</label>
					<div class="layui-input-inline">
					<input type="text" id="mailDomain"  name="mailDomain"  lay-verify="required" placeholder="请输入域名" autocomplete="off" class="layui-input">					
					</div>
					<div class="layui-form-mid layui-word-aux"><font color="red">*</font></div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-block" >
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary" id="res">重置</button>
					</div>
				</div>
			</form>
		</div>		
	</body>
<script type="text/javascript" src="<%=basePath %>/static/ContinuedClass/sendCardMail/add.js"></script>
</html>