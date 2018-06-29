<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>类目列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container">
	<%@include file="header.jsp" %>
	
	<br>
	
	<div>
		<form class="form-inline" method="post" action="">
			<a class="btn btn-warning" href="topicAdd.action">添加类目</a>
			<!-- 
			<input type="text" class="form-control" placeholder="输入查询标题">
			<input type="submit" class="btn btn-primary"/> -->
		</form>
	</div>
	
	<br>

	<table class="table table-bordered table-hover">

	<tr>
		<th width="10%">名称</th>
		<th width="10%">操作</th>
	</tr>
	
	<s:iterator value="topicList">
         <tr>
         	<td><p><s:property value="name"/></p></td>
			<td>
				<a class="btn btn-success" href="topicEdit.action?topic.id=<s:property value="id"/>">修改</a>
				<a class="btn btn-danger" href="topicDelete.action?topic.id=<s:property value="id"/>">删除</a>
			</td>
       	</tr>
     </s:iterator>
     
</table>
</div>
</body>
</html>