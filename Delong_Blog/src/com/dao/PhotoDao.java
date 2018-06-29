package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Photo;

@Repository // 注册dao层bean等同于@Component
public class PhotoDao extends BaseDao{

	
	/**
	 * 获取列表
	 * @param begin
	 * @param size
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Photo> selectList(int begin, int size) {
		return getSession().createQuery("from Photo order by id desc")
				.setFirstResult(begin).setMaxResults(size).list();
	}

	/**
	 * 获取总数
	 * @return
	 */
	public long selectCount() {
		return getSession().createQuery("select count(*) from Photo", Long.class).uniqueResult();
	}

	
}