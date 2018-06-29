package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Blog;

@Repository // 注册dao层bean等同于@Component
public class BlogDao extends BaseDao{

	
	/**
	 * 获取列表
	 * @param begin
	 * @param size
	 */
	@SuppressWarnings("unchecked")
	public List<Blog> selectList(int begin, int size) {
		return getSession().createQuery("from Blog order by id desc")
				.setFirstResult(begin).setMaxResults(size).list();
	}

	/**
	 * 获取数量
	 * @return
	 */
	public long selectCount(){
		return getSession().createQuery("select count(*) from Blog", Long.class).uniqueResult();
	}

	/**
	 * 通过topicid获取列表
	 * @param begin
	 * @param size
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Blog> selectListByTopicid(int topicid, int begin, int size) {
		return getSession().createQuery("from Blog where topic_id=:topicid order by id desc")
				.setParameter("topicid", topicid).setFirstResult(begin).setMaxResults(size).list();
	}
	
	/**
	 * 通过topicid获取总数
	 * @return
	 */
	public long selectCountByTopicid(int topicid){
		return getSession().createQuery("select count(*) from Blog where topic_id=:topicid", Long.class)
				.setParameter("topicid", topicid).uniqueResult();
	}
	
}
