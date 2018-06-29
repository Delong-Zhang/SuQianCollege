<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>用户信息</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<div class="container">
	<%@include file="header.jsp"%>

	<br><br>
	
	<form class="form-horizontal" action="userUpdate.action" method="post">
		<input type="hidden" name="user.id" value="${user.id}">
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="user.username" value="${user.username}" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_pass" class="col-sm-2 control-label">原密码</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_pass" name="user.password" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_pass_new" class="col-sm-2 control-label">新密码</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_pass" name="user.passwordNew" required="required">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">提交</button>
			</div>
		</div>
	</form>
	<s:actionerror/>
</div>	
</body>
</html>