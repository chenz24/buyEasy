package service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import dao.AdminDao;
import dao.impl.AdminDaoImpl;
import entity.Category;



import service.AdminService;
import util.DBUtil;
import util.Tree;

public class AdminServiceImpl implements AdminService{
	//后台设置
	public Map<String, String> configs() throws Exception{
		AdminDao dao = new AdminDaoImpl();
		Map<String, String> configs = dao.findConfigs();
		return configs;
	}
	//后台设置更新
	public void updateConfig(Map<String, String> configs) throws Exception{
		AdminDao dao = new AdminDaoImpl();
		Iterator it = configs.entrySet().iterator();
		while(it.hasNext()){
			Map.Entry entry = (Map.Entry) it.next();
			String key = (String) entry.getKey();
			String value = (String) entry.getValue();
			dao.updateConfig(key,value);							
			System.out.println(key);
		}
	}
	//栏目添加
	public void categoryAdd(Category category) throws Exception{
		AdminDao dao = new AdminDaoImpl();
		dao.categoryAdd(category);
	}
	//栏目option没写到dao里
	public Map<Integer, String> catOptions() throws Exception{
		AdminDao dao = new AdminDaoImpl();
		List<Category> list = dao.findAll();
		Tree catTree = new Tree();
		Iterator it = list.iterator();
		while(it.hasNext()){
			Category c = (Category) it.next();
			catTree.setNode(c.getCid(), c.getParentId(), c);
		}
		catTree.getList(0);
		Map<Integer, String> categorys = new LinkedHashMap<Integer, String>();
		it = catTree.getTree().iterator();
		System.out.println(catTree.getTree().toString());//debug
		while(it.hasNext()){
			Category c = (Category) it.next();
			int layer = catTree.getLayer(c.getCid());
			String pre = "";
			for(int i=0;i<layer;i++){
				pre = pre + "|---";
			}
			c.setCatName(pre + c.getCatName());
			categorys.put(c.getCid(), c.getCatName());
		}
		return categorys;		
	}
	//栏目列表
	public List<Category> findAll() throws Exception{
		AdminDao dao = new AdminDaoImpl();
		List<Category> list = dao.findAll();
		Tree catTree = new Tree();
		Iterator it = list.iterator();
		while(it.hasNext()){
			Category c = (Category) it.next();
			catTree.setNode(c.getCid(), c.getParentId(), c);
		}
		catTree.getList(0);
		it = catTree.getTree().iterator();
		list.clear();
		while(it.hasNext()){
			Category c = (Category) it.next();
			int layer = catTree.getLayer(c.getCid());
			String pre = "";
			for(int i=0;i<layer;i++){
				pre = pre + "|---";
			}
			c.setCatName(pre + c.getCatName());
			list.add(c);
		}
		return list;
	}
	//栏目编辑
	public Category findById(int id) throws Exception{
		AdminDao dao = new AdminDaoImpl();
		Category c = dao.findById(id);
		return c;
	}
	//栏目编辑入库
	public void modify(int id,Category c) throws Exception{
		AdminDao dao = new AdminDaoImpl();
		dao.modify(id, c);
	}
	//栏目删除
	public void delete(int id) throws Exception{
		AdminDao dao = new AdminDaoImpl();
		dao.delete(id);
	}
}
