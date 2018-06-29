<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>编辑图片</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<div class="container">
	<%@include file="header.jsp"%>

	<br><br>
	<form class="form-horizontal" action="photoUpdate.action" method="post" enctype="multipart/form-data">
		<input type="hidden" name="photo.id" value="${photo.id}">
		<input type="hidden" name="photo.url" value="${photo.url}">
		<div class="form-group">
			<label for="input_file" class="col-sm-2 control-label">替换图片</label> 
			<div class="col-sm-6"><img src="../${photo.url}" width="100" height="100"/>
				<input type="file" name="upload"  id="input_file">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label" required="required">图片介绍</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="photo.name" value="${photo.name}">
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