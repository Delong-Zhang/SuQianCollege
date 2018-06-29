<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>图片列表</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container">
	<%@include file="header.jsp" %>
	
	<br>
	
	<div>
		<form class="form-inline" method="post" action="">
			<a class="btn btn-warning" href="photoAdd.action">添加图片</a>
			<!-- 
			<input type="text" class="form-control" placeholder="输入查询标题">
			<input type="submit" class="btn btn-primary"/> -->
		</form>
	</div>
	
	<br>

	<table class="table table-bordered table-hover">
         <tr>
			<s:iterator value="photoList" status="status">
	         	<td>
	         		<p><img src='../<s:property value="url"/>' width="160px" height="160px"></p>
		         	<p><s:property value="name"/></p>
					<a class="btn btn-success" href="photoEdit.action?photo.id=<s:property value="id"/>">修改</a>
					<a class="btn btn-danger" href="photoDelete.action?photo.id=<s:property value="id"/>">删除</a>
				</td>
				<!-- 每隔6个元素换行 -->
				<s:if test="#status.count%6==0"></tr><tr></s:if>
		     </s:iterator>
       	</tr>
	</table>

<br>${pageTool}<br>
</div>
</body>
</html>