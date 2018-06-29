<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
</head>
<body>

		<section id="sidebar">
			<h2>博文分类</h2>
			<ul>
				<s:iterator var="t" value="topicList">
					<li><a href="topic.action?topic.id=${t.id}" <s:if test="topic.id==#t.id">style="color:red;"</s:if>>${t.name}</a></li>
				</s:iterator>
			</ul>
			<h2>友情链接</h2>
			<ul>
				<s:iterator var="link" value="linkList">
					<li><a href="${link.url}" target="_blank">${link.name}</a></li>
				</s:iterator>
			</ul>
		</section>

</body>
</html>