package service;

import java.util.List;

import entity.Order;
import entity.OrderQuery;

public interface OrderService {
	public List<Order> findByQuery(OrderQuery q) throws Exception;
	public int countByQuery(OrderQuery q) throws Exception;
	public Order findById(int id) throws Exception;
}
