package admin.model;

import org.springframework.web.multipart.MultipartFile;

public class AdBean {
	private int adnum;
	private String subject;
	private String adimage;
	private String reg_date;
	private MultipartFile upload;
	
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		this.adimage = upload.getOriginalFilename();
	}
	
	public int getAdnum() {
		return adnum;
	}
	public void setAdnum(int adnum) {
		this.adnum = adnum;
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getAdimage() {
		return adimage;
	}
	public void setAdimage(String adimage) {
		this.adimage = adimage;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
}
