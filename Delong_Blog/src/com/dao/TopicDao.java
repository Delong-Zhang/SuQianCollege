package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Topic;

@Repository // 注册dao层bean等同于@Component
public class TopicDao extends BaseDao{

	
	/**
	 * 获取列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Topic> selectList() {
		return getSession().createQuery("from Topic order by id desc").list();
	}
	
	
}
