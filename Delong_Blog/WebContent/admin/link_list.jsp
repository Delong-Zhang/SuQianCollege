<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>友链列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container">
	<%@include file="header.jsp" %>
	
	<br>
	
	<div>
		<form class="form-inline" method="post" action="">
			<a class="btn btn-warning" href="linkAdd.action">添加友链</a>
			<!-- 
			<input type="text" class="form-control" placeholder="输入查询标题">
			<input type="submit" class="btn btn-primary"/> -->
		</form>
	</div>
	
	<br>

	<table class="table table-bordered table-hover">

	<tr>
		<th width="10%">名称</th>
		<th width="10%">地址</th>
		<th width="10%">操作</th>
	</tr>
	
	<s:iterator value="linkList">
         <tr>
         	<td><p><s:property value="name"/></p></td>
         	<td><p><a href="<s:property value="url"/>" target="_blank"><s:property value="url"/></a></p></td>
			<td>
				<a class="btn btn-success" href="linkEdit.action?link.id=<s:property value="id"/>">修改</a>
				<a class="btn btn-danger" href="linkDelete.action?link.id=<s:property value="id"/>">删除</a>
			</td>
       	</tr>
     </s:iterator>
     
</table>
</div>
</body>
</html>