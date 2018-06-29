package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Reply;

@Repository // 注册dao层bean等同于@Component
public class ReplyDao extends BaseDao{

	
	/**
	 * 获取列表
	 * @param blogid
	 * @param begin
	 * @param size
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Reply> selectListByBlogid(int blogid, int begin, int size) {
		return getSession().createQuery("from Reply where blog_id=:blogid order by id desc")
				.setParameter("blogid", blogid).setFirstResult(begin).setMaxResults(size).list();
	}

	/**
	 * 获取数量
	 * @param blogid
	 * @return
	 */
	public long selectCountByBlogid(int blogid) {
		return getSession().createQuery("select count(*) from Reply where blog_id=:blogid", Long.class)
				.setParameter("blogid", blogid).uniqueResult();
	}
	
}
