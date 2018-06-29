package com.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.GbookDao;
import com.entity.Gbook;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class GbookService {

	@Autowired		//spring注入类对象
	private GbookDao gbookDao;

	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Gbook> getList(int page, int size){
		return gbookDao.selectList((page-1)*size, size);
	}

	/**
	 * 获取总数
	 * @return
	 */
	public int getTotal() {
		return (int)gbookDao.selectCount();
	}
	
	/**
	 * 添加
	 * @param gbook
	 */
	public boolean add(Gbook gbook) {
		gbook.setSystime(new Date());
		return gbookDao.insert(gbook) > 0;
	}

	/**
	 * 删除
	 * @param gbook
	 */
	public boolean delete(Gbook gbook) {
		return gbookDao.delete(gbook);
	}

}
