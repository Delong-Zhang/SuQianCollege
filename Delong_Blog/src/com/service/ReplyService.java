package com.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ReplyDao;
import com.entity.Reply;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class ReplyService {

	@Autowired		//spring注入类对象
	private ReplyDao replyDao;

	
	/**
	 * 获取列表
	 * @param blogid
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Reply> getList(int blogid, int page, int size) {
		return replyDao.selectListByBlogid(blogid, (page-1)*size, size);
	}
	
	/**
	 * 获取数量
	 * @param blogid
	 * @return
	 */
	public int getTotal(int blogid){
		return (int) replyDao.selectCountByBlogid(blogid);
	}

	/**
	 * 添加评论
	 * @param reply
	 */
	public boolean add(Reply reply) {
		reply.setSystime(new Date());
		return replyDao.insert(reply) > 0;
	}
	
	/**
	 * 删除评论
	 * @param reply
	 * @return
	 */
	public boolean delete(Reply reply){
		return replyDao.delete(reply);
	}

}
