package admin.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class CompanyBean {
	
	@NotBlank(message = "이름을 입력해주세요")
	private String cnum;
	@NotEmpty(message= "사업자 등록증을 첨부해주세요")
	private String image;
	@NotBlank(message = "이메일을 입력해주세요")
	@Pattern(regexp = "^[A-Za-z0-9_\\.\\-]+@[A-Za-z0-9\\-]+\\.[A-Za-z0-9\\-]+$")
	private String email;
	@NotBlank(message = "비밀번호를 입력해주세요")
	private String pwd;
	@NotBlank(message = "핸드폰번호를 입력해주세요")
	@Pattern(regexp = "^01(?:0|1|[6-9])-(?:\\\\d{3}|\\\\d{4})-\\\\d{4}$\r\n")
	private String phone;
	private String approyn;
	private String reg_date;
	
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
	public String getApproyn() {
		return approyn;
	}
	public void setApproyn(String approyn) {
		this.approyn = approyn;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
	
}
