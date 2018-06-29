package com.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity // 注解为hibernate实体
@Table(name="blog") // 注解对应的表名
public class Blog {
	
	@Id	// 注解主键
	@GeneratedValue // id生成策略  默认auto 相当于hibernate的native - 自增字段
	private int id;
	private String name;
	private String content;
	@Transient
	private String contentPart; // 内容前100字
	private Date systime;
	@ManyToOne
	@NotFound(action=NotFoundAction.IGNORE)
	private Topic topic;
	@Transient
	private int replyCount;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSystime() {
		return systime;
	}
	public void setSystime(Date systime) {
		this.systime = systime;
	}
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public String getContentPart() {
		return contentPart;
	}
	public void setContentPart(String contentPart) {
		this.contentPart = contentPart;
	}
	
}
