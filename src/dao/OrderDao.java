package dao;

import java.util.List;

import entity.Order;
import entity.OrderQuery;

public interface OrderDao {
	//public void add(Book book) throws Exception;
	public List<Order> findByQuery(OrderQuery query) throws Exception;
	public int countByQuery(OrderQuery query) throws Exception;
	public Order findById(int id) throws Exception;
	public void modify(Order order) throws Exception;
}
