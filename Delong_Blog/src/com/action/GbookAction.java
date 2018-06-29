package com.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Gbook;
import com.service.GbookService;
import com.util.PageUtil;

@Namespace("/admin")
@Results({
	@Result(name="list",location="/admin/gbook_list.jsp"),
	@Result(name="relist", type="redirect", location="gbookList.action?page=${page}"),
})	
@SuppressWarnings("serial")
public class GbookAction extends BaseAction{
	
	@Autowired
	private GbookService gbookService;
	
	private List<Gbook> gbookList;
	private Gbook gbook;
	

	/**
	 * 留言列表
	 * @return
	 */
	@Action("gbookList")
	public String list(){
		int size = 10;
		gbookList = gbookService.getList(page, size);
		pageTool = PageUtil.getPageTool(servletRequest, gbookService.getTotal(), page, size);
		return "list";
	}
	
	/**
	 * 删除留言
	 * @return
	 */
	@Action("gbookDelete")
	public String delete(){
		gbookService.delete(gbook);
		return "relist";
	}



	public List<Gbook> getGbookList() {
		return gbookList;
	}

	public void setGbookList(List<Gbook> gbookList) {
		this.gbookList = gbookList;
	}

	public Gbook getGbook() {
		return gbook;
	}

	public void setGbook(Gbook gbook) {
		this.gbook = gbook;
	}
	
}
