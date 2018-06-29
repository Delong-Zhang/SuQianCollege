<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>编辑博文</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<div class="container">
	<%@include file="header.jsp"%>

	<br><br>
	<form class="form-horizontal" action="blogUpdate.action" method="post">
		<input type="hidden" name="blog.id" value="${blog.id}">
		<div class="form-group">
			<label for="input_name" class="col-sm-2 control-label">标题</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name" name="blog.name" value="${blog.name}" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_content" class="col-sm-2 control-label">内容</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="3" name="blog.content" required="required">${blog.content}</textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="select_topic" class="col-sm-2 control-label">分类</label>
			<div class="col-sm-2">
				<select class="form-control" id="select_topic" name="blog.topic.id">
					<s:iterator value="topicList">
						<option value="<s:property value="id"/>" <s:if test="id==blog.topic.id">selected="selected"</s:if>>
							<s:property value="name"/>
						</option>
					</s:iterator>
				</select>
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