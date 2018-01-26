<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
   <link rel="stylesheet" href="https://res.wx.qq.com/open/libs/weui/0.3.0/weui.css" />
  <%@include file="/WEB-INF/view/common/webLib.jsp" %>  
  <script src="<%=basePath%>/static/common/bootstrap/js/bootstrap.min.js"></script>
	   <link href="<%=basePath%>/static/common/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	   <script src="<%=basePath %>/static/layer/layer.js"></script>
	   <script src="<%=basePath %>/static/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath %>/static/layui/css/layui.css">
<script type='text/javascript' src='<%=basePath %>/static/weui/js/swiper.js' charset='utf-8'></script>
<script src="<%=basePath%>/static/nologin/js/js/exif.js" type="text/javascript"></script>
<!-- <script type="text/javascript">
	var  deviceWidth = document.documentElement.clientWidth;
	if(deviceWidth >750) deviceWidth =750;
	document.documentElement.style.fontSize = deviceWidth /7.5+'px';
	</script> -->
  <title>校长信箱</title>
  <style>
    *{margin: 0;padding: 0;}
    li{list-style-type: none;}
    a,input{outline: none;-webkit-tap-highlight-color:rgba(0,0,0,0);}
    #choose,#choose1{display: none;}
    canvas{width: 100%;border: 1px solid #000000;}
    #upload,#upload1{display: block;margin: 10px;height: 60px;text-align: center;line-height: 60px;border: 1px solid;border-radius: 5px;cursor: pointer;}
    .touch{background-color: #ddd;}
 /*    .img-list{margin: 10px 5px;} */
    .img-list li{position: relative;display: inline-block;width: 77px;height: 77px;margin: 5px 5px 5px 5px;border: 1px solid #D9D9D9;background: #fff no-repeat center;background-size: cover;}
    .progress{position: absolute;width: 100%;height: 20px;line-height: 20px;bottom: 0;left: 0;background-color:rgba(100,149,198,.5);}
    .progress span{display: block;width: 0;height: 100%;background-color:rgb(100,149,198);text-align: center;color: #FFF;font-size: 13px;}
    .size{position: absolute;width: 100%;height: 15px;line-height: 15px;bottom: -18px;text-align: center;font-size: 13px;color: #666;}
    .tips{display: block;text-align:center;font-size: 13px;margin: 10px;color: #999;}
    .pic-list{margin: 10px;line-height: 18px;font-size: 13px;}
    .pic-list a{display: block;margin: 10px 0;}
    .pic-list a img{vertical-align: middle;max-width: 30px;max-height: 30px;margin: -4px 0 0 10px;}
    .flooter{
    height: 30px;
    background: #0cb29b;
    line-height:30px;
    position: fixed;
    bottom: 0px;
    width: 100%;
    color: white;
    text-align: center;
    }
   /*  已回复 */
    .stateSpan1{
     font-size: 13px;
    color: white;
    background-color: #0cb29b;
    padding: 5px;
    margin-right: 5px;
    float: left;
    border-radius: 2px;
    line-height: normal;
    }
     /*  待回复 */
    .stateSpan2{
     font-size: 13px;
    color: white;
    background-color: #f96757;
    padding: 5px;
    margin-right: 5px;
    float: left;
    border-radius: 2px;
    line-height: normal;
    }
    
      /*  已结束 */
    .stateSpan3{
     font-size: 13px;
    padding: 5px;
    margin-right: 5px;
    color: white;
    background: #999999;
    float: left;
    border-radius: 2px;
    line-height: normal;
    }
    
   .weui-media-box__title{
   line-height: 27px;
   }
    a:hover, a:focus{
    text-decoration:none;
    }
    
    .weui-media-box__desc{
    margin-top: 5px;
    }
    
    .weui-popup__modal{
    padding: 10px;
    background-color: white;
    }
    .title{
    font-size: 15px;
    font-weight: bold;
    }
    .time{
    	font-size: 10px;
    	/* color: #999999; */
    }
    .feedback_q{
    float: left;
     background: #02A3FB;
     max-width: 90%;
     padding: 10px;
     border-radius: 2px;
     color: white;
    }
   .feedback_f{
   	margin:10px;
   	color:#858586;
     background: #E3E3E4;
     max-width: 90%;
     float: right;
      padding: 5px;
     border-radius: 2px;
    }
    
    .layerPadding{
    padding-left: 0px;
    padding-right: 0px;
    }
    .weui-photo-browser-modal{
    z-index: 100;
    }
    .photo-container img{
    margin: 0 auto;
    }
            
  .layui-tab-title li{
  width: 50%;
  }
  
  .layui-tab-card>.layui-tab-title li {
	margin-right: 0px;
	margin-left: 0px
}
  /*  .layui-tab{
  margin-top: 30px;
  }  */
  
  .weui_uploader_input_wrp{
  border: 1px dashed #D9D9D9;
  }
  
  .layui-tab-title{
  border-bottom: 2px solid #0cb29b;
  }
 .layui-tab-card>.layui-tab-title .layui-this {
	background: none;
	color: #0cb29b;
}

 .layui-tab-card>.layui-tab-title :not(.layui-this) {
	background-color: #f5f5f5;
}


.layui-tab-card>.layui-tab-title {
	background: none;
}
  </style>
</head>
<body style="margin-bottom: 50px;" >
<div style="width: 100%;"><img alt="" src="<%=basePath %>/static/feedback/img/head.jpg" width="100%;"></div>
<div class="container"  >
		<div class="layui-tab layui-tab-card row" lay-filter="tabChange" style="margin-top: ">
			<ul class="layui-tab-title" style="position: inherit;">
				<li class="layui-this">新增反馈</li>
				<li lay-id='11'>反馈记录</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show"><form action="" id="subForm" class="layui-form"  >
<div class="form-horizontal" role="form" >
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label"><font style="color: red">*</font>标题:</label>
						<div class="col-sm-10">
							<input type="text" class="layui-input" id="feecbackTitle" lay-verify="required"
								placeholder="请输入标题">
						</div>
					</div>
					<div class="form-group">
					<label for="name" class="col-sm-2 control-label"><font style="color: red">*</font>选择反馈对象:</label> 
					<div class="col-sm-10 ">
					<select class="form-control" id="deptId" lay-verify="required">
						<option value="">请选择</option>
						<c:forEach var="org" items="${orgList }">
							<option value="${org.id }">${org.name }</option>
						</c:forEach>
					</select></div>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label"><font style="color: red">*</font>您的建议:</label> 
					<div class="col-sm-10">
					<textarea class="layui-textarea" rows="5" id="desc" placeholder="请输入建议的具体内容" lay-verify="required"></textarea>
					</div>
				</div>
				<div class="form-group" style="margin-bottom: 0px;">
					<label for="name" class="col-sm-2 control-label">图片上传:<span style="color: #999;font-weight: normal;font-size: 10px;margin-left: 10px;">只允许上传jpg、png及gif</span></label> 
					<div class="col-sm-10">
					<input type="file" id="choose" accept="image/*"   multiple="" >
<ul class="img-list"  id="imglist"><li style="border: none;" id="weui_uploader_li"><div class="weui_uploader_input_wrp">
<a id="upload" class="weui_uploader_input js_file">上传图片</a></div></li></ul>
					</div>
				</div>
				<div class="form-group" style="text-align: center;">
				<button lay-submit="" lay-filter="sub" type="button"
				class="layui-btn"><li class="fa fa-check-square-o"></li>
				&nbsp;提&nbsp;交
			</button>&nbsp;&nbsp;<input type="checkbox" id="isHide" lay-skin="primary" title="匿名" >
			</div>
</div></form></div>
				<div class="layui-tab-item" >
				<div class="weui-panel weui-panel_access">
  <div class="weui-panel__bd">
  </div>
</div>
				</div>
			</div>
		</div>
</div>
<div class="flooter">新东方学校 Smart Work</div>
<div class="weui-gallery" style="display: none;" onclick="closeDel();">
  <span class="weui-gallery__img" ></span>
  <div class="weui-gallery__opr">
    <a href="javascript:;" class="weui-gallery__del">
      <i class="weui-icon-delete weui-icon_gallery-delete"></i>
    </a>
  </div>
</div>
<script>
function getbgImgUrl(ob){
	var avatar="";
	var ua = navigator.userAgent.toLowerCase();
	if (/iphone|ipad|ipod/.test(ua)) {
		avatar=""+$(ob).css("background-image").split("(")[1].split(")")[0];
	}else{
		avatar=$(ob).css("background-image").split("\"")[1];
	}
	  return avatar;
}

function closeDel(){
	$(".weui-gallery").css('display','none');
}

function subDelImg(id){
	$("#"+id).remove();
		maxNum++;
	  if(maxNum!=0){
    	  $("#weui_uploader_li").show();
      }
	return ;
}

function delImg(ob){
	$(".weui-gallery__img").css("background-image",$(ob).css("background-image"));
	$(".weui-gallery__del").attr("onclick","subDelImg("+ob.id+")")
	$(".weui-gallery").css('display','block');
}

function showPopup(id){
		window.location.href=jsBasePath+'/wechat/binding/feedback/feedBackDetail.html?id='+id
}

	function closeFeedback(baseId) {
		layer.open({
			  title:"确认关闭反馈",
			  type: 2,
			  area: ['90%', '60%'], //宽高
			  content:  jsBasePath+'/wechat/binding/feedback/closeFeedBackView.html?id='+baseId+'&closeType=0'
			});
	}
	
	
	layui.use([ 'element', 'form','flow' ], function() {
		var element = layui.element();
		var form = layui.form();
		
		form.on('submit(sub)', function(data) {
			upload();
		});
		if (navigator.userAgent.match(/Android/i)){
			$("#choose").attr("capture","camera");
		}
		
		element.on('tab(tabChange)', function(data) {
			$(".weui-panel__bd").html("");
			if (data.index == 1) {
				var flow = layui.flow;
				 flow.load({
					    elem: '.weui-panel__bd' //指定列表容器
					    ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
					    	var index = layer.load(3, {
								shade : [ 0.3 ]
							});
					      var lis = [];
					      //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
					      $.post(jsBasePath + '/wechat/binding/feedback/getMyFeedBack.html', {pageNow:page,pageSize:5}, function(res, status) {
									layer.close(index);
							$.each(res.records,function(i,item){
								var html="";
								html+= "<a href=\"javascript:showPopup("+item.id+");\" class=\"weui-media-box weui-media-box_appmsg\">";
								html+= "<div class=\"weui-media-box__bd\">";
								if(item.state==0){
									html+="<div class=\"weui-media-box__title\"><div class='stateSpan2'><li class=\"fa  fa-clock-o\"></li>&nbsp;待回复</div>"+item.title+"</div>";
								}
								if(item.state==1){
									html+="<div class=\"weui-media-box__title\"><div class='stateSpan1'><li class=\"fa  fa-check-circle\"></li>&nbsp;已回复</div>"+item.title+"</div>";
								}
								if(item.state==2){
									html+="<div class=\"weui-media-box__title\"><div class='stateSpan3'><li class=\"fa fa-times-circle\"></li>&nbsp;已关闭</div>"+item.title+"</div> ";
								}
								if(item.fbdetail!=null&&item.fbdetail.length>0){
									html+="<p class=\"weui-media-box__desc\">";
									html+=item.fbdetail[0].desc;
									html+="<font  style=\"color:#0cb29b;\">【查看详情】</font></p>";
								}
								html+= "</div>";
								html+= "</a>";
								lis.push(html);
							});
							next(lis.join(''), page < res.pageCount); 
				}, "json");
					    }
					  });
			}
		});
		  var needRefresh = sessionStorage.getItem("need-refresh");
		    if(needRefresh){
		        sessionStorage.removeItem("need-refresh");
		        element.tabChange('tabChange', '11');
		    }
		    
	});
	
  var filechooser = document.getElementById("choose");
  //大于500K压缩
  var yasuoSize=1024*500;
  var maxNum1=3;

  //    用于压缩图片的canvas
  var canvas = document.createElement("canvas");
  var ctx = canvas.getContext('2d');
  //    瓦片canvas
  var tCanvas = document.createElement("canvas");
  var tctx = tCanvas.getContext("2d");
  var maxsize =5 * 1024;
  var maxNum=3;
  
  
  $("#upload").on("click", function() {
        filechooser.click();
      })
      .on("touchstart", function() {
        $(this).addClass("touch")
      })
      .on("touchend", function() {
        $(this).removeClass("touch")
      });
  
  filechooser.onchange = function() {
	  var index =layer.load(3, {shade: [0.3]});
    if (!this.files.length) return;
    var files = Array.prototype.slice.call(this.files);
    if (files.length > maxNum) {
    	 layer.close(index);
    	 layer.alert("最多同时只可上传"+maxNum+"张图片");
      return;
    }
    files.forEach(function(file, i) {
      if (!/\/(?:jpeg|png|gif)/i.test(file.type)) {
    	   layer.close(index);
    	   layer.alert( '该类型不允许上传');  
	      return;
      }
//          获取图片大小
      var size = file.size /1024; 
      if(size>maxsize){
    	  layer.close(index);
    	  layer.alert( '文件大小不允许超过5M');
          return;
      }
      var li = document.createElement("li");
      $("#imglist").prepend($(li));
      maxNum--;
      if(maxNum==0){
    	  $("#weui_uploader_li").hide();
      }
      var Orientation = null;  
      EXIF.getData(file, function() { 
    	  EXIF.getAllTags(this);   
          Orientation = EXIF.getTag(this, 'Orientation'); 
          var reader = new FileReader();
          reader.onload = function(e) {
            var img = new Image();
            img.src = this.result;
            img.onload = function() {
            	var expectWidth = this.naturalWidth;  
                var expectHeight = this.naturalHeight;
                if (this.naturalWidth > this.naturalHeight && this.naturalWidth > 800) {  
                    expectWidth = 800;  
                    expectHeight = expectWidth * this.naturalHeight / this.naturalWidth;  
                } else if (this.naturalHeight > this.naturalWidth && this.naturalHeight > 1200) {  
                    expectHeight = 1200;  
                    expectWidth = expectHeight * this.naturalWidth / this.naturalHeight;  
                }
                var canvas = document.createElement("canvas");  
                var ctx = canvas.getContext("2d");  
                canvas.width = expectWidth;  
                canvas.height = expectHeight;  
                ctx.drawImage(this, 0, 0, expectWidth, expectHeight);
                var base64 = null;
    			//修复ios  
    			if (navigator.userAgent.match(/iphone/i)) {
    				if (Orientation != "" && Orientation != 1) {
    					switch (Orientation) {
    						case 6: //需要顺时针（向左）90度旋转  
    							rotateImg(this, canvas,1);
    							break;
    						case 8: //需要逆时针（向右）90度旋转  
    							rotateImg(this, canvas,3);
    							break;
    						case 3: //需要180度旋转  
    							rotateImg(this, canvas,2); //转两次  
    							break;
    					}
    				}
    				if(size>1024){
    					//超过1M就压缩
    					base64 = canvas.toDataURL(file.type, 0.1);
    				}else{
    					base64 = canvas.toDataURL(file.type, 1.0);
    				}
    				
    			} else if (navigator.userAgent.match(/Android/i)) {// 修复android  
                    var encoder = new JPEGEncoder();  
                    if(size>1024){
                    	  base64 = encoder.encode(ctx.getImageData(0, 0, expectWidth, expectHeight), 1);  
    				}else{
    					  base64 = encoder.encode(ctx.getImageData(0, 0, expectWidth, expectHeight), 80);  
    				}
                  
                }else {
    				if (Orientation != "" && Orientation != 1) {
    					switch (Orientation) {
    					case 6: //需要顺时针（向左）90度旋转  
    						rotateImg(this, canvas,1);
    						break;
    					case 8: //需要逆时针（向右）90度旋转  
    						rotateImg(this, canvas,3);
    						break;
    					case 3: //需要180度旋转  
    						rotateImg(this, canvas,2); //转两次  
    						break;
    					}
    				}
    				if(size>1024){
    					base64 = canvas.toDataURL(file.type, 0.1);
    				}else{
    					base64 = canvas.toDataURL(file.type, 1.0);
    				}
    			}
    			  $(li).attr("imgtype",file.type);
    		      $(li).attr("id",Date.parse(new Date()));
    		      $(li).attr("onclick","delImg(this)");
    		      $(li).css("background-image", "url(" + base64 + ")");
            }
          }; 
          reader.readAsDataURL(file);
          layer.close(index);
      });
    })
  };
  //    使用canvas对大图片进行压缩
  function compress(img) {
    var initSize = img.src.length;
    var width = img.width;
    var height = img.height;
    //如果图片大于四百万像素，计算压缩比并将大小压至400万以下
    var ratio;
    if ((ratio = width * height / 4000000) > 1) {
      ratio = Math.sqrt(ratio);
      width /= ratio;
      height /= ratio;
    } else {
      ratio = 1;
    }
    canvas.width = width;
    canvas.height = height;
//        铺底色
    ctx.fillStyle = "#fff";
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    //如果图片像素大于100万则使用瓦片绘制
    var count;
    if ((count = width * height / 1000000) > 1) {
      count = ~~(Math.sqrt(count) + 1); //计算要分成多少块瓦片
//            计算每块瓦片的宽和高
      var nw = ~~(width / count);
      var nh = ~~(height / count);
      tCanvas.width = nw;
      tCanvas.height = nh;
      for (var i = 0; i < count; i++) {
        for (var j = 0; j < count; j++) {
          tctx.drawImage(img, i * nw * ratio, j * nh * ratio, nw * ratio, nh * ratio, 0, 0, nw, nh);
          ctx.drawImage(tCanvas, i * nw, j * nh, nw, nh);
        }
      }
    } else {
      ctx.drawImage(img, 0, 0, width, height);
    }
    //进行最小压缩
    
    
    var ndata = canvas.toDataURL('image/jpeg', 0.1);
    console.log('压缩前：' + initSize);
    console.log('压缩后：' + ndata.length);
    console.log('压缩率：' + ~~(100 * (initSize - ndata.length) / initSize) + "%");
    tCanvas.width = tCanvas.height = canvas.width = canvas.height = 0;
    return ndata;
  }
  
  function test(){
  }
  
  //处理照片旋转
  function rotateImg(img,canvas,step) {
		var height = img.height;
		var width = img.width;
		//旋转角度以弧度值为参数   
		var degree = step * 90 * Math.PI / 180;
		var ctx = canvas.getContext('2d');
		switch (step) {
			case 0:
				canvas.width = width;
				canvas.height = height;
				ctx.drawImage(img, 0, 0);
				break;
			case 1:
				canvas.width = height;
				canvas.height = width;
				ctx.rotate(degree);
				ctx.drawImage(img, 0, -height);
				break;
			case 2:
				canvas.width = width;
				canvas.height = height;
				ctx.rotate(degree);
				ctx.drawImage(img, -width, -height);
				break;
			case 3:
				canvas.width = height;
				canvas.height = width;
				ctx.rotate(degree);
				ctx.drawImage(img, -width, 0);
				break;
		}
  }
  
  
  //    图片上传，将base64的图片转成二进制对象，塞进formdata上传
  function upload() {
	  var index =layer.load(3, {shade: [0.3]});
	var imgs=$("#imglist li[id!='weui_uploader_li']");
	   var xhr = new XMLHttpRequest();
	    var formdata = getFormData();
	for(var j=0;j<imgs.length;j++){
		var basestr=getbgImgUrl(imgs[j]);
		 var text = window.atob(basestr.split(",")[1]);
		    var buffer = new Uint8Array(text.length);
		    var pecent = 0, loop = null;
		    for (var i = 0; i < text.length; i++) {
		      buffer[i] = text.charCodeAt(i);
		    }
		    var blob = getBlob([buffer], $(imgs[j]).attr("imgtype"));
		    formdata.append('imagefile', blob);
	}
	  var isHide=$("#isHide").is(':checked');
	  if(isHide){
		  formdata.append('isHide', 1);
	  }else{
		  formdata.append('isHide', 0);
	  }
	  formdata.append('deptId', $("#deptId").val());
	  formdata.append('title', $.trim($("#feecbackTitle").val()));
	  formdata.append('desc', $.trim($("#desc").val()));
	  formdata.append('type', 0);
   // formdata.append('imagefile', blob);
    xhr.open('post', jsBasePath+'/wechat/binding/feedback/feedback.html');
    xhr.onreadystatechange = function() {
    	layer.close(index);
      if (xhr.readyState == 4 && xhr.status == 200) {
        var jsonData = JSON.parse(xhr.responseText);
        if(jsonData.flag){
        	layer.alert("提交成功!",function(index){
        		layer.close(index);
        		$("#deptId").val("");
           	 	layui.form().render('select')
          	  	 $("#feecbackTitle").val("");
          		 $("#desc").val("");
          		maxNum=3;
          		$("#imglist li[id!='weui_uploader_li']").remove();
          		layui.element().tabChange('tabChange', '11');
				});
        }else{
        	layer.alert(jsonData.msg);
        }
      }
    };
    xhr.send(formdata);
  }
  /**
   * 获取blob对象的兼容性写法
   * @param buffer
   * @param format
   * @returns {*}
   */
  function getBlob(buffer, format) {
  try {
      return new Blob(buffer, {type: format});
    } catch (e) {
      var bb = new (window.BlobBuilder || window.WebKitBlobBuilder || window.MSBlobBuilder);
      buffer.forEach(function(buf) {
        bb.append(buf);
      });
      return bb.getBlob(format);
    }
  }
  /**
   * 获取formdata
   */
  function getFormData() {
    var isNeedShim = ~navigator.userAgent.indexOf('Android')
        && ~navigator.vendor.indexOf('Google')
        && !~navigator.userAgent.indexOf('Chrome')
        && navigator.userAgent.match(/AppleWebKit\/(\d+)/).pop() <= 534;
    return isNeedShim ? new FormDataShim() : new FormData()
  }
  /**
   * formdata 补丁, 给不支持formdata上传blob的android机打补丁
   * @constructor
   */
  function FormDataShim() {
    console.warn('using formdata shim');
    var o = this,
        parts = [],
        boundary = Array(21).join('-') + (+new Date() * (1e16 * Math.random())).toString(36),
        oldSend = XMLHttpRequest.prototype.send;
    this.append = function(name, value, filename) {
      parts.push('--' + boundary + '\r\nContent-Disposition: form-data; name="' + name + '"');
      if (value instanceof Blob) {
        parts.push('; filename="' + (filename || 'blob') + '"\r\nContent-Type: ' + value.type + '\r\n\r\n');
        parts.push(value);
      }
      else {
        parts.push('\r\n\r\n' + value);
      }
      parts.push('\r\n');
    };
    // Override XHR send()
    XMLHttpRequest.prototype.send = function(val) {
      var fr,
          data,
          oXHR = this;
      if (val === o) {
        // Append the final boundary string
        parts.push('--' + boundary + '--\r\n');
        // Create the blob
        data = getBlob(parts);
        // Set up and read the blob into an array to be sent
        fr = new FileReader();
        fr.onload = function() {
          oldSend.call(oXHR, fr.result);
        };
        fr.onerror = function(err) {
          throw err;
        };
        fr.readAsArrayBuffer(data);
        // Set the multipart content type and boudary
        this.setRequestHeader('Content-Type', 'multipart/form-data; boundary=' + boundary);
        XMLHttpRequest.prototype.send = oldSend;
      }
      else {
        oldSend.call(this, val);
      }
    };
  }
</script>
</body>
</html>