package login.model;

import java.sql.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

@Component
public class TravelUserBean {
	private int mnum;
	@NotBlank(message = "이메일을 입력하세요.")
	@Email(message = "이메일 형식에 맞지 않습니다.")
	private String email;
	@NotBlank(message = "이름을 입력하세요.")
	private String name;
	@NotBlank(message = "비밀번호를 입력하세요")
	@Pattern(regexp = "^[a-z0-9]*$",message = "비밀번호는 숫자나 소문자로 작성하세요.")
	@Length(min = 10, message = "비밀번호는 10글자 이상으로 작성하세요.")
	private String pwd;
	private String phone;
	private String point;
	private String flatform;
	private String reg_date;
	
	
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getFlatform() {
		return flatform;
	}
	public void setFlatform(String flatform) {
		this.flatform = flatform;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
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
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	
}
