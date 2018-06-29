package com.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.BlogDao;
import com.entity.Blog;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class BlogService {

	@Autowired	//spring注入类对象
	private BlogDao blogDao;
	@Autowired
	private ReplyService replyService;

	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 */
	public List<Blog> getList(int page, int size) {
		List<Blog> blogList = blogDao.selectList((page-1)*size, size);
		for (Blog blog : blogList) {
			// 截取内容前100字符
			if (blog.getContent()!=null && blog.getContent().length()>100) {
				blog.setContentPart(blog.getContent().substring(0, 100) + "...");
			}
			blog.setReplyCount(replyService.getTotal(blog.getId())); // 评论数量
		}
		return blogList;
	}

	/**
	 * 获取总数
	 */
	public int getTotal() {
		return (int) blogDao.selectCount();
	}

	/**
	 * 获取
	 * @param id
	 * @return
	 */
	public Blog get(int id) {
		return blogDao.select(Blog.class, id);
	}

	/**
	 * 通过topicid获取列表
	 * @param topicid
	 * @return
	 */
	public List<Blog> getListByTopicid(int topicid, int page, int size) {
		List<Blog> blogList = blogDao.selectListByTopicid(topicid, (page-1)*size, size);
		for (Blog blog : blogList) {
			// 截取内容前100字符
			if (blog.getContent()!=null && blog.getContent().length()>100) {
				blog.setContentPart(blog.getContent().substring(0, 100) + "...");
			}
			blog.setReplyCount(replyService.getTotal(blog.getId())); // 评论数量
		}
		return blogList;
	}
	
	/**
	 * 通过topicid获取总数
	 * @param topicid
	 * @return
	 */
	public int getTotalByTopicid(int topicid) {
		return (int) blogDao.selectCountByTopicid(topicid);
	}

	/**
	 * 添加
	 * @param blog
	 */
	public boolean save(Blog blog) {
		blog.setSystime(new Date());
		return blogDao.insert(blog) > 0;
	}
	
	/**
	 * 更新
	 * @param blog
	 */
	public boolean update(Blog blog) {
		blog.setSystime(new Date());
		return blogDao.update(blog);
	}
	
	/**
	 * 删除
	 * @param id
	 */
	public boolean delete(Blog blog) {
		return blogDao.delete(blog);
	}

}
