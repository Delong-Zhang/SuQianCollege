<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<title>相册</title>
<meta charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/lightbox.css"/>
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
			<!-- <h2>Photos</h2> -->
			<div class="photos">
				<s:iterator var="photo" value="photoList">
					<a href="../${photo.url}" data-lightbox="image-1" data-title="${photo.name} / <s:date name="#photo.systime"/>">
						<img src="../${photo.url}" width="150" height="100" alt="../${photo.name}">
					</a>
				</s:iterator>
				<div class="clear"></div>
			</div>
			
			<!-- 翻页按钮 -->
			<div class="blog-nav">
				<s:if test="page>1">
					<a href="photo.action?page=${page-1}" class="pre-link" title="上一页"></a>
				</s:if>
				<s:if test="page<pages">
					<a href="photo.action?page=${page+1}" class="next-link" title="下一页"></a>
				</s:if>
			</div>
			
		</section>
		
		<s:action name="right" executeResult="true"/>
		
		<div class="clear"/>
		
	</section>

</div>

<jsp:include page="footer.jsp"/>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lightbox.js"></script>
<script>
lightbox.option({
	albumLabel: "第%1张, 共%2张",	// 自定义图片数量文字
	showImageNumberLabel:true,	// 是否显示图片数量
	disableScrolling: true	,	// 禁止滚动
	wrapAround:false	// 是否循环显示
});
</script>

</body>
</html>