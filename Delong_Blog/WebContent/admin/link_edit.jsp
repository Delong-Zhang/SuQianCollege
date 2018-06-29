<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>编辑友链</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<div class="container">
	<%@include file="header.jsp"%>

	<br><br>
	<form class="form-horizontal" action="linkUpdate.action" method="post">
		<input type="hidden" name="link.id" value="${link.id}">
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="link.name" value="${link.name}" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">地址</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="link.url" value="${link.url}" required="required">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">提交</button>
			</div>
		</div>
	</form>
</div>	
</body>
</html>