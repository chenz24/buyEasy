package service;

import java.util.List;

import entity.CartItem;
import entity.Order;

public interface CartService {
	public String add(int id) throws Exception;
	public List<CartItem> getBooks(boolean buy) throws Exception;
	public double PriceAll() throws Exception;
	public void del(int id) throws Exception;
	public void modify(int id,int num) throws Exception;
	public void recover(int id) throws Exception;
	public void orderAdd(Order order,String addrJson) throws Exception;
}
