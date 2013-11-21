package entity;

public class CartItem {
	private Book book;
	private int number;
	private boolean isbuy;
	
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public boolean isIsbuy() {
		return isbuy;
	}
	public void setIsbuy(boolean isbuy) {
		this.isbuy = isbuy;
	}
	
	
}
