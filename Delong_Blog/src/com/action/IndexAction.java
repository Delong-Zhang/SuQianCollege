package com.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Blog;
import com.entity.Gbook;
import com.entity.Links;
import com.entity.Photo;
import com.entity.Reply;
import com.entity.Topic;
import com.service.BlogService;
import com.service.GbookService;
import com.service.LinkService;
import com.service.PhotoService;
import com.service.ReplyService;
import com.service.TopicService;

@Namespace("/index")
@Results({
	@Result(name="index",location="/index/index.jsp"),
	@Result(name="photo",location="/index/photo.jsp"),
	@Result(name="gbook",location="/index/gbook.jsp"),
	@Result(name="blog",location="/index/blog.jsp"),
	@Result(name="topic",location="/index/topic.jsp"),
	@Result(name="right",location="/index/right.jsp"),
	@Result(name="regbook", type="redirect", location="gbook.action"),
	@Result(name="reblog", type="redirect", location="blog.action?blog.id=${reply.blog.id}"),
})	
@SuppressWarnings("serial")
public class IndexAction extends BaseAction{
	
	@Autowired
	private TopicService topicService;
	@Autowired
	private LinkService linkService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private PhotoService photoService;
	@Autowired
	private GbookService gbookService;
	
	private List<Topic> topicList;
	private List<Links> linkList;
	private List<Blog> blogList;
	private List<Reply> replyList;
	private List<Photo> photoList;
	private List<Gbook> gbookList;
	
	private Blog blog;
	private Topic topic;
	private Reply reply;
	private Gbook gbook;
	
	
	/**
	 * 首页
	 * @return
	 */
	@Action("index")
	public String index(){
		int size = 4; // 每页数量
		setPages(blogService.getTotal(), size);
		blogList = blogService.getList(page, size);
		return "index";
	}
	
	/**
	 * 相册
	 * @return
	 */
	@Action("photo")
	public String photo(){
		int size = 12; // 每页数量
		setPages(photoService.getTotal(), size);
		photoList = photoService.getList(page, size);
		return "photo";
	}
	
	/**
	 * 留言
	 * @return
	 */
	@Action("gbook")
	public String gbook(){
		int size = 5; // 每页数量
		gbookList = gbookService.getList(1, size);
		return "gbook";
	}
	
	/**
	 * 添加留言
	 * @return
	 */
	@Action("gadd")
	public String gadd(){
		gbookService.add(gbook);
		return "regbook";
	}
	
	/**
	 * 博文详情
	 * @return
	 */
	@Action("blog")
	public String blog(){
		int size = 5; // 每页数量
		blog = blogService.get(blog.getId());
		replyList = replyService.getList(blog.getId(), 1, size);
		return "blog";
	}
	
	/**
	 * 博文评论
	 * @return
	 */
	@Action("reply")
	public String reply(){
		replyService.add(reply);
		return "reblog";
	}
	
	/**
	 * 博文分类
	 * @return
	 */
	@Action("topic")
	public String topic(){
		int size = 3; // 每页数量
		topic = topicService.get(topic.getId());
		setPages(blogService.getTotalByTopicid(topic.getId()), size);
		blogList = blogService.getListByTopicid(topic.getId(), page, size);
		return "topic";
	}
	
	/**
	 * 右侧分类
	 * @return
	 */
	@Action("right")
	public String right(){
		topicList = topicService.getList();
		linkList = linkService.getList();
		return "right";
	}

	
	
	public List<Topic> getTopicList() {
		return topicList;
	}

	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}

	public List<Links> getLinkList() {
		return linkList;
	}

	public void setLinkList(List<Links> linkList) {
		this.linkList = linkList;
	}

	public List<Blog> getBlogList() {
		return blogList;
	}

	public void setBlogList(List<Blog> blogList) {
		this.blogList = blogList;
	}

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

	public List<Photo> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<Photo> photoList) {
		this.photoList = photoList;
	}

	public List<Gbook> getGbookList() {
		return gbookList;
	}

	public void setGbookList(List<Gbook> gbookList) {
		this.gbookList = gbookList;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public Gbook getGbook() {
		return gbook;
	}

	public void setGbook(Gbook gbook) {
		this.gbook = gbook;
	}
	
}
