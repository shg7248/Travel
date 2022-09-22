package board.faq.model;


import org.hibernate.validator.constraints.NotEmpty;

public class FaqBean {
	private int fnum;
	
	@NotEmpty(message = "질문을 입력하세요")
	private String question;

	@NotEmpty(message = "내용을 입력하세요")
	private String answer;
	
	private String reg_date;

	public int getFnum() {
		return fnum;
	}

	public void setFnum(int fnum) {
		this.fnum = fnum;
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

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
