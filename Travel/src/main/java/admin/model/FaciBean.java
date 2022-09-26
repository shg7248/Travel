package admin.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class FaciBean {
	private String fno;
	private String fnum;
	private String name;
	private String fgroup;
	public String getFno() {
		return fno;
	}
	public void setFno(String fno) {
		this.fno = fno;
	}
	public String getFnum() {
		return fnum;
	}
	public void setFnum(String fnum) {
		this.fnum = fnum;
	}
	public String getname() {
		return name;
	}
	public void setFname(String name) {
		this.name = name;
	}
	public String getFgroup() {
		return fgroup;
	}
	public void setFgroup(String fgroup) {
		this.fgroup = fgroup;
	}
	
	
	
	
	
	
}
