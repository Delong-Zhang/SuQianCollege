<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>添加博文</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<div class="container">
	<%@include file="header.jsp"%>

	<br><br>
	<form class="form-horizontal" action="blogSave.action" method="post">
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">标题</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="blog.name" value="" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_content" class="col-sm-2 control-label">内容</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="3" name="blog.content" required="required"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="select_topic" class="col-sm-2 control-label">分类</label>
			<div class="col-sm-2">
				<select class="form-control" id="select_topic" name="blog.topic.id">
					<s:iterator value="topicList">
						<option value="<s:property value="id"/>">
							<s:property value="name"/>
						</option>
					</s:iterator>
				</select>
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