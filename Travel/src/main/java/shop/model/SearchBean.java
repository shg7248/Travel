package shop.model;

public class SearchBean {

	private int anum;
	private int rating;
	private String canum;
	private String name;
	private String addr;
	private int price;
	private String start;
	private String end;
	private String image;
	
	private String fac1;
	private String fac2;
	private int count;
	private int resion;
	private String sort;
	
	SearchBean() {
		this.price = 300000;
		this.count = 2;
		this.resion = 11;
		this.sort = "LOWPRICE";
	}
	
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getCanum() {
		return canum;
	}
	public void setCanum(String canum) {
		this.canum = canum;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getFac1() {
		return fac1;
	}
	public void setFac1(String fac1) {
		this.fac1 = fac1;
	}
	public String getFac2() {
		return fac2;
	}
	public void setFac2(String fac2) {
		this.fac2 = fac2;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getResion() {
		return resion;
	}
	public void setResion(int resion) {
		this.resion = resion;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
}
