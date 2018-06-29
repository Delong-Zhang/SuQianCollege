<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

<title>登录</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<style>
body {
	background-color: #eee;
	padding-bottom: 40px;
	padding-top: 40px;
}
.form-signin {
	margin: 0 auto;
	max-width: 400px;
	padding: 30px;
	background-color: #fff;
}
.form-signin h2 {
	margin-bottom: 30px;
}
.form-signin input {
	margin-bottom: 10px;
}
.form-signin .form-control {
	box-sizing: border-box;
	font-size: 16px;
	height: auto;
	padding: 10px;
	position: relative;
}
.form-signin .form-control:focus {
	z-index: 2;
}
.form-signin input[type="email"] {
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
	margin-bottom: -1px;
}
.form-signin input[type="password"] {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	margin-bottom: 10px;
}
</style>
</head>

<body>

	<div class="container">

		<form class="form-signin" action="userLogin.action" method="post">
			<h2 class="text-center">博客后台管理</h2>
			<input type="text" name="user.username" value="" class="form-control" placeholder="用户" required autofocus> 
			<input type="password" name="user.password" value="" class="form-control" placeholder="密码" required>
			<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
		</form>
		<s:actionerror />
		
	</div>

</body>
</html>
