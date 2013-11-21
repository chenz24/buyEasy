package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

import entity.Category;

public class CategoryDao {
	
	public Category findById(int cid) throws Exception{
		String sql = "select * from category where cid = ?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, cid);
		ResultSet rs = pst.executeQuery();
		Category c = new Category();
		if(rs.next()){
			c.setCatName(rs.getString("catname"));
			c.setCid(rs.getInt("cid"));
			c.setCount(rs.getInt("count"));
			c.setParentId(rs.getInt("parentid"));
			c.setKeywords(rs.getString("keywords"));
		}
		return c;
	}
	
	public List<Category> findSiblings(int pid) throws Exception{
		String sql = "select * from category where parentid = ?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, pid);
		ResultSet rs = pst.executeQuery();
		List<Category> categorys = new ArrayList<Category>();
		while(rs.next()){
			Category c = new Category();
			c.setCatName(rs.getString("catname"));
			c.setCid(rs.getInt("cid"));
			c.setCount(rs.getInt("count"));
			c.setParentId(rs.getInt("parentid"));
			c.setKeywords(rs.getString("keywords"));
			categorys.add(c);
		}
		return categorys;
	}
	
	public List<Category> findChildren(int cid) throws Exception{
		String sql = "select * from category where parentid = ?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, cid);
		ResultSet rs = pst.executeQuery();
		List<Category> categories = new ArrayList<Category>();
		while(rs.next()){
			Category c = new Category();
			c.setCatName(rs.getString("catname"));
			c.setCid(rs.getInt("cid"));
			c.setCount(rs.getInt("count"));
			c.setParentId(rs.getInt("parentid"));
			c.setKeywords(rs.getString("keywords"));
			categories.add(c);
		}
		return categories;
	}
}
