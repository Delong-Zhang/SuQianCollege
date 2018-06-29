<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>留言列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container">
	<%@include file="header.jsp" %>
	
	<br>

	<table class="table table-bordered table-hover">

	<tr>
		<th width="30%">留言内容</th>
		<th width="10%">时间</th>
		<th width="10%">操作</th>
	</tr>
	
	<s:iterator value="gbookList">
         <tr>
         	<td><p><s:property value="content"/></p></td>
			<td><p><s:date name="systime"/></p></td>
			<td>
				<a class="btn btn-danger" href="gbookDelete.action?gbook.id=<s:property value="id"/>">删除</a>
			</td>
       	</tr>
     </s:iterator>
     
</table>

<br>${pageTool}<br>
</div>
</body>
</html>