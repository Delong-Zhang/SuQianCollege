package com.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.Photo;
import com.service.PhotoService;
import com.util.PageUtil;
import com.util.UploadUtil;

@Namespace("/admin")
@Results({
	@Result(name="list",location="/admin/photo_list.jsp"),
	@Result(name="add",location="/admin/photo_add.jsp"),
	@Result(name="edit",location="/admin/photo_edit.jsp"),
	@Result(name="relist", type="redirect", location="photoList.action?page=${page}"),
})	
@SuppressWarnings("serial")
public class PhotoAction extends BaseAction{
	
	@Autowired
	private PhotoService photoService;
	
	private List<Photo> photoList;
	private Photo photo;
	
	// 由status2自动将上传文件进行装配到以下属性
	private File upload;		//获取上传文件
    private String uploadFileName;	//获取上传文件名称
    private String uploadContentType;		//获取上传文件类型
	

	/**
	 * 图片列表
	 * @return
	 */
    @Action("photoList")
	public String list(){
		int size = 24;
		photoList = photoService.getList(page, size);
		pageTool = PageUtil.getPageTool(servletRequest, photoService.getTotal(), page, size);
		return "list";
	}
	
	/**
	 * 添加图片
	 * @return
	 */
    @Action("photoAdd")
	public String add(){
		return "add";
	}
	
	/**
	 * 保存图片
	 * @return
	 */
    @Action("photoSave")
	public String save(){
		photo.setUrl(UploadUtil.fileUpload(upload, uploadFileName, "picture"));
		photoService.save(photo);
		return "relist";
	}
	
	/**
	 * 编辑图片
	 * @return
	 */
    @Action("photoEdit")
	public String edit(){
		photo = photoService.get(photo.getId());
		return "edit";
	}
	
	/**
	 * 更新图片
	 * @return
	 */
    @Action("photoUpdate")
	public String update(){
		if (upload != null) {
			photo.setUrl(UploadUtil.fileUpload(upload, uploadFileName, "picture"));
		}
		photoService.update(photo);
		return "relist";
	}
	
	/**
	 * 删除图片
	 * @return
	 */
    @Action("photoDelete")
	public String delete(){
		photoService.delete(photo);
		return "relist";
	}


	public List<Photo> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<Photo> photoList) {
		this.photoList = photoList;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	public PhotoService getPhotoService() {
		return photoService;
	}

	public void setPhotoService(PhotoService photoService) {
		this.photoService = photoService;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

}
