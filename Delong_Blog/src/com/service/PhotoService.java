package com.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.PhotoDao;
import com.entity.Photo;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class PhotoService {

	@Autowired		//spring注入类对象
	private PhotoDao photoDao;

	
	/**
	 * 获取列表
	 * @param page
	 * @param size
	 * @return
	 */
	public List<Photo> getList(int page, int size) {
		return photoDao.selectList((page-1)*size, size);
	}

	/**
	 * 获取总数
	 * @return
	 */
	public int getTotal() {
		return (int) photoDao.selectCount();
	}
	
	/**
	 * 获取
	 * @param id
	 * @return
	 */
	public Photo get(int id) {
		return photoDao.select(Photo.class, id);
	}

	/**
	 * 保存
	 * @param photo
	 */
	public boolean save(Photo photo) {
		photo.setSystime(new Date());
		return photoDao.insert(photo) > 0;
	}

	/**
	 * 更新
	 * @param photo
	 */
	public boolean update(Photo photo) {
		photo.setSystime(new Date());
		return photoDao.update(photo);
	}
	
	/**
	 * 删除
	 * @param photo
	 */
	public boolean delete(Photo photo) {
		return photoDao.delete(photo);
	}

}
