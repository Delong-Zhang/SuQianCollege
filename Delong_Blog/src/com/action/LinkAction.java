package com.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Links;
import com.service.LinkService;

@Namespace("/admin")
@Results({
	@Result(name="list",location="/admin/link_list.jsp"),
	@Result(name="add",location="/admin/link_add.jsp"),
	@Result(name="edit",location="/admin/link_edit.jsp"),
	@Result(name="relist", type="redirect", location="linkList.action"),
})	
@SuppressWarnings("serial")
public class LinkAction extends BaseAction{
	
	@Autowired
	private LinkService linkService;
	
	private List<Links> linkList;
	private Links link;
	
	
	/**
	 * 友链列表
	 * @return
	 */
	@Action("linkList")
	public String list(){
		linkList = linkService.getList();
		return "list";
	}
	
	/**
	 * 添加友链
	 * @return
	 */
	@Action("linkAdd")
	public String add(){
		linkList = linkService.getList();
		return "add";
	}
	
	/**
	 * 保存友链
	 * @return
	 */
	@Action("linkSave")
	public String save(){
		linkService.save(link);
		return "relist";
	}
	
	/**
	 * 编辑友链
	 * @return
	 */
	@Action("linkEdit")
	public String edit(){
		link = linkService.get(link.getId());
		linkList = linkService.getList();
		return "edit";
	}
	
	/**
	 * 更新
	 * @return
	 */
	@Action("linkUpdate")
	public String update(){
		linkService.update(link);
		return "relist";
	}
	
	/**
	 * 删除
	 * @return
	 */
	@Action("linkDelete")
	public String delete(){
		linkService.delete(link);
		return "relist";
	}


	public List<Links> getLinkList() {
		return linkList;
	}

	public void setLinkList(List<Links> linkList) {
		this.linkList = linkList;
	}

	public Links getLink() {
		return link;
	}

	public void setLink(Links link) {
		this.link = link;
	}

}
