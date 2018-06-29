package com.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Topic;
import com.service.TopicService;

@Namespace("/admin")
@Results({
	@Result(name="list",location="/admin/topic_list.jsp"),
	@Result(name="add",location="/admin/topic_add.jsp"),
	@Result(name="edit",location="/admin/topic_edit.jsp"),
	@Result(name="relist", type="redirect", location="topicList.action"),
})	
@SuppressWarnings("serial")
public class TopicAction extends BaseAction{
	
	@Autowired
	private TopicService topicService;
	
	private List<Topic> topicList;
	private Topic topic;
	
	
	/**
	 * 类目列表
	 * @return
	 */
	@Action("topicList")
	public String list(){
		topicList = topicService.getList();
		return "list";
	}
	
	/**
	 * 添加类目
	 * @return
	 */
	@Action("topicAdd")
	public String add(){
		topicList = topicService.getList();
		return "add";
	}
	
	/**
	 * 保存类目
	 * @return
	 */
	@Action("topicSave")
	public String save(){
		topicService.save(topic);
		return "relist";
	}
	
	/**
	 * 编辑类目
	 * @return
	 */
	@Action("topicEdit")
	public String edit(){
		topic = topicService.get(topic.getId());
		topicList = topicService.getList();
		return "edit";
	}
	
	/**
	 * 更新
	 * @return
	 */
	@Action("topicUpdate")
	public String update(){
		topicService.update(topic);
		return "relist";
	}
	
	/**
	 * 删除
	 * @return
	 */
	@Action("topicDelete")
	public String delete(){
		topicService.delete(topic);
		return "relist";
	}


	public List<Topic> getTopicList() {
		return topicList;
	}

	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

}
