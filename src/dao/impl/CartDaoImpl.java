package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import util.DBUtil;
import dao.CartDao;
import entity.Book;
import entity.CartItem;
import entity.Order;

public class CartDaoImpl implements CartDao{
	public void orderAdd(Order order,List<CartItem> list) throws Exception{
		String sql = "insert into order2 (uid,status,order_time,total_price,receive_name,full_address,zipcode,tel,mobile)values(?,?,?,?,?,?,?,?,?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, order.getUid());
		pst.setInt(2, 0);
		pst.setInt(3, order.getOrder_time());
		pst.setDouble(4, order.getTotal_price());
		pst.setString(5, order.getReceive_name());
		pst.setString(6, order.getFull_address());
		pst.setString(7, order.getZipcode());
		pst.setString(8, order.getTel());
		pst.setString(9, order.getMobile());
		pst.executeUpdate();
		//获取自增ID
		ResultSet rs = pst.getGeneratedKeys();
		rs.next();
		int id = rs.getInt(1);
		//item表处理
		Iterator<CartItem> it = list.iterator();
		sql = "insert into item (oid,gid,title,price,discount,sale_num) values " +
		"(?,?,?,?,?,?)";
		pst = conn.prepareStatement(sql);
		while(it.hasNext()){
			pst.setInt(1, id);
			CartItem ci = it.next();
			pst.setInt(2, ci.getBook().getGid());
			pst.setString(3, ci.getBook().getTitle());
			pst.setDouble(4, ci.getBook().getPrice());
			pst.setInt(5, ci.getBook().getDiscount());
			pst.setInt(6, ci.getNumber());
			pst.executeUpdate();
		}		
		DBUtil.closeConnection();
	}
}
