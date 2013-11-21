package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;


import util.DBUtil;

import dao.UserDao;
import entity.User;
import entity.UserQuery;

public class UserDaoImpl implements UserDao{
	public void save(User user) throws SQLException{
		String sql = "insert into user(username,password,email,regdate,lastloginip,lastlogintime,email_verify_code,level)" +
			"values(?,?,?,?,?,?,?,?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, user.getUsername());
		pst.setString(2, user.getPassword());
		pst.setString(3, user.getEmail());
		pst.setInt(4, user.getRegdate());
		pst.setString(5, user.getLastloginip());
		pst.setLong(6, user.getLastlogindate());
		pst.setString(7, user.getEmail_verify_code());
		pst.setInt(8, 0);
		pst.executeUpdate();
		//获取自增的ID
		ResultSet rs = pst.getGeneratedKeys();
		rs.next();
		int id = rs.getInt(1);
		user.setUid(id);
		DBUtil.closeConnection();		
	}
	//编辑用户
	public void update(User user,int uid) throws SQLException{
		//待编辑
		//String sql = "update user set username=?,";
	}
	//编辑用户等级
	public void verifyUser(int level,int uid) throws SQLException{
		String sql = "update user set level=? where uid=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, level);
		pst.setInt(2, uid);
		pst.executeUpdate();
		DBUtil.closeConnection();
	}
	//根据邮箱查询用户
	public User findByEmail(String email) throws SQLException{
		Connection conn = DBUtil.getConnection();
		String sql = "select * from user where email = ?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();
		User user = new User();
		if(rs.next()){			
			user.setUid(rs.getInt("uid"));
			user.setUsername(rs.getString("username"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setLastlogindate(rs.getInt("lastlogintime"));
		}
		DBUtil.closeConnection();
		return user;		
	}
	//根据ID查询用户
	public User findById(int id) throws SQLException{
		Connection conn = DBUtil.getConnection();
		String sql = "select * from user where uid = ?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		User user = new User();
		if(rs.next()){			
			user.setUid(rs.getInt("uid"));
			user.setUsername(rs.getString("username"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setLastlogindate(rs.getInt("lastlogintime"));
		}
		DBUtil.closeConnection();
		return user;
	}
	//检查邮箱验证码
	public String verifyEmailCode(int uid) throws Exception{
		Connection conn = DBUtil.getConnection();
		String sql = "select * from user where uid = ?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, uid);
		ResultSet rs = pst.executeQuery();
		String result;
		if(rs.next()){
			result =  rs.getString("email_verify_code");			
		}else{
			result = "";
		}
		DBUtil.closeConnection();
		return result;
	}
	public List<User> findByQuery(UserQuery query) throws Exception {
		String where = "where 1=1 ";
		String limit = "";
		if(query.getP()!=0){
			int current = (query.getP()-1) * query.getNum();
			limit = " limit " + current + "," + query.getNum();
		}
		if(query.getUsername()!=null){
			where += "and username like %" + query.getUsername() + "%";
		}
		String sql = "select * from user " + where + " order by uid desc " + limit;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		List<User> users = new LinkedList<User>();
		while(rs.next()){
			User u = new User();
			u.setEmail(rs.getString("email"));
			u.setLastlogindate(rs.getInt("lastlogintime"));
			u.setLastloginip(rs.getString("lastloginip"));
			u.setRegdate(rs.getInt("regdate"));
			//u.setStatus(rs.getInt("status"));
			u.setUid(rs.getInt("uid"));
			u.setUsername(rs.getString("username"));
			users.add(u);
		}
		return users;
	}
	public int countByQuery(UserQuery query) throws Exception {
		String where = "where 1=1 ";
		if(query.getUsername()!=null){
			where += " and username like %" + query.getUsername() + "%";
		}
		String sql = "select count(*) as c from user " + where ;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		int count = 0;
		if(rs.next()){
			count = rs.getInt("c");
		}
		return count;
	}
	
}
