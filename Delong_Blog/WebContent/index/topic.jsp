<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>博文分类</title>
<meta charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>

<div id="wrap">

	<jsp:include page="header.jsp"/>
	
	<section id="page">
	
		<section id="contents">
		
			<s:iterator var="blog" value="blogList">
				<article class="post">
					<header class="postheader">
						<h2><a href="blog.action?blog.id=${blog.id}">${blog.name}</a></h2>
						<!-- <p class="postinfo">Published on <time>18 August, 2010</time> under <a href="#">CSS Templates </a></p> -->
					</header>
					<p>${blog.contentPart}</p>
					<footer class="postfooter">
						<ul>
							<li class="plink"><a href="blog.action?blog.id=${blog.id}">查看详情</a></li>
							<li class="cment"><a href="blog.action?blog.id=${blog.id}">查看评论(${blog.replyCount})</a></li>
						</ul>
					</footer>
				</article>
			</s:iterator>

			<!-- 翻页按钮 -->
			<div class="blog-nav">
				<s:if test="page>1">
					<a href="topic.action?topic.id=${topic.id}&page=${page-1}" class="pre-link" title="上一页"></a>
				</s:if>
				<s:if test="page<pages">
					<a href="topic.action?topic.id=${topic.id}&page=${page+1}" class="next-link" title="下一页"></a>
				</s:if>
			</div>
				
		</section>
	
		<s:action name="right" executeResult="true"/>
		
		<div class="clear"/>
		
	</section>


</div>

<jsp:include page="footer.jsp"/>

</body>
</html>