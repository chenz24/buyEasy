package dao;

import java.util.List;

import entity.CartItem;
import entity.Order;

public interface CartDao {
	public void orderAdd(Order order,List<CartItem> list) throws Exception;
}
