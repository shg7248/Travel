package board.inquiry.model;

import org.hibernate.validator.constraints.NotEmpty;

public class InquiryBean {
	private int inum;
	private int mnum;

	@NotEmpty(message = "제목을 입력하세요")
	private String subject;

	@NotEmpty(message = "내용을 입력하세요")
	private String question;
	
	private String answer;
	private String reg_date1;
	
	private String reg_date2;
	private String progress;
	
	private String email;
	private String sort;
	
	
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getInum() {
		return inum;
	}
	public void setInum(int inum) {
		this.inum = inum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getReg_date1() {
		return reg_date1;
	}
	public void setReg_date1(String reg_date1) {
		this.reg_date1 = reg_date1;
	}
	public String getReg_date2() {
		return reg_date2;
	}
	public void setReg_date2(String reg_date2) {
		this.reg_date2 = reg_date2;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	
	
}
