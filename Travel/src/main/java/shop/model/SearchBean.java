package shop.model;

public class SearchBean {

	private int anum;
	private int rating;
	private String canum;
	private String name;
	private int price;
	private String start;
	private String end;
	private String image;
	
	private String fac;
	private int count;
	private String rcode;
	private String region;
	private String sort;
	private String lat;	// 위도
	private String lng;	// 적도
	private String around;
	private double average;
	
	SearchBean() {
		this.price = 300000;
		this.count = 2;
		this.sort = "LOWPRICE";
		this.around = "30";
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
	public String getFac() {
		return fac;
	}
	public void setFac(String fac) {
		this.fac = fac;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getRcode() {
		return rcode;
	}

	public void setRcode(String rcode) {
		this.rcode = rcode;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getAround() {
		return around;
	}

	public void setAround(String around) {
		this.around = around;
	}

	public double getAverage() {
		return average;
	}

	public void setAverage(double average) {
		this.average = average;
	}
}
