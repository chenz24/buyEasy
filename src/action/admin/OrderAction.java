package action.admin;

import java.util.LinkedList;
import java.util.List;

import entity.Order;
import entity.OrderQuery;

import service.OrderService;
import service.impl.OrderServiceImpl;
import util.Constant;
import util.Pager;
import action.BaseAction;

public class OrderAction extends BaseAction{
	private List<Order> orders = new LinkedList<Order>();
	private int p;
	private String pager;
	private OrderQuery query = new OrderQuery();
	private int id;
	private Order order;
	
	public String list(){
		try{
			OrderService service = new OrderServiceImpl();
			//计算总量
			if(p==0) p = 1;
			String curpage = httpRequest.getRequestURI();
			if(httpRequest.getQueryString()!=null){
				curpage = curpage + "?" + httpRequest.getQueryString();
			}
			int total = service.countByQuery(query);
			Pager page = new Pager(total, Constant.PERPAGE, p, curpage, 0, 6,"");
			pager = page.getPager(0);		
			query.setP(p);
			query.setNum(Constant.PERPAGE);//设定每页显示的数量
			orders = service.findByQuery(query);
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	public String edit(){
		try{
			OrderService service = new OrderServiceImpl();
			order = service.findById(id);
			System.out.println(order.getFull_address());
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public String getPager() {
		return pager;
	}

	public void setPager(String pager) {
		this.pager = pager;
	}

	public OrderQuery getQuery() {
		return query;
	}

	public void setQuery(OrderQuery query) {
		this.query = query;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
}
