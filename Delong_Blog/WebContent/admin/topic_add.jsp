<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>添加类目</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<div class="container">
	<%@include file="header.jsp"%>

	<br><br>
	
	<form class="form-horizontal" action="topicSave.action" method="post">
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label" required="required">名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="topic.name" value="">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">添加</button>
			</div>
		</div>
	</form>
</div>	
</body>
</html>