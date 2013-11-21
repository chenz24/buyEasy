package service.impl;

import java.util.List;

import dao.OrderDao;
import dao.impl.OrderDaoImpl;

import entity.Order;
import entity.OrderQuery;
import service.OrderService;

public class OrderServiceImpl implements OrderService{

	public List<Order> findByQuery(OrderQuery q) throws Exception {
		OrderDao dao = new OrderDaoImpl();
		List<Order> orders = dao.findByQuery(q);
		return orders;
	}

	public int countByQuery(OrderQuery q) throws Exception {
		OrderDao dao = new OrderDaoImpl();
		int count = dao.countByQuery(q);
		return count;
	}

	public Order findById(int id) throws Exception {
		OrderDao dao = new OrderDaoImpl();
		Order order = dao.findById(id);
		return order;
	}

}
