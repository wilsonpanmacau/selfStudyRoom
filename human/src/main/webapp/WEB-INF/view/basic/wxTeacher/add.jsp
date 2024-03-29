<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<%@include file="/WEB-INF/view/common/taglib.jsp"%>
</head>
<body style="padding: 10px;">
	<div class="alertFrom">
		<div class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 84px;">菜单名称:</label>
				<div class="layui-input-inline">
					<input name="name" id="name" style="width: 180px;" type="text"
						placeholder="请输入菜单名称" class="layui-input" lay-verify="required">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 84px;">跳转链接:</label>
				<div class="layui-input-inline">
					<input name="url" id="url" style="width: 180px;" type="text"
						placeholder="请输入跳转链接" class="layui-input" lay-verify="required">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 84px;">分配类型:</label>
				<div class="layui-input-inline">
					<select name="filter" id="filter" lay-verify="required"
						style="width: 180px;">
						<option value="1">全部可见</option>
						<option value="2">按部门</option>
						<option value="3">按用户</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 84px;">排序:</label>
				<div class="layui-input-inline" style="width: 180px;">
					<input name="sort" id="sort" type="number" placeholder="请输入排序"
						class="layui-input" lay-verify="required">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 84px;">所属模块:</label>
				<div class="layui-input-inline" style="width: 180px;">
					<select name="category" id="category" lay-verify="required">
		    				<option value="">请选择</option>
		    				<c:forEach items="${modules }" var="module">
		    					<option value="${module.name }">${module.name }</option>
		    				</c:forEach>
		      			</select></div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 84px;">菜单图标:</label>
				<div class="layui-input-inline" style="width: 180px;">
					<img style="width: 150px; height: 150px; border-radius: 100%;" id="file_img" src="<%=basePath%>/static/teacherservice/images/image-02.jpg">
					  	<div class="site-demo-upbar" style="position: absolute; top: 40%; left: 20%;">
					    	<input name="iconFile" lay-type="file" lay-title="选择图片" class="layui-upload-file" id="iconFile" type="file">
					  	</div>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-block" >
						<button id="tj" class="layui-btn">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary" id="res">重置</button>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
	    	layui.use(['form', 'layedit','upload'], function(){
	    		var form = layui.form()
	    		  ,layer = layui.layer
	    		  ,layedit = layui.layedit;
	    	  
	    	  var getObjectURL = function(file) {
		  			var url = null;
		  			if (window.createObjectURL != undefined) {
		  				url = window.createObjectURL(file)
		  			} else if (window.URL != undefined) {
		  				url = window.URL.createObjectURL(file)
		  			} else if (window.webkitURL != undefined) {
		  				url = window.webkitURL.createObjectURL(file)
		  			}
		  			return url
	  			};
	    	  
	    	  //监听提交
	    	  var s = layui.upload({
	    			url: jsBasePath+'/basic/wxTeacher/add.html',
	    			isAuto : false,
	    			change : function(file){
	    				var id = $(file).attr("id");
	    				$("#file_img").attr('src',getObjectURL(file.files[0])).show();
	    			},	    			
	    			success: function(res){ //上传成功后的回调
	    				if(!res.flag){
	    					layer.alert(res.message,{icon:2});
	    				}else{
	    					layer.alert(res.message,{icon:1},function(){
	    						closeFrame();
	    					});
	    				}
	    			}
	    		});
	    	  
	    	  $("#tj").bind("click",function(){
		  		  var files = [];
		  		  files.push($("#iconFile")[0]);
		  		  var data = {
		  			"name" : $.trim($("#name").val()),
		  			"url" : $.trim($("#url").val()),
		  			"filter" : $.trim($("#filter").val()),
		  			"sort" : $.trim($("#sort").val()),
		  			"category" : $.trim($("#category").val())
		  		  };
		  		  s.action(files,"file",data);
		  	  });
	    	  
	    	});
		</script>
	</body>
</html>