package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.UserDao;
import com.entity.Users;
import com.util.SafeUtil;

@Service	// 注解为service层spring管理bean
@Transactional	// 注解此类所有方法加入spring事务, 具体设置默认
public class UserService {

	@Autowired		//spring注入类对象
	private UserDao userDao;
	
	
	/**
	 * 验证用户密码
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean checkUser(String username, String password){
		Users user = userDao.selectByUsername(username);
		return user!=null && user.getPassword().equals(SafeUtil.encode(password));
	}

	/**
	 * 通过id获取
	 * @param userid
	 * @return
	 */
	public Users get(){
		return userDao.select(Users.class, 1);
	}
	
	/**
	 * 更新
	 * @param user
	 */
	public boolean update(Users user) {
		Users oldUser = get();
		// 更新前先验证密码是否正确
		if (oldUser.getPassword().equals(SafeUtil.encode(user.getPassword()))) {
			oldUser.setUsername(user.getUsername());
			oldUser.setPassword(SafeUtil.encode(user.getPasswordNew()));
			return userDao.update(oldUser);
		}
		return false;
	}

}
