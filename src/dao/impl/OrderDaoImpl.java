package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

import dao.OrderDao;
import entity.Order;
import entity.OrderQuery;

public class OrderDaoImpl implements OrderDao{

	public int countByQuery(OrderQuery query) throws Exception {
		String where = "1 = 1";
		if(query.getReceive_name()!=null){
			where += " and receive_name=" + query.getReceive_name();
		}
		if(query.getOid()!=0){
			where += " and oid =" + query.getOid();
		}
		String sql = "select count(*) as c from order2 where " + where ;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		int count = 0;
		if(rs.next()){
			count = rs.getInt("c");
		}
		return count;
	}

	public Order findById(int id) throws Exception {
		String sql = "select * from order2 where oid=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		Order order = new Order();
		if(rs.next()){
			order.setFull_address(rs.getString("full_address"));
			order.setMobile(rs.getString("mobile"));
			order.setOid(rs.getInt("oid"));
			order.setOrder_time(rs.getInt("order_time"));
			order.setReceive_name(rs.getString("receive_name"));
			order.setStatus(rs.getInt("status"));
			order.setTel(rs.getString("tel"));
			order.setTotal_price(rs.getDouble("total_price"));
		}
		return order;
	}

	public List<Order> findByQuery(OrderQuery query) throws Exception {
		String where = "";
		String limit = "";
		if(query.getP()!=0){
			int current = (query.getP()-1) * query.getNum();
			limit = " limit " + current + "," + query.getNum();
		}
		String sql = "select * from order2 where 1 = 1 " + where + " order by oid desc" + limit;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		List<Order> orders = new ArrayList<Order>();
		while(rs.next()){
			Order o = new Order();
			o.setOid(rs.getInt("oid"));
			o.setReceive_name(rs.getString("receive_name"));
			o.setFull_address(rs.getString("full_address"));
			o.setMobile(rs.getString("mobile"));
			o.setOrder_time(rs.getInt("order_time"));
			o.setStatus(rs.getInt("status"));
			o.setTel(rs.getString("tel"));
			o.setUid(rs.getInt("uid"));
			o.setTotal_price(rs.getDouble("total_price"));
			o.setZipcode(rs.getString("zipcode"));
			orders.add(o);
		}
		return orders;
	}

	public void modify(Order order) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
