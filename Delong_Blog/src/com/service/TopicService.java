package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.TopicDao;
import com.entity.Topic;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class TopicService {

	@Autowired		//spring注入类对象
	private TopicDao topicDao;
	
	
	/**
	 * 获取列表
	 * @return
	 */
	public List<Topic> getList(){
		return topicDao.selectList();
	}

	/**
	 * 获取
	 * @param id
	 * @return
	 */
	public Topic get(int id) {
		return topicDao.select(Topic.class, id);
	}

	/**
	 * 保存
	 * @param topic
	 */
	public boolean save(Topic topic) {
		return topicDao.insert(topic) > 0;
	}

	/**
	 * 更新
	 * @param topic
	 */
	public boolean update(Topic topic) {
		return topicDao.update(topic);
	}

	/**
	 * 删除
	 * @param topic
	 */
	public boolean delete(Topic topic) {
		return topicDao.delete(topic);
	}

}
