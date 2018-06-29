package com.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Users;
import com.service.UserService;

@Namespace("/admin")
@Results({
	@Result(name="login", location="/admin/login.jsp"),
	@Result(name="edit", location="/admin/user_edit.jsp"),
	@Result(name="readmin", type="redirect", location="userEdit.action"),
})	
@SuppressWarnings("serial")
public class UserAction extends BaseAction{
	
	@Autowired
	private UserService userService;
	
	private Users user;
	
	
	/**
	 * 登录
	 * @return
	 */
	@Action("userLogin")
	public String login(){
		if (userService.checkUser(user.getUsername(), user.getPassword())) {
			return "readmin";
		}
		addActionError("用户名或密码错误!");
		return "login";
	}
	
	/**
	 * 编辑
	 * @return
	 */
	@Action("userEdit")
	public String edit(){
		user = userService.get();
		return "edit";
	}
	
	/**
	 * 更新
	 * @return
	 */
	@Action("userUpdate")
	public String update(){
		if (user.getUsername()==null || user.getUsername().trim().isEmpty()) {
			addActionError("用户名不能为空!");
			return edit();
		}
		if (user.getPassword()==null || user.getPassword().trim().isEmpty()) {
			addActionError("原密码不能为空!");
			return edit();
		}
		if (userService.update(user)) {
			addActionError("更新成功!");
		}else {
			addActionError("更新失败!");
		}
		return edit();
	}

	
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}
	
}
