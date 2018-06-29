<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>评论列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container">
	<%@include file="header.jsp" %>
	
	<br>

	<table class="table table-bordered table-hover">

	<tr>
		<th width="30%">评论内容</th>
		<th width="10%">时间</th>
		<th width="10%">操作</th>
	</tr>
	
	<s:iterator value="replyList">
         <tr>
         	<td><p><s:property value="content"/></p></td>
			<td><p><s:date name="systime"/></p></td>
			<td>
				<a class="btn btn-danger" href="replyDelete.action?reply.id=<s:property value="id"/>&blog.id=<s:property value="blog.id"/>">删除</a>
			</td>
       	</tr>
     </s:iterator>
     
</table>

<br>${pageTool}<br>
</div>
</body>
</html>