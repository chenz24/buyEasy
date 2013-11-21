package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;
import entity.Address;

public class AddressDao {
	public void add(Address address) throws Exception{
		String sql = "insert into address (address_name,uid,consignee,email,country,province," + 
					"city,district,address,zipcode,tel,mobile,sign_building,best_time)" + 
					"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, address.getAddress_name());
		pst.setInt(2, address.getUid());
		pst.setString(3, address.getConsignee());
		pst.setString(4, address.getEmail());
		pst.setInt(5, address.getCountry());
		pst.setInt(6, address.getProvince());
		pst.setInt(7, address.getCity());
		pst.setInt(8, address.getDistrict());
		pst.setString(9, address.getAddress());
		pst.setString(10, address.getZipcode());
		pst.setString(11, address.getTel());
		pst.setString(12, address.getMobile());
		pst.setString(13, address.getSign_building());
		pst.setString(14, address.getBest_time());
		pst.executeUpdate();
		DBUtil.closeConnection();
	}
	
	public List<Address> findByUid(int id) throws Exception{
		String sql = "select * from address where uid=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, id);// is editing
		ResultSet rs = pst.executeQuery();
		List<Address> addrs = new ArrayList<Address>();
		while(rs.next()){
			Address a = new Address();
			a.setAid(rs.getInt("aid"));
			a.setAddress_name(rs.getString("address_name"));
			a.setAddress(rs.getString("address"));
			a.setConsignee(rs.getString("consignee"));
			a.setMobile(rs.getString("mobile"));
			a.setZipcode(rs.getString("zipcode"));
			a.setTel(rs.getString("tel"));
			a.setMobile(rs.getString("mobile"));
			addrs.add(a);
		}
		return addrs;
	}
	
	
	
	
	
	
	
	
	
}
