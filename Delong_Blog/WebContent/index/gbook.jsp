<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>留言</title>
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
			
				<s:if test="gbookList!=null && gbookList.size()>0">
					<h2>最新留言</h2>
					<div id="commentlist">
						<s:iterator var="gbook" value="gbookList">
							<article class="entry">
								<div class="comment">
									<p>${gbook.content}</p>
									<div class="commentreply">
										<p><s:date name="#gbook.systime"/></p>
									</div>
								</div>
							</article>
						</s:iterator>
					</div>
				</s:if>
			
				<!-- <h3 id="respond">添加留言</h3> -->
			  	<section class="entry">
					<form action="gadd.action" method="post" class="form">
					   <p class="text-area"><textarea name="gbook.content" required placeholder="请输入留言内容..."></textarea></p>
					   <p><input name="submit" type="image" src="images/submit.png"></p>
					</form>
				</section>
				
			</article>

		</section>
		
		<s:action name="right" executeResult="true"/>
	
		<div class="clear"></div>
	
	</section>

</div>

<jsp:include page="footer.jsp"/>

</body>
</html>