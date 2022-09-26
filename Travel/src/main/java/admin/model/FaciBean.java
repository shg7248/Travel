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
<<<<<<< HEAD
	public String getname() {
=======
	public String getName() {
>>>>>>> branch 'dev' of https://github.com/shg7248/Travel.git
		return name;
	}
<<<<<<< HEAD
	public void setFname(String name) {
=======
	public void setName(String name) {
>>>>>>> branch 'dev' of https://github.com/shg7248/Travel.git
		this.name = name;
	}
	public String getFgroup() {
		return fgroup;
	}
	public void setFgroup(String fgroup) {
		this.fgroup = fgroup;
	}
	
	
	
	
	
	
}
