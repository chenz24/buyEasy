package entity;
/**
 * 查询条件，虚拟的实体类
 * @author Chen
 *
 */
public class BookQuery {
	private String title;
	private String author;
	private String catid;
	private int status;
	private int attr;
	private int uid;
	private String isbn;
	private String publisher;
	private double price1;
	private double price2;
	private int discount1;
	private int discount2;
	private String order;//顺序，有待优化
	private int p;//当前页数
	private int num;//读取的个数
	
	public int getP() {
		return p;
	}
	public void setP(int p) {
		this.p = p;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCatid() {
		return catid;
	}
	public void setCatid(String catid) {
		this.catid = catid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getAttr() {
		return attr;
	}
	public void setAttr(int attr) {
		this.attr = attr;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public double getPrice1() {
		return price1;
	}
	public void setPrice1(double price1) {
		this.price1 = price1;
	}
	public double getPrice2() {
		return price2;
	}
	public void setPrice2(double price2) {
		this.price2 = price2;
	}
	public int getDiscount1() {
		return discount1;
	}
	public void setDiscount1(int discount1) {
		this.discount1 = discount1;
	}
	public int getDiscount2() {
		return discount2;
	}
	public void setDiscount2(int discount2) {
		this.discount2 = discount2;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
}
