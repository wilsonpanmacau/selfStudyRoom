$(function() {
  basicModule.areaMo.init('3');
});
layui.use('form', function(){
	var form = layui.form();
	  form.on('select(schoolProvince)', function(data){
		  var parentAreaCode=data.value;
		  if(""==parentAreaCode){
			  return;
		  }
		  var index = layer.load(3, {shade: [0.3]});
			$.post(jsBasePath+"/basic/areaInfo/getArea.html",{parentAreaCode:parentAreaCode,areaLevel:2},function(data,status){
				layer.close(index); 
				var html ="<option value=''>请选择</option>";
				$.each(data,function(i,item){
					html+='<option value="'+item.id+'">'+item.areaName+'</option>'
				})
				 $("#parentAreaCode").html(html);
		         form.render();
			},"json");
			return false;
		}); 
 });