layui.use(['form','laydate'], function(){
    var form = layui.form(),laydate = layui.laydate;
    var start = {
		istoday : true,
		format: 'YYYY-MM-DD hh:mm:ss', //日期格式
		istime: true, //是否开启时间选择
		min: laydate.now(0),
		choose : function(datas) {
			
		}
	};  
	$('#interviewTime').bind("click", function() {
		start.elem = this;
		laydate(start);
	});	
	//监听提交
	form.on('submit(tj)', function(data){
		  var index =layer.load(3, {shade: [0.3]});
		  var flowIds=$("#flowIds").val();
		  var interviewTime=$("#interviewTime").val();
		  var interviewLocation=$("#interviewLocation").val();
		  $.post(jsBasePath+"/recruit/interview/batch_edit.html",{flowIds:flowIds,interviewTime:interviewTime,interviewLocation:interviewLocation},function(data,status){
				layer.close(index); 
				if(data.flag==false){
					layer.alert(data.message,{icon:2});
				}else{					
					layer.alert(data.message,{icon:1},function(){
						parent.location.reload(); 
						closeFrame();
					});
				}
			},"json");
		 return false; 
	  });
});
//取消
function cancle(){
	closeFrame();
}



