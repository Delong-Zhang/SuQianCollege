package com.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Blog;
import com.entity.Reply;
import com.service.ReplyService;
import com.util.PageUtil;

@Namespace("/admin")
@Results({
	@Result(name="list",location="/admin/reply_list.jsp"),
	@Result(name="relist", type="redirect", location="replyList.action?page=${page}&blog.id=${blog.id}"),
})	
@SuppressWarnings("serial")
public class ReplyAction extends BaseAction{
	
	@Autowired
	private ReplyService replyService;
	
	private List<Reply> replyList;
	private Reply reply;
	private Blog blog;
	

	/**
	 * 评论列表
	 * @return
	 */
	@Action("replyList")
	public String list(){
		int size = 10;
		replyList = replyService.getList(blog.getId(), page, size);
		pageTool = PageUtil.getPageTool(servletRequest, replyService.getTotal(blog.getId()), page, size);
		return "list";
	}
	
	/**
	 * 删除评论
	 * @return
	 */
	@Action("replyDelete")
	public String delete(){
		replyService.delete(reply);
		return "relist";
	}



	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}
	
}
