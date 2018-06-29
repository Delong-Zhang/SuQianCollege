package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.LinkDao;
import com.entity.Links;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class LinkService {

	@Autowired		//spring注入类对象
	private LinkDao linkDao;
	
	
	/**
	 * 获取列表
	 * @return
	 */
	public List<Links> getList(){
		return linkDao.selectList();
	}

	/**
	 * 获取
	 * @param id
	 * @return
	 */
	public Links get(int id) {
		return linkDao.select(Links.class, id);
	}

	/**
	 * 保存
	 * @param link
	 */
	public boolean save(Links link) {
		return linkDao.insert(link) > 0;
	}

	/**
	 * 更新
	 * @param link
	 */
	public boolean update(Links link) {
		return linkDao.update(link);
	}

	/**
	 * 删除
	 * @param link
	 */
	public boolean delete(Links link) {
		return linkDao.delete(link);
	}

}
