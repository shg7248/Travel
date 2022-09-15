package board.board1.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Board1Bean {
	private int nnum;

	@NotEmpty(message = "제목을 입력하세요")
	private String subject;

	@NotEmpty(message = "내용과 이미지파일 둘중 하나를 입력하세요")
	private String content;
	private String reg_date;

	@NotEmpty(message = "항목을 선택하세요")
	private String type;
	private MultipartFile upload;

	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		if(content.equals(null) || content.equals("")) {
			this.content = upload.getOriginalFilename();
		}
	}

	public int getNnum() {
		return nnum;
	}
	public void setNnum(int nnum) {
		this.nnum = nnum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}


}
