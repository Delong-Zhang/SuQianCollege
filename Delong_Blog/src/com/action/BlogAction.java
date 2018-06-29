package com.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Blog;
import com.entity.Topic;
import com.service.BlogService;
import com.service.TopicService;
import com.util.PageUtil;

@Namespace("/admin")
@Results({
	@Result(name="list",location="/admin/blog_list.jsp"),
	@Result(name="add",location="/admin/blog_add.jsp"),
	@Result(name="edit",location="/admin/blog_edit.jsp"),
	@Result(name="relist", type="redirect", location="blogList.action?page=${page}"),
})	
@SuppressWarnings("serial")
public class BlogAction extends BaseAction{
	
	@Autowired
	private BlogService blogService;
	@Autowired
	private TopicService topicService;
	
	private List<Blog> blogList;
	private List<Topic> topicList;
	private Blog blog;
	
	
	/**
	 * 博文列表
	 * @return
	 */
	@Action("blogList")
	public String list(){
		int size = 10;
		blogList = blogService.getList(page, size);
		pageTool = PageUtil.getPageTool(servletRequest, blogService.getTotal(), page, size);
		return "list";
	}
	
	/**
	 * 添加博文
	 * @return
	 */
	@Action("blogAdd")
	public String add(){
		topicList = topicService.getList();
		return "add";
	}
	
	/**
	 * 保存博文
	 * @return
	 */
	@Action("blogSave")
	public String save(){
		blogService.save(blog);
		return "relist";
	}
	
	/**
	 * 编辑博文
	 * @return
	 */
	@Action("blogEdit")
	public String edit(){
		blog = blogService.get(blog.getId());
		topicList = topicService.getList();
		return "edit";
	}
	
	/**
	 * 更新博文
	 * @return
	 */
	@Action("blogUpdate")
	public String update(){
		blogService.update(blog);
		return "relist";
	}
	
	/**
	 * 删除博文
	 * @return
	 */
	@Action("blogDelete")
	public String delete(){
		blogService.delete(blog);
		return "relist";
	}


	public List<Blog> getBlogList() {
		return blogList;
	}

	public void setBlogList(List<Blog> blogList) {
		this.blogList = blogList;
	}

	public List<Topic> getTopicList() {
		return topicList;
	}

	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

}
