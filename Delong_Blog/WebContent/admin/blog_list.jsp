<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>博文列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container">
	<%@include file="header.jsp" %>
	
	<br>
	
	<div>
		<form class="form-inline" method="post" action="">
			<a class="btn btn-warning" href="blogAdd.action">添加博文</a>
			<!-- 
			<input type="text" class="form-control" placeholder="输入查询标题">
			<input type="submit" class="btn btn-primary"/> -->
		</form>
	</div>
	
	<br>

	<table class="table table-bordered table-hover">

	<tr>
		<th width="5%">类目</th>
		<th width="10%">标题</th>
		<th width="40%">内容</th>
		<th width="10%">时间</th>
		<th width="15%">操作</th>
	</tr>
	
	<s:iterator value="blogList">
         <tr>
         	<td><p><s:property value="topic.name"/></p></td>
         	<td><p><s:property value="name"/></p></td>
         	<td><p><s:property value="content"/></p></td>
			<td><p><s:date name="systime"/></p></td>
			<td>
				<p><a class="btn btn-primary" href="replyList.action?blog.id=<s:property value="id"/>">查看评论</a></p>
				<p><a class="btn btn-success" href="blogEdit.action?blog.id=<s:property value="id"/>">修改</a></p>
				<p><a class="btn btn-danger" href="blogDelete.action?blog.id=<s:property value="id"/>">删除</a></p>
			</td>
       	</tr>
     </s:iterator>
     
</table>

<br>${pageTool}<br>
</div>
</body>
</html>