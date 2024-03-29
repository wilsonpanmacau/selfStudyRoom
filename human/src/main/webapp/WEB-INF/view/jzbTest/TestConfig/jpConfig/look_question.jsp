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
<%@include file="/WEB-INF/view/common/taglib.jsp"%></head>
<link rel="stylesheet"
	src="<%=basePath%>/static/kinder-eitor/themes/default/default.css" />
<link rel="stylesheet"
	src="<%=basePath%>/static/kinder-eitor/plugins/code/prettify.css" />
</head>
<style>
.bt {
	padding-left: 40px;
	margin: 2% 0px;
}

.bt span {
	color: #319b5e;
	margin-right: 20px;
	font-size: 16px;
}

.left {
	float: left;
	margin-top: 19px;
}
</style>
<body style="padding: 2% 5% 5% 5%">
		<c:if test="${error ne '1' }">
			<div class="layui-collapse" style="margin-top: 1%;">
				<div class="layui-colla-item">
					<h2 class="layui-colla-title"></h2>
					<div class="layui-colla-content layui-show">
						<div style="background:#f9f9f9;box-shadow:1px 1px  1px 1px #ccc;    margin-bottom: 10px;padding-top: 1px;">
						<div class="layui-row" >
							<div class="layui-col-md12 bt">
								<span>题目编号：${jq.qCode}
							</div>
						</div>
						 <c:if test="${jq.qType ne '1'}">
											<div class="layui-form-item layui-form-text">
												<label class="layui-form-label" style="width: 11%">短文</label>
												<div class="layui-input-block">
													<textarea placeholder=""  id="qMainDesc" name="qMainDesc" style="width: 77%; height:400px;"
														class="layui-textarea">${jq.qMainDesc}</textarea>
								</div>
							</div>
						</c:if> 
						<c:forEach items='${jq.questions }' var='qt' varStatus="status">
									<div class="layui-form-item layui-form-text">
															<label class="layui-form-label" style="width: 10%">题目${status.index+1}</label>
															<div class="layui-input-block">
																<textarea placeholder="" style="width: 79%"  name="qContent"
																	class="layui-textarea">${qt.qContent}</textarea>
															</div>
															<!-- 													   可能为填空题 -->
															<c:if test="${qt.isTk eq '2' }">
																<c:forEach items="${qt.tkAnswerList }" var ="an" varStatus="s">
															<div class="layui-form-item layui-form-text" style="margin-top:1%;padding-bottom:1%">	
																	<label class="layui-form-label" style="width: 10%">答案${s.index+1}</label>
																	<div class="layui-input-block">
																		<textarea placeholder="" style="width: 79%"  name="qContent"
																			class="layui-textarea">${an}</textarea>
																	</div>	
																</div>		
																</c:forEach>
															</c:if>
															<c:if test="${qt.isTk eq '1' }">
															<c:forEach items="${qt.answers }" var="answer"
																varStatus="st">
																<div style="padding-top: 1%;padding-bottom: 1%;">
																<c:if test="${answer.aContent ne ''}">
																	<div class="layui-form-item qsan2">
																		<div class="layui-input-inline"
																			style="margin-left: 8%">
																			<label class="layui-form-label"
																				style="width: 11%; float: right;">${answer.xh }</label>
																		</div>
																		<div class="layui-input-inline"
																			style="width: 400px; margin-left: 0.3%">
																			<input type="text" name="multi_aContent"
																				class="layui-input" value="${answer.aContent }">
																		</div>
																		<div class="layui-input-inline">
																			<input type="radio" readonly="readonly"
																				name="multi_correct_${q.qCode }_${status.index }_${S.index}"
																				<c:if test="${answer.isCorrect eq '1'}">checked="checked"</c:if>
																				title="正确答案" value="${answer.xh }">
																		</div>
																	</div>
																</c:if>	
																</div>
															</c:forEach>
															</c:if>
												</div>
								</c:forEach>
					</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${error eq '1' }">
			<p>此题不存在</p>
		</c:if>
<%-- 	</c:forEach> --%>
</body>
</script>
	<script charset="utf-8"
		src="<%=basePath%>/static/kinder-eitor/kindeditor-all.js"></script>
	<script charset="utf-8"
		src="<%=basePath%>/static/kinder-eitor/lang/zh-CN.js"></script>
	<script charset="utf-8"
		src="<%=basePath%>/static/kinder-eitor/plugins/code/prettify.js"></script>
	<script type="text/javascript">
		KindEditor.ready(function(K) {
			K.lang({
			 	audio : 'MP3'
			});
			 K.options.htmlTags['audio'] = ['src','controls','autoplay','type'];
			 K.options.htmlTags['source'] = ['src','controls','autoplay','type'];	
			
			editor = K.create('textarea[name="qMainDesc"]', {
				cssPath : '<%=basePath%>/static/kinder-eitor/plugins/code/prettify.css',
				uploadJson : '<%=basePath%>/kindeditor/fileUpload.html',  
				fileManagerJson : '<%=basePath%>/kindeditor/fileManager.html',  
				allowFileManager : true,
				items :  ['source','undo', 'redo', '|','justifyleft', 'justifycenter', 'justifyright', '|', 'image','audio']
				     });
		});
	</script>

</html>