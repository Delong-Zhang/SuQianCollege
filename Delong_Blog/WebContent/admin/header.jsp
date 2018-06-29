<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
</head>
<body>

	<br><br>

	<ul role="tablist" class="nav nav-tabs">
        <li <%if(request.getRequestURI().contains("topic_")){out.print("class='active'");}%> role="presentation"><a href="topicList.action">类目管理</a></li>
        <li <%if(request.getRequestURI().contains("blog_")){out.print("class='active'");}%> role="presentation"><a href="blogList.action">博文管理</a></li>
        <li <%if(request.getRequestURI().contains("photo_")){out.print("class='active'");}%> role="presentation"><a href="photoList.action">相册管理</a></li>
        <li <%if(request.getRequestURI().contains("gbook_")){out.print("class='active'");}%> role="presentation"><a href="gbookList.action">留言管理</a></li>
        <li <%if(request.getRequestURI().contains("link_")){out.print("class='active'");}%> role="presentation"><a href="linkList.action">友链管理</a></li>
        <li <%if(request.getRequestURI().contains("user_")){out.print("class='active'");}%> role="presentation"><a href="userEdit.action">用户管理</a></li>
        <li role="presentation"><a href="login.jsp">注销</a></li>
    </ul>

</body>
</html>