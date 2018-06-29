<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
</head>
<body>

	<section id="top">
		<nav id="mainnav">
			<h1 id="sitename" class="logotext">
				<a href="index.action">我的博客</a>
			</h1>
			<ul>
				<li <%if(request.getRequestURI().contains("/index.jsp")){out.print("class='active'");}%>>
					<a href="index.action"><span>博文</span></a>
				</li>
				<li <%if(request.getRequestURI().contains("/photo.jsp")){out.print("class='active'");}%>>
					<a href="photo.action"><span>相册</span></a>
				</li>
				<li <%if(request.getRequestURI().contains("/gbook.jsp")){out.print("class='active'");}%>>
					<a href="gbook.action"><span>留言</span></a>
				</li>
				<li><a href="../admin/login.jsp" target="_blank"><span>登录</span></a></li>
			</ul>
		</nav>
	</section>

</body>
</html>