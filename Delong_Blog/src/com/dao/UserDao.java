package com.dao;

import org.springframework.stereotype.Repository;

import com.entity.Users;

@Repository // 注册dao层bean等同于@Component
public class UserDao extends BaseDao{

	
	/**
	 * 通过用户名查找用户
	 * @return 无记录返回null
	 */
	public Users selectByUsername(String username){
		return getSession().createQuery("from Users where username=:username", Users.class)
				.setParameter("username", username).uniqueResult();
	}
	
}
