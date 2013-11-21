package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import service.CategoryService;
import service.impl.CategoryServiceImpl;
import util.DBUtil;

import dao.AdminDao;
import entity.Category;
import entity.Config;

public class AdminDaoImpl implements AdminDao{
	
	
	public Map<String, String> findConfigs() throws Exception{
		String sql = "select * from config";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		//List<Config> configs = new ArrayList<Config>();
		Map<String, String> configs = new HashMap<String, String>();
		while(rs.next()){
			configs.put(rs.getString("varname"), rs.getString("value"));
		}
		return configs;
	}
	
	public void updateConfig(String key,String value) throws Exception{
		String sql = "update config set value=? where varname=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, value);
		pst.setString(2, key);
		pst.executeUpdate();
		DBUtil.closeConnection();
	}
	
	public void categoryAdd(Category category) throws Exception{
		String sql = "insert into category (parentid,catname,model,description,keywords,ishidden,content,listOrder) values (?,?,?,?,?,?,?,?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, category.getParentId());
		pst.setString(2, category.getCatName());
		pst.setString(3, category.getModel());
		pst.setString(4, category.getDescription());
		pst.setString(5, category.getKeywords());
		pst.setBoolean(6, category.isHidden());
		pst.setString(7, category.getContent());
		pst.setInt(8, category.getListOrder());
		pst.executeUpdate();
		//获取自增的id
		ResultSet rs = pst.getGeneratedKeys();
		rs.next();
		int cid = rs.getInt(1);
		category.setCid(cid);
		DBUtil.closeConnection();
	}
	//返回一个分类列表
	public List<Category> findAll() throws Exception{
		Connection conn = DBUtil.getConnection();
		String sql = "select * from category order by listorder desc";
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		List<Category> list = new ArrayList<Category>();
		while(rs.next()){
			Category c = new Category();
			c.setCid(rs.getInt("cid"));
			c.setCatName(rs.getString("catname"));
			c.setContent(rs.getString("content"));
			c.setDescription(rs.getString("description"));
			c.setKeywords(rs.getString("keywords"));
			c.setListOrder(rs.getInt("listorder"));
			c.setModel(rs.getString("model"));
			c.setCount(rs.getInt("count"));
			c.setParentId(rs.getInt("parentid"));
			list.add(c);
		}
		DBUtil.closeConnection();
		return list;
	}
	//根据id查找分类
	public Category findById(int id) throws Exception{
		Connection conn = DBUtil.getConnection();
		String sql = "select * from category where cid = ?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery(); 
		Category c = new Category();
		if(rs.next()){
			c.setCid(rs.getInt("cid"));
			c.setCatName(rs.getString("catname"));
			c.setContent(rs.getString("content"));
			c.setDescription(rs.getString("description"));
			c.setKeywords(rs.getString("keywords"));
			c.setListOrder(rs.getInt("listorder"));
			c.setModel(rs.getString("model"));
			c.setCount(rs.getInt("count"));
			c.setParentId(rs.getInt("parentid"));		
		}
		DBUtil.closeConnection();
		return c;		
	}
	//栏目编辑入库
	public void modify(int id,Category c) throws Exception{
		Connection conn = DBUtil.getConnection();
		String sql="update category set catname=?,parentid=?,model=?,description=?,keywords=?,seotitle=?,ishidden=?,listorder=?" +
		 			" where cid=?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, c.getCatName());
		pst.setInt(2, c.getParentId());
		pst.setString(3, c.getModel());
		pst.setString(4, c.getDescription());
		pst.setString(5, c.getKeywords());
		pst.setString(6, c.getKeywords());
		pst.setBoolean(7, c.isHidden());
		//pst.setString(7, c.getContent());
		pst.setInt(8, c.getListOrder());
		pst.setInt(9, id);
		pst.executeUpdate();
		DBUtil.closeConnection();
	}
	//删除栏目
	public void delete(int id) throws Exception{
		Connection conn = DBUtil.getConnection();
		CategoryService catServ = new CategoryServiceImpl();
		String cats = catServ.findChildrenIds(id);
		System.out.println(cats);//debug
		String sql = "delete from category where cid in (?)";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, cats);
		pst.executeUpdate();
		//删除栏目下的商品.暂无
		//sql = "delete from goods where catid int (?)";
		DBUtil.closeConnection();
	}


	public void statUpdate(int cid,int count) throws Exception {
		String sql = "update category set count = ? where cid=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, count);
		pst.setInt(2, cid);
		pst.executeUpdate();
		DBUtil.closeConnection();
	}
}
