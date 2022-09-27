package admin.model;

import org.springframework.web.multipart.MultipartFile;

public class AdBean {
	private String adname;
	private String aimage;
	private String adcontents;
	private MultipartFile upload;
	
	public String getAdname() {
		return adname;
	}
	public void setAdname(String adname) {
		this.adname = adname;
	}
	public String getAimage() {
		return aimage;
	}
	public void setAimage(String aimage) {
		this.aimage = aimage;
	}
	public String getAdcontents() {
		return adcontents;
	}
	public void setAdcontents(String adcontents) {
		this.adcontents = adcontents;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
	
	
}
