package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Links;

@Repository // 注册dao层bean等同于@Component
public class LinkDao extends BaseDao{

	/**
	 * 获取列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Links> selectList() {
		return getSession().createQuery("from Links").list();
	}
	
}
