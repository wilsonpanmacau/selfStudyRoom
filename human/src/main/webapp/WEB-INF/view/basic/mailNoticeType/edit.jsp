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
		<%@include file="/WEB-INF/view/common/taglib.jsp" %></head>
	</head>
	<body>
		<div class="alertFrom">
			<form class="layui-form" id="editForm" action="" method="post" >
			<input type="hidden" name="id" value="${st.id}">
					<div class="layui-form-item">
					<label class="layui-form-label">所属机构:</label>
					<div class="layui-input-inline">
						<select name="companyId" id='companyId' lay-filter="temCompany"  lay-verify="required" >
						<option value="">请选择所属机构</option>
						<c:forEach var="com" items="${companyList}">
								<option value="${com.companyId}"  <c:if test="${com.companyId eq st.companyId}">selected</c:if>>${com.companyName}</option>
						</c:forEach>
					</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">所属部门:</label>
					<div class="layui-input-inline">
					<select name="deptId"  id="deptId"lay-verify="required">
						<option value="">请选择所属部门</option>
						<c:forEach var="hOrg" items="${hrOrgList}">
								<option value="${hOrg.id}"  <c:if test="${hOrg.id eq st.deptId}">selected</c:if>>${hOrg.name}</option>
						</c:forEach>
					</select>
					</div>
				</div>				
				<div class="layui-form-item">
					<label class="layui-form-label">类型名称:</label>
					<div class="layui-input-block">
						<input type="text" name="name" lay-verify="required" placeholder="请输入类型名称"   value="${st.name}" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
				<label class="layui-form-label"></label>
					<div class="layui-input-block" >
						<button class="layui-btn" lay-submit="" lay-filter="edit">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary" id="res">重置</button>
					</div>
				</div>
			</form>
		</div>
	</body>
<script type="text/javascript" src="<%=basePath %>/static/basic/js/mailNoticeType/mailNotice_edit.js"></script>
</html>