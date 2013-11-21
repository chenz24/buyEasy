package service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.junit.Test;

import dao.AdminDao;
import dao.CategoryDao;
import dao.impl.AdminDaoImpl;

import service.CategoryService;
import util.Tree;

import entity.Category;

public class CategoryServiceImpl implements CategoryService{
	
	/**
	 * 根据节点取得树
	 */
	public List<Category> CatTree(int nodeId) throws Exception{
		AdminDao dao = new AdminDaoImpl();
		List<Category> catTree = dao.findAll();
		Tree tree = new Tree();
		Iterator it = catTree.iterator();
		while(it.hasNext()){
			Category c = (Category) it.next();
			tree.setNode(c.getCid(), c.getParentId(), c);
		}
		tree.getList(nodeId);
		catTree.clear();//清空以重复使用
		it = tree.getTree().iterator();
		while(it.hasNext()){
			Category c = (Category) it.next();
			c.setLayer(tree.getLayer(c.getCid()));
			catTree.add(c);
		}
		return catTree;
	}
	

	public String position(int id) throws Exception {
		CategoryDao dao = new CategoryDao();
		Category c = dao.findById(id);
		String current = "<a href='list.do?catid=" + c.getCid() + "'>" + c.getCatName() + "</a>";
		//System.out.println(position);
		//递归
		String str = "";
		if(c.getParentId()!=0){
			str += position(c.getParentId());
		}
		str += current;
		return str;
	}
	
	public Category findById(int id) throws Exception{
		CategoryDao dao = new CategoryDao();
		Category c = dao.findById(id);
		return c;
	}
	
	public List<Category> findSiblings(int pid) throws Exception{
		CategoryDao dao = new CategoryDao();
		List<Category> categorys = dao.findSiblings(pid);
		return categorys;
	}
	@Test
	public String findChildrenIds(int cid) throws Exception{
		List<Category> list = CatTree(cid);
		Iterator it = list.iterator();
		String ids = cid + "";
		while(it.hasNext()){
			Category c = (Category)it.next();
			ids += "," + c.getCid();
		}
		return ids;
	}
	
	public static void main(String[] args){
		CategoryServiceImpl cat = new CategoryServiceImpl();
		try{
			List<Category> list = cat.CatTree(0);		
			System.out.println("------树形分类菜单------");
			System.out.println();
			Iterator<Category> it = list.iterator();
			while(it.hasNext()){
				Category c = it.next();
				for(int i=0;i<c.getLayer();i++){
					System.out.print("|---");
				}
				System.out.println(c.getCatName());
			}
			String str = cat.position(22);		
			System.out.println(str);
			System.out.println(cat.findChildrenIds(22));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
