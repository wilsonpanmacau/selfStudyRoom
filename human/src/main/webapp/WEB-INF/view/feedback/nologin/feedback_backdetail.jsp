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
<script src="<%=basePath %>/static/raty/lib/jquery.raty.min.js"></script>
<!-- <script type="text/javascript">
	var  deviceWidth = document.documentElement.clientWidth;
	if(deviceWidth >750) deviceWidth =750;
	document.documentElement.style.fontSize = deviceWidth /7.5+'px';
	</script> -->
  <title>反馈详情</title>
  <style>
    *{margin: 0;padding: 0;}
    li{list-style-type: none;}
    a,input{outline: none;-webkit-tap-highlight-color:rgba(0,0,0,0);}
    #choose,#choose1{display: none;}
    canvas{width: 100%;border: 1px solid #000000;}
    #upload,#upload1{display: block;margin: 10px;height: 60px;text-align: center;line-height: 60px;border: 1px solid;border-radius: 5px;cursor: pointer;}
    .touch{background-color: #ddd;}
 /*    .img-list{margin: 10px 5px;} */
    .img-list li{position: relative;display: inline-block;width: 77px;height:77px;margin: 5px;border: 1px solid #D9D9D9;background: #fff no-repeat center;background-size: cover;}
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
    
      .weui_uploader_input_wrp{
  border: 1px dashed #D9D9D9;
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
    margin-top: 10px;
    padding-bottom:5px;
    border-bottom: 1px solid #F0F0F0;
    }
    .time{
    	font-size: 10px;
    	/* color: #999999; */
    }
    .feedback_q{
    float: left;
     background: #3dc1af;
     max-width: 78%;
     padding: 10px;
     border-radius: 2px;
     color: white;
     margin:5px;
     font-size: 16px;
    }
   .feedback_f{
   	color:#858586;
     background: #E3E3E4;
     max-width: 78%;
     float: right;
      padding: 10px;
     border-radius: 2px;
      margin:5px;
        font-size: 16px;
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
  </style>
</head>
<body style="margin-bottom: 50px;" >
<div class="container"  >
<input id="baseId" type="hidden" value="${fb.id}">
<input id="userName" type="hidden" value="${userName}">
	<div class="title">${fb.title}<br><font style="font-size: 12px;font-weight: normal;color: orange;">反馈对象:${fb.deptName}</font></div>
		<c:forEach var="detail" items="${fb.fbdetail}">
			<div >
				<c:if test="${detail.type==0}">
					<div style="float: left;padding-top: 8px;width: 15%;text-align: center;">
						<img alt="" src="<%=basePath %>/static/feedback/img/q_head.png" style="width: 100%;max-height: 80px;max-width: 80px;">
					</div>
					<div class="feedback_q">
				</c:if>
				<c:if test="${detail.type!=0}">
					<div style="float:right;padding-top: 5px;width: 15%;text-align: center;">
						<img alt="" src="<%=basePath %>/static/feedback/img/f_head.png" style="width: 100%;max-height: 80px;max-width: 80px;">
					</div>
					<div class="feedback_f">
				</c:if>
				<div>
					<div>${detail.desc}</div>
					<c:if
						test="${detail.fbpPhoto !=null or fn:length(detail.fbpPhoto)>0}">
						<div>
							<ul class="img-list">
								<c:forEach var="photo" items="${detail.fbpPhoto}" varStatus="st">
									<li onclick="showImgs(this,${st.index});"
										style="background-image: url('${filePath}${photo.url}');width:50px;height:50px;margin:3px;">
								</c:forEach>
							</ul>
						</div>
					</c:if>
					<c:if test="${detail.type==1}">
						<div class="time" style="margin-top: 3px;text-align:right;">${detail.operUser}回复于<fmt:formatDate
								value='${detail.operTime}' pattern='yyyy-MM-dd HH:mm:ss' />
						</div>
					</c:if>
					<c:if test="${detail.type!=1}">
						<div class="time" style="margin-top: 3px;">
							<c:if test="${fb.isHide==1}">匿名</c:if>
							<c:if test="${fb.isHide!=1}">${detail.operUser}</c:if>
							反馈于
							<fmt:formatDate value='${detail.operTime}'
								pattern='yyyy-MM-dd HH:mm:ss' />
						</div>
					</c:if>
				</div>
			</div>
		<div class="clearfix"></div>
		</div>
	</c:forEach>
	<c:if test="${fb.state==2}">
			<c:if test="${fb.closeType==0}">
			<div>
			<div style="float: left;padding-top: 8px;width: 15%;text-align: center;">
						<img alt="" src="<%=basePath %>/static/feedback/img/q_head.png" style="width: 100%;max-height: 80px;max-width: 80px;">
					</div>
				<div class="feedback_q">
					<div class="layui-inline" style="width: 100%;">
						<font style="font-size: 12px;line-height: 22px;">评分:</font>
						<div class="layui-input-inline" id="star" data-score="${fb.score}"></div>
					</div>
					<div>
					<div>${fb.closeDesc}</div>
					<div class="time" style="margin-top: 3px;">关闭于${fb.closeTime}</div>
					</div>
					</div>
					<div class="clearfix"></div>
					</div>
		</c:if>
			<c:if test="${fb.closeType==1}">
			<div ><div style="float:right;padding-top: 5px;width: 15%;text-align: center;">
						<img alt="" src="<%=basePath %>/static/feedback/img/f_head.png" style="width: 100%;max-height: 80px;max-width: 80px;">
					</div><div class="feedback_f" >
			<div >
			<div>${fb.closeDesc}</div>
			<div class="time" style="margin-top: 3px;text-align:right;">${fb.closeUser}关闭于${fb.closeTime}</div>
			</div>
			</div>
			<div class="clearfix"></div>
			</div>
			</c:if>
	</c:if>
	<c:if test="${fb.state!=2}">
	<div style="border-top: 1px solid #999999; margin-top: 5px;padding-top:5px;" id="addfeedbackDiv">
	<form action="" id="subForm1" class="layui-form"  >
		<div class="form-group" >
		<label for="desc" class="col-sm-2 control-label layerPadding" ><font style="color: red">*</font>您的回复:</label>
		<div class="col-sm-10 layerPadding" >
	<textarea class="layui-textarea" rows="5" id="desc1" placeholder="请输入回复内容" lay-verify="required"></textarea>
		</div>
		</div>
		<div class="form-group" style="margin-bottom: 0px;" >
		<label for="name" class="col-sm-2 control-label layerPadding" >图片上传:<span style="color: #999;font-weight: normal;font-size: 10px;margin-left: 10px;">只允许上传jpg、png及gif</span></label> 
		<div class="col-sm-10 layerPadding" >
		<input type="file" id="choose1" accept="image/*"   multiple="" >
		<ul class="img-list" id="imglist1"><li style="border: none;" id="weui_uploader_li1"><div class="weui_uploader_input_wrp">
		<a id="upload1" class="weui_uploader_input js_file">上传图片</a></div></li></ul>
		</div></div>
		<div class="form-group" style="text-align: center; margin-top: 15px;"><button  lay-submit="" lay-filter="sub1"  type="button" class="layui-btn ">&nbsp;回&nbsp;复&nbsp;</button>&nbsp;&nbsp;<button type="button" class="layui-btn layui-btn-primary" onclick="closeFeedback('${fb.id}');">&nbsp;关闭问题</button></div>
		</form></div>
		</c:if>
	<c:if test="${fb.state!=0}">
<!-- 		<div class="form-group" style="text-align: center; margin-top: 20px;"><button onclick="javascript:window.history.back(-1);" type="button" class="layui-btn layui-btn-primary "><li class="fa fa-times"></li>&nbsp;关&nbsp;闭&nbsp;</button></div>
 -->	</c:if>
	</div>
	<div class="flooter">新东方学校 Smart Work</div>
	<input type="hidden" id="fbstate" value="${fb.state}">
	<div class="weui-gallery" style="display: none;" onclick="closeDel();">
  <span class="weui-gallery__img" ></span>
  <div class="weui-gallery__opr">
    <a href="javascript:;" class="weui-gallery__del">
      <i class="weui-icon-delete weui-icon_gallery-delete"></i>
    </a>
  </div>
</div>
<script>

function closeWindows() {
	var userAgent = navigator.userAgent;
	if (userAgent.indexOf("Firefox") != -1
	|| userAgent.indexOf("Chrome") != -1) {
	$.close();//直接调用JQUERY close方法关闭
	} else {
	window.opener = null;
	window.open("", "_self");
	window.close();
	}
	};

function getbgImgUrl(ob){
	var avatar="";
	if (navigator.userAgent.match(/iphone/i)) {
		avatar=""+$(ob).css("background-image").split("(")[1].split(")")[0];
	}else{
		avatar=$(ob).css("background-image").split("\"")[1];
	}
	  return avatar;
}

function showImgs(obj,k){
	var imgs=$(obj).parent().find("li");
	var array=new Array();
	$.each(imgs,function(i,img){
		array[array.length]=getbgImgUrl(img);
	});
	var pb1 = $.photoBrowser({
		  items: array,
		  initIndex:k
		      });
	pb1.open();
}

function closeDel(){
	$(".weui-gallery").css('display','none');
}

function subDelImg(id){
	$("#"+id).remove();
	maxNum1++;
	  if(maxNum1!=0){
  	  $("#weui_uploader_li1").show();
    }
	return ;
}


function delImg(ob){
	$(".weui-gallery__img").css("background-image",$(ob).css("background-image"));
	$(".weui-gallery__del").attr("onclick","subDelImg("+ob.id+")")
	$(".weui-gallery").css('display','block');
}


	function closeFeedback(baseId) {
		layer.open({
			  title:"确认关闭反馈",
			  type: 2,
			  area: ['90%', '60%'], //宽高
			  content:  jsBasePath+'/free/feedBack/closeFeedBackView.html?id='+baseId+'&closeType=1&userName='+$("#userName").val()
			});
	}
	
	var maxNum1=3;
	var maxsize =5 * 1024;
	$(function () {
		var st=$("#fbstate").val();
		if(st!=0){
			sessionStorage.setItem("need-refresh", true);
		}
		$('#star').raty({
			readOnly : true,
			score : function() {
				return $(this).attr('data-score');
			}
		});
	});
	
	function fdfeedback(){
		var index =layer.load(3, {shade: [0.3]});
		var imgs=$("#imglist1 li[id!='weui_uploader_li1']");
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
		  formdata.append('baseId', $("#baseId").val());
		  formdata.append('desc', $.trim($("#desc1").val()));
		  formdata.append('operUser', $("#userName").val());
	      xhr.open('post', jsBasePath+'/free/feedBack/fbFeedBack.html');
	      xhr.onreadystatechange = function() {
	    	layer.close(index);
	      if (xhr.readyState == 4 && xhr.status == 200) {
	        var jsonData = JSON.parse(xhr.responseText);
	        if(jsonData.flag){
	        	layer.alert("提交成功!",function(index){
	        		location.reload();
					});
	        }else{
	        	layer.alert(jsonData.msg);
	        }
	      }
	    };
	    xhr.send(formdata);
	}
	
	layui.use([ 'element', 'form' ], function() {
		var element = layui.element();
		var form = layui.form();
		form.on('submit(sub1)', function(data) {
			fdfeedback();
		});
	});
	
	  function getFormData() {
		    var isNeedShim = ~navigator.userAgent.indexOf('Android')
		        && ~navigator.vendor.indexOf('Google')
		        && !~navigator.userAgent.indexOf('Chrome')
		        && navigator.userAgent.match(/AppleWebKit\/(\d+)/).pop() <= 534;
		    return isNeedShim ? new FormDataShim() : new FormData()
		  }
	  $("#upload1").on("click", function() {
		  filechooser1.click();
	    })
	    .on("touchstart", function() {
	      $(this).addClass("touch")
	    })
	    .on("touchend", function() {
	      $(this).removeClass("touch")
	    }); 
	 
	  var filechooser1 = document.getElementById("choose1");
	  if(filechooser1!=null){
		  filechooser1.onchange = function() {
			    if (!this.files.length) return;
			    var index =layer.load(3, {shade: [0.3]});
			    var files = Array.prototype.slice.call(this.files);
			    if (files.length > maxNum1) {
			    	 layer.close(index);
			      layer.alert("最多同时只可上传"+maxNum1+"张图片");
			      return;
			    }
			    files.forEach(function(file, i) {
			      if (!/\/(?:jpeg|png|gif)/i.test(file.type)) {
			    	   layer.close(index);
			    	   layer.alert( '该类型不允许上传');  
				          
				              return;
			      }
			      var size = file.size /1024; 
			      if(size>maxsize){
			    	   layer.close(index);
			    	   layer.alert( '文件大小不允许超过5M');  
			    	
			          return;
			      }
			      var li = document.createElement("li");
			     $("#imglist1").prepend($(li));
			      maxNum1--;
			      if(maxNum1==0){
			    	  $("#weui_uploader_li1").hide();
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
	  }

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
</script>
</body>
</html>