package entity;

public class Order {
	private int oid;
	private int uid;
	private int status;
	private int order_time;
	private double total_price;
	private String receive_name;
	private String full_address;
	private String zipcode;
	private String tel;
	private String mobile;
	
	
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getOrder_time() {
		return order_time;
	}
	public void setOrder_time(int orderTime) {
		order_time = orderTime;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double totalPrice) {
		total_price = totalPrice;
	}
	public String getReceive_name() {
		return receive_name;
	}
	public void setReceive_name(String receiveName) {
		receive_name = receiveName;
	}
	public String getFull_address() {
		return full_address;
	}
	public void setFull_address(String fullAddress) {
		full_address = fullAddress;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
}
