package login.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class TravelCompanyBean {
	@NotBlank(message = "사업자번호를 입력하세요.")
	private String cnum;
	@NotEmpty(message = "이미지를 넣어주세요.")
	private String image;
	@Email(message = "이메일 형식이 아닙니다.")
	private String email;
	@NotBlank(message = "비밀번호를 입력하세요.")
	private String pwd;
	private String phone;
	private int approyn;
	private String reg_date;
	
	private MultipartFile upload;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		this.image = upload.getOriginalFilename();
	}
	public String getCnum() {
		return cnum;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getApproyn() {
		return approyn;
	}
	public void setApproyn(int approyn) {
		this.approyn = approyn;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
}
