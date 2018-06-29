<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>博文</title>
<meta charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>

<div id="wrap">

	<jsp:include page="header.jsp"/>
	
	<section id="page">
	
		<!-- 
		<header id="pageheader" class="normalheader">
			<h2 class="sitedescription">
				Memoire is a free CSS Template inspired by Japanese Arts
				and the movie Memoirs of a Geisha.  </h2>
		</header> -->

		<section id="contents">

			<article class="post">
				<header class="postheader"><h2>${blog.name}</h2></header>
				<section class="entry"><p>${blog.content}</p></section>
			</article>
			
			<section id="comments" class="post">

				<s:if test="replyList!=null && replyList.size()>0">
					<h2>最新评论</h2>
					<div id="commentlist">
						<s:iterator var="reply" value="replyList">
							<article class="entry">
								<div class="comment">
									<p>${reply.content}</p>
									<div class="commentreply">
										<p><s:date name="#reply.systime"/></p>
									</div>
								</div>
							</article>
						</s:iterator>
					</div>
				</s:if>

				<!-- <h3 id="respond">添加评论</h3> -->
				<form action="reply.action" method="post" class="form">
			       <input name="reply.blog.id" type="hidden" value="${blog.id}" >
				   <p class="text-area"><textarea name="reply.content" required placeholder="请输入评论内容..."></textarea></p>
				   <p><input name="submit" type="image" src="images/submit.png"></p>
				</form>

			</section>

		</section>

		<s:action name="right" executeResult="true"/>

		<div class="clear"></div>
		
	</section>

</div>

<jsp:include page="footer.jsp"/>

</body>
</html>