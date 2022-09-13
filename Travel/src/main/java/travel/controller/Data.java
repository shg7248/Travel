package travel.controller;

import java.io.Serializable;

public class Data implements Serializable {
	private static final long serialVersionUID = 1L;
	
	public Integer data1;
	public Long data2;
	public String data3;
	
	public Data(Integer data1, Long data2, String data3) {
		super();
		this.data1 = data1;
		this.data2 = data2;
		this.data3 = data3;
	}

	@Override
	public String toString() {
		return "Data [data1=" + data1 + ", data2=" + data2 + ", data3=" + data3 + "]";
	}
}
