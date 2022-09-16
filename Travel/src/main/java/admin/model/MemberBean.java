package admin.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

public class MemberBean {
	
	
	private int mnum;
	@NotBlank(message = "이메일을 입력해주세요")
	@Pattern(regexp = "^[A-Za-z0-9_\\.\\-]+@[A-Za-z0-9\\-]+\\.[A-Za-z0-9\\-]+$")
	private String email;
	@NotBlank(message = "이름을 입력해주세요")
	private String name;
	@NotBlank(message = "비밀번호를 입력해주세요")
	private String pwd;
	@NotBlank(message = "핸드폰번호를 입력해주세요")
	@Pattern(regexp = "^01(?:0|1|[6-9])-(?:\\\\d{3}|\\\\d{4})-\\\\d{4}$\r\n")
	private String phone;
	private String flatform;
	@NotBlank(message = "등록일을 입력해주세요")
	private String ref_date;
	private int point;
	
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getFlatform() {
		return flatform;
	}
	public void setFlatform(String flatform) {
		this.flatform = flatform;
	}
	public String getRef_date() {
		return ref_date;
	}
	public void setRef_date(String ref_date) {
		this.ref_date = ref_date;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
	
}
